package routes;

import datatransforobject.UserCoreDTO;
import datatransforobject.UserLoginDTO;
import express.Express;
import java.util.Map;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.User;
import repository.UserRepository;
import utility.ManagerFactory;
import utility.Utility;

public class FunctionRoutes {

  private final Express app;
  private final EntityManagerFactory entityManagerFactory = ManagerFactory.getEntityManagerFactory(
      "User");
  private final EntityManager entityManager = entityManagerFactory.createEntityManager();
  private final UserRepository userRepository = new UserRepository(entityManager);

  public FunctionRoutes(Express app) {
    this.app = app;
    init();
  }

  private void init() {
    app.post("/api/register", (req, res) -> {
      try {
        UserCoreDTO user = req.body(UserCoreDTO.class);
        User exist = userRepository.findByEmail(user.getEmail());

        if (exist != null) {
          res.status(500).json(Map.of("error", "email already exist"));
          return;
        }
        //hashing password
        String hashedPassword = Utility.hash(user.getPassword());
        user.setPassword(hashedPassword);
        Optional<User> newUser = userRepository.save(user.convertToUser());
        req.session("current-user", user.getId());
        //To send a json
        res.status(201).json(Map.of("id", newUser.get().getId()));
      } catch (Exception e) {
        System.out.println(e);
        res.status(500).json(Map.of("error", "internal error"));
      }
    });

    app.post("/api/login", (req, res) -> {

      try {
        UserLoginDTO userCred = req.body(UserLoginDTO.class);
        UserCoreDTO exist = userRepository.login(userCred.getEmail());

        if (exist == null) {
          res.status(500).json(Map.of("error", "Check credentials"));
          return;
        }

        if (Utility.match(userCred.getPassword(), exist.getPassword())) {
          req.session("current-user", exist.getId());
          res.json("success");
        } else {
          res.json(Map.of("error", "Check credentials"));
        }
      } catch (Exception e) {
        System.out.println(e);
        res.status(500).json(Map.of("error", "internal error"));
      }
    });

    //check current user
    app.get("/api/whoami", (req, res) -> {
      res.json(req.session("current-user"));
    });

  }
}
