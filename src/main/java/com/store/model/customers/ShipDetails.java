package com.store.model.customers;

public class ShipDetails {
    private int id;
    private int apartmentNumber;
    private String wards;
    private String district;
    private String city;
    private String national;

    private static int currentID = 0;

    public ShipDetails() {

    }



    public ShipDetails(int apartmentNumber, String wards, String district, String city, String national) {
        this.id = ++currentID;
        this.apartmentNumber = apartmentNumber;
        this.wards = wards;
        this.district = district;
        this.city = city;
        this.national = national;
    }

    public ShipDetails(int id, int apartmentNumber, String wards, String district, String city, String national) {
        this.id = id;
        this.apartmentNumber = apartmentNumber;
        this.wards = wards;
        this.district = district;
        this.city = city;
        this.national = national;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getApartmentNumber() {
        return apartmentNumber;
    }

    public void setApartmentNumber(int apartmentNumber) {
        this.apartmentNumber = apartmentNumber;
    }

    public String getWards() {
        return wards;
    }

    public void setWards(String wards) {
        this.wards = wards;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNational() {
        return national;
    }

    public void setNational(String national) {
        this.national = national;
    }

    public static int getCurrentID() {
        return currentID;
    }

    public static void setCurrentID(int currentID) {
        ShipDetails.currentID = currentID;
    }
}
