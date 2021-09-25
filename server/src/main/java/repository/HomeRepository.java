package repository;

import datatransforobject.HomeCoreNoHostDTO;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import model.Home;
import model.HomeView;
import repositoryinterface.HomeRepositoryInterface;

public class HomeRepository implements HomeRepositoryInterface {

  private final EntityManager entityManager;

  public HomeRepository(EntityManager entityManager) {
    this.entityManager = entityManager;
  }

  @Override
  public Optional<Home> findById(String ids) {
    int id = Integer.parseInt(ids);
    Home home = entityManager.find(Home.class, id);
    return home != null ? Optional.of(home) : Optional.empty();
  }

  public int findPriceById(int homeId){
    return entityManager.createNamedQuery("Home.findPriceById", Integer.class).setParameter("id", homeId).getSingleResult();
  }

  @Override
  public List<HomeView> findAll() {
    return entityManager.createNamedQuery("HomeView.findAll").getResultList();
  }

  public List<Home> bulkFind(String query) {
    return entityManager.createQuery(query, Home.class).getResultList();
  }

  @Override
  public Optional<Home> save(Home home) {
    try {
      entityManager.getTransaction().begin();
      entityManager.merge(home);
      entityManager.getTransaction().commit();
      return Optional.of(home);
    } catch (Exception e) {
      e.printStackTrace();
      return Optional.empty();
    }
  }
}
