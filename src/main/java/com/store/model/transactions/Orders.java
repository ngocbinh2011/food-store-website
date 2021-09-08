package com.store.model.transactions;

import com.store.model.customers.Customer;
import com.store.model.customers.User;
import com.store.model.products.Product;

import java.util.Date;

public class Orders {
    private int id;
    private User user;
    private Product product;
    private Date dateOrder;
    private int amount;
    private boolean isPay;

    private static int currentID = 0;

    public Orders() {

    }

    public Orders(int id, Product product, int amount, boolean isPay) {
        this.id = id;
        this.product = product;
        this.amount = amount;
        this.isPay = isPay;
    }

    public Orders(Product product, int amount, boolean isPay) {
        this.product = product;
        this.amount = amount;
        this.isPay = isPay;
    }

    public Orders(int id, User user, Product product, Date dateOrder, int amount, boolean isPay) {
        this.id = id;
        this.user = user;
        this.product = product;
        this.dateOrder = dateOrder;
        this.amount = amount;
        this.isPay = isPay;
    }

    public Orders(User user, Product product, Date dateOrder, int amount, boolean isPay) {
        this(user, product, dateOrder, amount);
        this.isPay = isPay;
    }

    public Orders(User user, Product product, Date dateOrder, int amount) {
//        this.id = ++currentID;
        this.user = user;
        this.product = product;
        this.dateOrder = dateOrder;
        this.amount = amount;
        this.isPay = false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public boolean isPay() {
        return isPay;
    }

    public void setPay(boolean pay) {
        isPay = pay;
    }

    public static int getCurrentID() {
        return currentID;
    }

    public static void setCurrentID(int currentID) {
        Orders.currentID = currentID;
    }

    public String toStringPriceFormat(long price){
        String priceStr = Long.toString(price);
        String result = "";
        int len = 0;
        for(int i = priceStr.length() - 1; i >= 0; i--){
            if(len > 0 && len % 3 == 0){
                result = "." + result;
            }
            result = priceStr.charAt(i) + result;
            len++;
        }
        return result;
    }

}
