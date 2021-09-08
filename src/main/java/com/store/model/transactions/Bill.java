package com.store.model.transactions;

import com.store.model.customers.Customer;
import com.store.model.customers.ShipDetails;

import java.util.List;

public class Bill {
    private Customer custormer;
    private List<Orders> listOrder;

    public Bill() {

    }

    public Bill(Customer custormer, List<Orders> listOrder) {
        this.custormer = custormer;
        this.listOrder = listOrder;
    }

}
