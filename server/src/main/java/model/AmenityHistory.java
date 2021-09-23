package model;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import utility.AmenityEnumConverter;

@Entity
@Table(name = "amenity_enum_history_log")
public class AmenityHistory {

    public enum AmenityEnum {
        WIFI, KITCHEN, PARKING, BATH
    }

    @Id
    @GeneratedValue
    private int id;
    @ManyToOne
    @Column(name = "home_history_log_id")
    private int homeHistoryLogId;
    @Column(name = "amenity")
    @Convert(converter = AmenityEnumConverter.class)
    private AmenityEnum amenityEnum;

    public AmenityHistory(int id, int homeHistoryLogId, AmenityEnum amenityEnum) {
        this.id = id;
        this.homeHistoryLogId = homeHistoryLogId;
        this.amenityEnum = amenityEnum;
    }

    public AmenityHistory() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHomeHistoryLogId() {
        return homeHistoryLogId;
    }

    public void setHomeHistoryLogId(int homeHistoryLogId) {
        this.homeHistoryLogId = homeHistoryLogId;
    }

    public AmenityEnum getAmenityEnum() {
        return amenityEnum;
    }

    public void setAmenityEnum(AmenityEnum amenityEnum) {
        this.amenityEnum = amenityEnum;
    }

    @Override
    public String toString() {
        return "AmenityHistory{" + "id=" + id + ", homeHistoryLogId=" + homeHistoryLogId + ", amenityEnum=" + amenityEnum + '}';
    }

}


