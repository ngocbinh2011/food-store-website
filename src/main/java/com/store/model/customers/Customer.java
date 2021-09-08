package com.store.model.customers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Customer {
    private String email;
    private String name;
    private String phoneNumber;
    private String addressString;

    public Customer() {

    }

    public Customer(String name, String phoneNumber) {
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public Customer(String email, String name, String phoneNumber, String addressString) {
        this.email = email;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.addressString = addressString;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddressString() {
        return addressString;
    }

    public void setAddressString(String addressString) {
        this.addressString = addressString;
    }
}


