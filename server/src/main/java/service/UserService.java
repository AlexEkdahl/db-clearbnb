package service;

import static java.util.stream.Collectors.toList;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import database.Redis;
import datatransferobject.ReviewBasicDTO;
import datatransferobject.UserCompleteProfileDTO;
import datatransferobject.UserCoreDTO;
import datatransferobject.UserLoginDTO;
import datatransferobject.UserNameIdDTO;
import datatransferobject.UserProfileDTO;
import io.javalin.plugin.json.JavalinJackson;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import mapper.ReviewMapper;
import mapper.UserMapper;
import model.BookingDetail;
import model.Host;
import model.Renter;
import model.Review;
import model.User;
import redis.clients.jedis.Jedis;
import repository.BookingDetailRepository;
import repository.HostRepository;
import repository.RenterRepository;
import repository.ReviewRepository;
import repository.UserRepository;
import utility.ManagerFactory;
import utility.Utility;

public class UserService {

  private final EntityManagerFactory entityManagerFactory = ManagerFactory.getEntityManagerFactory(
      "User");
  private final EntityManager entityManager = entityManagerFactory.createEntityManager();
  private final UserRepository userRepository = new UserRepository(entityManager);
  private final RenterRepository renterRepository = new RenterRepository(entityManager);
  private final BookingDetailRepository bookingDetailRepository = new BookingDetailRepository(
      entityManager);
  private final ReviewRepository reviewRepository = new ReviewRepository(entityManager);
  private final HostRepository hostRepository = new HostRepository(entityManager);
  private final Jedis redis = Redis.getConnection();


  public UserService() {
  }

  public Optional<User> getById(String id) {
    Optional<User> userDO = userRepository.findById(id);
    return userDO;
  }

  public List<User> getAllWithEverything() {
    List<User> users = userRepository.findAll();
    users.forEach(UserMapper::hidePasswordFromUser);
    return users;
  }

  public List<UserNameIdDTO> getAllNames() throws JsonProcessingException {
    if (redis.exists("names")) {
      List<UserNameIdDTO> list = JavalinJackson.getObjectMapper()
          .readValue(redis.get("names"), new TypeReference<>() {
          });
      return list;
    }
    List<User> users = userRepository.findAll();
    List<UserNameIdDTO> list = users.stream().map(UserMapper::convertToNameAndId).collect(toList());
    redis.set("names", JavalinJackson.getObjectMapper().writeValueAsString(list));
    return list;
  }

  public Optional<UserCoreDTO> registerUser(UserCoreDTO user) {
    Optional<User> exist = userRepository.findByEmail(user.getEmail());
    if (exist.isEmpty()) {
      String hashedPassword = Utility.hash(user.getPassword());
      user.setPassword(hashedPassword);
      Optional<User> createdUser = userRepository.save(user.convertToUser());
      if (createdUser.isPresent()) {
        //To send a json
        UserCoreDTO createdUserCoreDTO = UserMapper.convertToCoreDTOWithoutPassword(
            createdUser.get());
        redis.getDel("names");
        return Optional.of(createdUserCoreDTO);
      }
    }
    return Optional.empty();
  }

  public UserCoreDTO checkUserCredentials(UserLoginDTO userLoginDTO) {
    UserCoreDTO userCoreDTO = userRepository.login(userLoginDTO.getEmail());
    if (userCoreDTO == null) {
      return null;
    }
    if (!Utility.match(userLoginDTO.getPassword(), userCoreDTO.getPassword())) {
      return null;
    }
    userCoreDTO.setPassword("***");
    return userCoreDTO;
  }

  public UserCoreDTO findByIdAndReturnUserCoreDTO(String userId) throws Exception {
    Optional<User> user = userRepository.findById(userId);
    if (user.isEmpty()) {
      throw new Exception();
    }
    UserCoreDTO userCoreDTO = user.get().convertToUserCoreDTO();
    userCoreDTO.setPassword("***");
    return userCoreDTO;
  }

  public UserProfileDTO getUserProfile(String userId) {
    Optional<User> user = userRepository.findById(userId);
    if (user.isEmpty()) {
      return null;
    }

    return UserMapper.convertToProfile(user.get());
  }

  public Review createHostReview(String userId, ReviewBasicDTO dto, String hostUserID) {
    int hostUserId = Integer.parseInt(hostUserID);
    Optional<Host> host = hostRepository.findByUserId(hostUserId);
    List<Review> hostReviews = host.get().getReviews();
    Review review = this.findUserDetailsAndConvertToReview(userId, dto);
    hostReviews.add(review);
    host.get().setReviews(hostReviews);
    Optional<Host> savedHost = hostRepository.save(host.get());
    return review;
  }

  public UserCompleteProfileDTO getUserCompleteProfile(String userId) {
    Optional<User> user = userRepository.findById(userId);
    if (user.isEmpty()) {
      return null;
    }
    return UserMapper.convertToCompleteProfile(user.get());
  }

  public Review createRenterReview(String userID, ReviewBasicDTO dto, String renterUserID) {
    int renterUserId = Integer.parseInt(renterUserID);
    Optional<Renter> renter = renterRepository.findByUserId(renterUserId);
    Review review = this.findUserDetailsAndConvertToReview(userID, dto);
    List<Review> renterReviews = renter.get().getReviews();
    renterReviews.add(review);
    renter.get().setReviews(renterReviews);
    Optional<Renter> savedRenter = renterRepository.save(renter.get());
    return review;
  }

  public Review findUserDetailsAndConvertToReview(String userId, ReviewBasicDTO dto) {
    Optional<User> creator = userRepository.findById(userId);
    Optional<BookingDetail> bookingDetail = bookingDetailRepository.findById(
        dto.getBookingDetailId());
    return ReviewMapper.convertToReview(dto, creator.get(), bookingDetail.get());
  }


  public Optional<Integer> deleteReview(String reviewID, String userId) {
    int reviewId = Integer.parseInt(reviewID);
    Optional<Review> review = reviewRepository.findById(reviewId);
    if (review.isEmpty() || !userId.equals(String.valueOf(review.get().getCreatorId()))) {
      return Optional.empty();
    }

    Optional<Integer> updatedReview = reviewRepository.update(reviewId);
    return updatedReview;
  }

}
