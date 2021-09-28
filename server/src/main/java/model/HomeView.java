package model;

import java.sql.Timestamp;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import model.Amenity.AmenityEnum;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Immutable;
import utility.AmenityEnumConverter;

@Entity
@Immutable
@Filter(name = "dateFilter", condition = "startDate <= :startDate and endDate >= :endDate")
@Filter(name = "priceFilter", condition = "pricePerNight <= :pricePerNight")
@Filter(name = "searchFilter", condition = "country LIKE '%' :country '%' OR city LIKE '%' :city '%' OR street LIKE '%' :street '%'")
@Filter(name = "amenityFilter", condition = "amenity = :amenity")

@NamedQueries({@NamedQuery(name = "HomeView.findAll", query = "SELECT h FROM HomeView h")})
public class HomeView {

  @Id
  @GeneratedValue
  private int id;
  private String country;
  private String city;
  private String street;
  private String zipCode;
  private int pricePerNight;
  private Timestamp startDate;
  private Timestamp endDate;
  @Convert(converter = AmenityEnumConverter.class)
  private AmenityEnum amenity;

  public HomeView() {
  }

  public AmenityEnum getAmenity() {
    return amenity;
  }

  public void setAmenity(AmenityEnum amenity) {
    this.amenity = amenity;
  }

  public String getZipCode() {
    return zipCode;
  }

  public void setZipCode(String zipCode) {
    this.zipCode = zipCode;
  }

  @Override
  public String toString() {
    return "HomeView{" + "id=" + id + ", country='" + country + '\'' + ", city='" + city + '\''
        + ", street='" + street + '\'' + ", pricePerNight=" + pricePerNight + ", startDate="
        + startDate + ", endDate=" + endDate + '}';
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getStreet() {
    return street;
  }

  public void setStreet(String street) {
    this.street = street;
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
}
