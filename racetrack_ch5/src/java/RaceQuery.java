import java.util.Date;

public class RaceQuery {
    public enum DistanceOperator {AT_LEAST, EXACTLY, AT_MOST};

    private Date minDate;
    private Date maxDate;
    private String city;
    private String state;
    private Float distance;
    private DistanceOperator distanceOperator;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Float getDistance() {
        return distance;
    }

    public void setDistance(Float distance) {
        this.distance = distance;
    }

    public DistanceOperator getDistanceOperator() {
        return distanceOperator;
    }

    public void setDistanceOperator(DistanceOperator distanceOperator) {
        this.distanceOperator = distanceOperator;
    }

    public Date getMaxDate() {
        return maxDate;
    }

    public void setMaxDate(Date maxDate) {
        this.maxDate = maxDate;
    }

    public Date getMinDate() {
        return minDate;
    }

    public void setMinDate(Date minDate) {
        this.minDate = minDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
