package routes;

import datatransforobject.HomeAddressDTO;
import datatransforobject.HomeCoreDTO;
import express.Express;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import model.Home;
import model.HomeHistoryLog;
import model.HomeView;
import service.HomeService;

public class HomeRoutes {

  private final Express app;
  private final HomeService homeService;

  public HomeRoutes(Express app) {
    this.app = app;
    this.homeService = new HomeService();
    this.init();
  }

  private void init() {
    app.get("rest/home/:id", (req, res) -> {
      try {
        String id = req.params("id");
        Optional<HomeCoreDTO> home = homeService.getById(id);
        res.json(home.isPresent() ? home.get() : "No home with that id");
      } catch (Exception e) {
        res.status(500).send("Internal error");
      }
    });
    app.get("rest/home/:id/history", (req, res) -> {
      try {
        String id = req.params("id");
        List<HomeHistoryLog> history = homeService.getByHomeId(id);
        res.json(history);
      } catch (Exception e) {
        res.status(500).json("internal error");
      }
    });

    /* Filer by price or by date.
     ** price=?
     ** start_date=d/M/yyyy
     ** end_date = d/M/yyyy
     */
    app.get("rest/homes", (req, res) -> {
      try {
        Map<String, List<String>> filters = req.query();
        List<HomeView> homes = homeService.getAll(filters);
        res.json(homes);
      } catch (Exception e) {
        System.out.println(e);
        res.status(500).json("internal error");
      }
    });

    app.post("rest/homes", (req, res) -> {
      String sessionID = req.cookie("sessionID");
      HomeAddressDTO dto = req.body(HomeAddressDTO.class);
      Optional<Home> home = homeService.createHome(sessionID, dto);
      res.json(home.get());

    });

    app.put("rest/homes/:id", (req, res) -> {
      try {
        String id = req.params("id");
        HomeAddressDTO dto = req.body(HomeAddressDTO.class);
        Optional<Home> home = homeService.updateHome(id, dto);
        res.json(home.get());
      } catch (Exception e) {
        res.status(500).send("Internal error");
      }
    });


  }

}

