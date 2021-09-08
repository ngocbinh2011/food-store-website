package com.store.services.products;

import com.store.model.products.Category;
import com.store.model.products.ImageProduct;
import com.store.model.products.Product;
import com.store.model.products.Provider;
import com.store.services.DAO.ConnectionDB;
import com.store.services.DAO.IServiceDAO;
import com.store.utils.Constant;

import java.sql.*;
import java.util.*;

public class ProductDAO implements IServiceDAO<Product> {
    private static Map<Integer, Product> mapProduct = new LinkedHashMap<>();
    private static List<Product> listProduct = new ArrayList<>();


    private static final int COLUMN_ID = 1;
    private static final int COLUMN_PRODUCT_NAME = 2;
    private static final int COLUMN_PRODUCT_DESCRIBE = 3;
    private static final int COLUMN_PRODUCT_PRICE = 4;
    private static final int COLUMN_PRODUCT_AMOUNT = 5;
    private static final int COLUMN_CATEGORY = 6;
    private static final int COLUMN_PROVIDER = 7;
    private static final int COLUMN_ADMIN = 8;

    private static int MAX_ID_IN_DATABASE = 0;

    public ProductDAO(){

    }

    static{
        initGetAllProduct();
        Product.setCurrentID(MAX_ID_IN_DATABASE);
    }


    private static void initGetAllProduct(){
        final String SQL_SELECT_ALL = "SELECT * FROM product";

        Connection connection = ConnectionDB.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resutlSet = statement.executeQuery(SQL_SELECT_ALL);
            while (resutlSet.next()){
                int id = resutlSet.getInt(COLUMN_ID);
                MAX_ID_IN_DATABASE = Math.max(MAX_ID_IN_DATABASE, id);
                String name = resutlSet.getString(COLUMN_PRODUCT_NAME);
                String describe = resutlSet.getString(COLUMN_PRODUCT_DESCRIBE);
                int price = resutlSet.getInt(COLUMN_PRODUCT_PRICE);
                int amount = resutlSet.getInt(COLUMN_PRODUCT_AMOUNT);
                int categoryID = resutlSet.getInt(COLUMN_CATEGORY);
                int providerID = resutlSet.getInt(COLUMN_PROVIDER);
                int adminID = resutlSet.getInt(COLUMN_ADMIN);
                Category category = (new CategoryDAO()).getInstanceByID(categoryID);
                Provider provider = (new ProviderDAO()).getInstanceByID(providerID);
                List<ImageProduct> listImage = (new ImageProductDAO()).getListImage(id);
                Product product = new Product(id, name, describe, price, amount, category, listImage, provider);
                mapProduct.put(id, product);
                listProduct.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Product> getListProductBestSeller(){
        final String SQL_GET_PRODUCT_BEST_SELLER = "SELECT product_id, sum(order_amount) AS total FROM " + " " +
                "product AS p INNER JOIN orders AS o ON p.id = o.product_id AND o.order_pay = 1" + " " +
                "GROUP BY product_id ORDER BY total DESC LIMIT" + " " + Constant.AMOUNT_PRODUCT_BEST_SELLER;

        List<Product> list = new ArrayList<>();
        Connection connection = ConnectionDB.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_GET_PRODUCT_BEST_SELLER);
            while(resultSet.next()){
                int productID = resultSet.getInt(COLUMN_ID);
                list.add(mapProduct.get(productID));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getListProductSearch(String searchCommand){
        if(searchCommand == null || searchCommand.isEmpty()){
            return new ArrayList<Product>();
        }
        String[] arr = searchCommand.split(" ");
        List<Product> result = new ArrayList<>();

        for(Product product: listProduct){
            for(String string: arr){
                if(product.getName().contains(string)){
                    result.add(product);
                    break;
                }
            }
        }
        return result;
    }

    @Override
    public boolean insert(Product object) {
        return false;
    }

    @Override
    public boolean update(Product object) {
        return false;
    }

    @Override
    public boolean delete(Product object) {
        return false;
    }

    @Override
    public boolean isExitsID(int id) {
        return mapProduct.containsKey(id);
    }

    @Override
    public Product getInstanceByID(int id) {
        if(isExitsID(id)){
            return mapProduct.get(id);
        }
        return null;
    }


    public List<Product> getAll() {
        return listProduct;
    }

    public List<Product> getSubListProduct(int left, int right){
        return listProduct.subList(left, right);
    }

    public int getAmountProduct(){
        return mapProduct.size();
    }

}
