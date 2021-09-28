package model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import utility.AmenityEnumConverter;

@Entity
@Table(name = "amenity_enum")
@NamedQueries({
    @NamedQuery(name="Amenity.deleteAllByHome", query = "DELETE FROM Amenity a WHERE a.home = :home")
})
public class Amenity {

    public enum AmenityEnum {
        WIFI, KITCHEN, PARKING, BATH
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @JsonBackReference(value = "home-amenity")
    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "home_id")
    private Home home;

    @Column(name = "amenity")
    @Convert(converter = AmenityEnumConverter.class)
    private AmenityEnum amenityEnum;

    public Amenity(int id, Home home, AmenityEnum amenityEnum) {
        this.id = id;
        this.home = home;
        this.amenityEnum = amenityEnum;
    }

    public Amenity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Home getHome() {
        return home;
    }

    public void setHome(Home home) {
        this.home = home;
    }

    public AmenityEnum getAmenity() {
        return amenityEnum;
    }

    public void setAmenity(AmenityEnum amenityEnum) {
        this.amenityEnum = amenityEnum;
    }

    @Override
    public String toString() {
        return "Amenity{" + "id=" + id + ", amenity='" + amenityEnum + '\'' + '}';
    }

}
