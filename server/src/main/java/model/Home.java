package model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Filter;


@Entity
@Table(name = "Home")
//@Filter(name = "dateFilter", condition = "start_date <= :start_date and end_date >= :end_date")
//@Filter(name = "priceFilter", condition = "price_per_night <= :price_per_night")
//@Filter(name = "countryFilter", condition = "country = :country")
@NamedQueries({
    @NamedQuery(name = "Home.findById", query = "SELECT h FROM Home h WHERE h.id = :id"),
    @NamedQuery(name = "Home.findAll", query = "SELECT h FROM Home h"),
    @NamedQuery(name="Home.findPriceById", query = "SELECT h.pricePerNight FROM Home h WHERE h.id = :id"),
})

public class Home {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;
  @JsonBackReference(value = "host-home")
  @ManyToOne(cascade = CascadeType.MERGE)
  @JoinColumn(name = "host_id")//MANY homes to ONE host
  private Host host;

  @JsonManagedReference(value = "homes-address")
  @ManyToOne(cascade = CascadeType.MERGE)
  @JoinColumn(name = "address_id")
  private Address address;

  @JsonManagedReference(value = "home-booking-details")
  @OneToMany(mappedBy = "home")
  private List<BookingDetail> bookingDetails = new ArrayList<>();
  @JsonManagedReference(value = "home-images")
  @OneToMany(mappedBy = "home", cascade = CascadeType.MERGE)
  private List<HomeImage> images = new ArrayList<>();
  @JsonManagedReference(value = "home-histories")
  @OneToMany(mappedBy = "home", cascade=CascadeType.MERGE)
  private List<HomeHistoryLog> historyLogs = new ArrayList<>();
  @JsonManagedReference(value = "home-amenity")
  @OneToMany(mappedBy = "home", cascade= CascadeType.MERGE)
  private List<Amenity> amenities = new ArrayList<>();

  @Column(name = "price_per_night")
  private int pricePerNight;

  @Column(name = "start_date")
  private Timestamp startDate;

  @Column(name = "end_date")
  private Timestamp endDate;

  @Column(name = "updated_date")
  private Timestamp updatedDate;

  @Column(name = "created_date")
  private Timestamp createdDate;

  public Home(Host host, Address address, int pricePerNight, Timestamp startDate, Timestamp endDate,
      List<BookingDetail> bookingDetails, List<HomeImage> images,
      List<HomeHistoryLog> homeHistoryLogs, List<Amenity> amenities) {
    this.host = host;
    this.address = address;
    this.pricePerNight = pricePerNight;
    this.startDate = startDate;
    this.endDate = endDate;
    this.bookingDetails = bookingDetails;
    this.images = images;
    this.historyLogs = homeHistoryLogs;
    this.amenities = amenities;
  }

  public Home() {
  }

  @Override
  public String toString() {
    return "Home{" + "id =" + id + ", host =" + host + ", addressId =" + address + '\''
        + ", pricePerNight=" + pricePerNight + ", startDate='" + startDate + '\'' + ", endDate='"
        + endDate + '\'' + ", updatedDate='" + updatedDate + '\'' + ", createdDate='" + createdDate
        + '\'' + ", amenities= " + amenities + '}';
  }
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public Host getHost() {
    return host;
  }

  public void setHost(Host host) {
    this.host = host;
  }

  public Address getAddress() {
    return address;
  }

  public void setAddress(Address address) {
    this.address = address;
  }

  public int getPricePerNight() {
    return pricePerNight;
  }

  public void setPricePerNight(int pricePerNight) {
    this.pricePerNight = pricePerNight;
  }

  public Timestamp getStartDate() {
    return startDate;
  }

  public void setStartDate(Timestamp startDate) {
    this.startDate = startDate;
  }

  public Timestamp getEndDate() {
    return endDate;
  }

  public void setEndDate(Timestamp endDate) {
    this.endDate = endDate;
  }

  public Timestamp getUpdatedDate() {
    return updatedDate;
  }

  public void setUpdatedDate(Timestamp updatedDate) {
    this.updatedDate = updatedDate;
  }

  public Timestamp getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Timestamp createdDate) {
    this.createdDate = createdDate;
  }

  public List<BookingDetail> getBookingDetails() {
    return bookingDetails;
  }

  public void setBookingDetails(List<BookingDetail> bookingDetails) {
    this.bookingDetails = bookingDetails;
  }

  public List<HomeImage> getImages() {
    return images;
  }

  public void setImages(List<HomeImage> images) {
    this.images = images;
  }

  public List<HomeHistoryLog> getHistoryLogs() {
    return historyLogs;
  }

  public void setHistoryLogs(List<HomeHistoryLog> historyLogs) {
    this.historyLogs = historyLogs;
  }

  public List<Amenity> getAmenities() {
    return amenities;
  }

  public void setAmenities(List<Amenity> amenities) {
    this.amenities = amenities;
  }

}
