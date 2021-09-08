package com.store.model.customers;

public class User {
    private int id;
    private String username;
    private String password;

    private static int currentId = 1;

    public User() {

    }

    public User(String username, String password) {
        this.id = ++currentId;
        this.username = username;
        this.password = password;
    }

    public User(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static int getCurrentId() {
        return currentId;
    }

    public static void setCurrentId(int currentId) {
        User.currentId = currentId;
    }
}
