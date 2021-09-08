package com.store.model.products;

public class ImageProduct {
    private int id;
    private String imageLink;


    public ImageProduct() {

    }

    public ImageProduct(int id, String imageLink) {
        this.id = id;
        this.imageLink = imageLink;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
}
