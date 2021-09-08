package com.store.model.products;

import com.store.model.customers.Customer;

public class Provider extends Customer {

    public static class Address{
        private String wards;
        private String district;
        private String city;

        public Address() {

        }

        public Address(String district, String city) {
            this.district = district;
            this.city = city;
        }

        public Address(String string){
//            String[] arr = string.split(" ");

        }

        public Address(String wards, String district, String city) {
            this(district, city);
            this.wards = wards;
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
    }

    private int id;
    private Address address;

    private static int currentID = 0;

    public Provider() {

    }

    public Provider(int id, String name, String phoneNumber, Address address) {
        super(name, phoneNumber);
        this.id = id;
        this.address = address;
    }


    public Provider(String name, String phoneNumber, Address address) {
        super(name, phoneNumber);
        this.id = ++currentID;
        this.address = address;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public static int getCurrentID() {
        return currentID;
    }

    public static void setCurrentID(int currentID) {
        Provider.currentID = currentID;
    }
}
