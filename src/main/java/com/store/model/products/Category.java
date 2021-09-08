package com.store.model.products;

public class Category {
    private int id;
    private String name;

    private static int currentID = 0;

    public Category() {

    }

    public Category(String name) {
        this.id = ++currentID;
        this.name = name;
    }

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static int getCurrentID() {
        return currentID;
    }

    public static void setCurrentID(int currentID) {
        Category.currentID = currentID;
    }


}
