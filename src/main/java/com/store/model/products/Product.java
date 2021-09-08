package com.store.model.products;

import java.util.List;
import java.util.regex.Pattern;

public class Product {
    private int id;
    private String name;
    private String describe;
    private int price;
    private int amount;
    private Category category;
    private List<ImageProduct> listImage;
    private Provider provider;
    private ImageProduct imageLinkAvatar;

    private static int currentID = 0;

    public Product() {

    }

    public Product(int id, String name, String describe, int price, int amount, Category category, List<ImageProduct> listImage, Provider provider) {
        this.id = id;
        this.name = name;
        this.describe = describe;
        this.price = price;
        this.amount = amount;
        this.category = category;
        this.listImage = listImage;
        this.provider = provider;
        this.imageLinkAvatar = listImage == null || listImage.isEmpty()? null : listImage.get(0);
    }

    public Product(String name, String describe, int price, int amount, Category category, List<ImageProduct> listImage, Provider provider) {
        this(name, price, amount, category);
        this.describe = describe;
        this.listImage = listImage;
        this.provider = provider;
        this.imageLinkAvatar = listImage.isEmpty()? null : listImage.get(0);
    }

    public Product(String name, int price, int amount, Category category) {
        this.id = ++currentID;
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.category = category;
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

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public long getPrice() {
        return (long)price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<ImageProduct> getListImage() {
        return listImage;
    }

    public void setListImage(List<ImageProduct> listImage) {
        this.listImage = listImage;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    public static int getCurrentID() {
        return currentID;
    }

    public static void setCurrentID(int currentID) {
        Product.currentID = currentID;
    }

    public ImageProduct getImageLinkAvatar() {
        return imageLinkAvatar;
    }

    public void setImageLinkAvatar(ImageProduct imageLinkAvatar) {
        this.imageLinkAvatar = imageLinkAvatar;
    }

    public static void main(String[] args) {
        String regexPathForCssFile = "^.*/css/.*\\.css$";
        String regexPathForJspFile = "^.*\\.jsp$";
        String input = "requestURI313012030@302))_==++!/food/cart.jsp";
        System.out.println(Pattern.compile(regexPathForJspFile).matcher(input).matches());
    }
}
