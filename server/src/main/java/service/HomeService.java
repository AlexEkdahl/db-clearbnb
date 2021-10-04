package service;

import com.fasterxml.jackson.core.JsonProcessingException;
import database.Redis;
import datatransferobject.HomeAddressDTO;
import datatransferobject.HomeCoreDTO;
import datatransferobject.HomeHistoryDTO;
import io.javalin.plugin.json.JavalinJackson;
import java.text.ParseException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import mapper.AddressMapper;
import mapper.HomeMapper;
import model.Address;
import model.Home;
import model.HomeHistoryLog;
import model.HomeView;
import model.Host;
import redis.clients.jedis.Jedis;
import repository.AmenityHistoryRepository;
import repository.HomeHistoryLogRepository;
import repository.HomeRepository;
import repository.HostRepository;
import utility.ManagerFactory;

public class HomeService {

  private final EntityManagerFactory entityManagerFactory = ManagerFactory.getEntityManagerFactory(
      "Home");
  private final EntityManager entityManager = entityManagerFactory.createEntityManager();
  private final HomeRepository homeRepository = new HomeRepository(entityManager);
  private final HomeHistoryLogRepository homeHistoryLogRepository = new HomeHistoryLogRepository(
      entityManager);
  private final AmenityHistoryRepository amenityHistoryRepository = new AmenityHistoryRepository(
      entityManager);
  private final HostRepository hostRepository = new HostRepository(entityManager);
  private final Jedis redis = Redis.getConnection();
  private final ActiveSessionService activeSessionService;

  public HomeService() {
    this.activeSessionService = new ActiveSessionService();
  }

  public Optional<HomeCoreDTO> getById(String id) throws JsonProcessingException {
    Optional<Home> homeDO = homeRepository.findById(id);
    if (homeDO.isEmpty()) {
      return Optional.empty();
    }

    HomeCoreDTO returnHome = HomeMapper.convertToCore(homeDO.get());
    redis.set("home" + id, JavalinJackson.getObjectMapper().writeValueAsString(returnHome));
    return Optional.of(returnHome);
  }

  public List getAll(Map<String, List<String>> filters)
      throws ParseException, JsonProcessingException {
    List<HomeView> homes = homeRepository.findAll(buildFilterQuery(filters), filters);

    //to get proper entities inc lists
    if (homes.size() > 0) {
      Set<Integer> list = new HashSet<>();
      homes.forEach(home -> {
        list.add(home.getId());
      });
      String query = buildGetByIdQuery(list);
      List<Home> homes1 = homeRepository.bulkFind(query);
      return HomeMapper.convertToNoHost(homes1);
    }
    return homes;
  }

  public Optional<HomeHistoryDTO> getId(String id) {
    Optional<HomeHistoryLog> homeHistoryDO = homeHistoryLogRepository.findById(id);
    if (homeHistoryDO.isEmpty()) {
      return Optional.empty();
    }
    return Optional.of(HomeMapper.convertToCore(homeHistoryDO.get()));
  }

  public List<HomeHistoryLog> getByHomeId(String homeId) {
    Optional<Home> homeOptional = homeRepository.findById(homeId);
    if (homeOptional.isEmpty()) {
      return null;
    }
    List<HomeHistoryLog> homeHistoryHomeId = homeOptional.get().getHistoryLogs();
    return homeHistoryHomeId;
  }

  public Optional<Home> createHome(String sessionID, HomeAddressDTO dto) {
    int userId = activeSessionService.getActiveSessionUserId(sessionID);
    Optional<Host> host = hostRepository.findByUserId(userId);
    if (host.isEmpty()) {
      return Optional.empty();
    }
    Home home = HomeMapper.convertToHome(dto, host.get());
    Address address = AddressMapper.convertToAddress(dto, home);
    home.setAddress(address);

    Optional<Home> savedHome = homeRepository.save(home, false);
    return savedHome;
  }

  public Optional<Home> updateHome(String id, HomeAddressDTO dto) {
    Optional<Home> oldValues = homeRepository.findById(id);

    Home newValues = HomeMapper.convertToHome(dto, oldValues.get().getHost());

    List<HomeHistoryLog> historyLogs = HomeMapper.convertHistory(oldValues.get());
    newValues.setHistoryLogs(historyLogs);
    newValues.setAddress(oldValues.get().getAddress());
    newValues.setId(oldValues.get().getId());
    
    Optional<Home> updatedHome = homeRepository.save(newValues, true);
    return Optional.of(updatedHome.get());


  }

  private String buildGetByIdQuery(Set<Integer> list) {
    StringBuilder query = new StringBuilder("SELECT h FROM Home h WHERE h.id = ");

    for (int nr : list) {
      query.append(nr).append(" OR h.id = ");
    }
    return query.toString().substring(0, query.length() - 11);
  }


  private String buildFilterQuery(Map<String, List<String>> filters) throws ParseException {

    StringBuilder query = new StringBuilder();
    query.append("SELECT " + "home.id AS id, " + "home.price_per_night AS pricePerNight, "
        + "home.start_date AS startDate, " + "home.end_date AS endDate, "
        + "address.country AS country, " + "address.street AS street, " + "address.city AS city, "
        + "address.zip_code AS zipCode, " + "amenity_enum.home_id AS hid, "
        + "amenity_enum.amenity AS amenity FROM home "
        + "LEFT JOIN address ON home.address_id = address.id "
        + "LEFT JOIN amenity_enum ON home.id = amenity_enum.home_id ");

    if (filters.isEmpty()) {
      return query.toString();
    }

    query.append("WHERE ");
    boolean firstIteration = true;

    for (Map.Entry<String, List<String>> entry : filters.entrySet()) {
      String key = entry.getKey();
      List<String> value = entry.getValue();
      // add and to new filter statement
      if (!firstIteration) {
        query.append(" AND");
      }

      switch (key) {
        case "price": {
          query.append(" home.price_per_night < :price");
          break;
        }
        case "start_date": {
          query.append(" home.start_date <= :start_date");
          break;
        }
        case "end_date": {
          query.append(" home.end_date >= :end_date");
          break;
        }
        case "amenity": {
          for (int i = 0; i < value.size(); i++) {
            if (i == 0) {
              query.append(" amenity = :am").append(i + 1);
            } else {
              query.append(" AND EXISTS ( SELECT 1 FROM amenity_enum t").append(i + 1)
                  .append(" WHERE t").append(i + 1).append(".home_id = home.id AND t").append(i + 1)
                  .append(".amenity = :am").append(i + 1).append(")");
            }
          }
          break;
        }
        case "search": {
          query.append(
              " address.country LIKE :search OR address.street LIKE :search  OR address.city LIKE  :search ");
        }
      }
      firstIteration = false;
    }
    return query.toString();
  }


}

