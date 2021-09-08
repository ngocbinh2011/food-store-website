package com.store.services.products;


import com.store.model.products.ImageProduct;
import com.store.services.DAO.ConnectionDB;
import com.store.services.DAO.IServiceDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.util.List;

public class ImageProductDAO implements IServiceDAO<ImageProduct> {
    private static Map<Integer, List<ImageProduct>> mapImage = new HashMap<>(); // map<productID, list<Image>>


    private static final int COLUMN_ID = 1;
    private static final int COLUMN_IMAGE_LINK = 2;
    private static final int COLUMN_PRODUCT_ID = 3;

    private static int MAX_ID_IN_DATABASE = 0;

    static{
        initGetAllImage();

    }

    private static void initGetAllImage(){
        final String SQL_SELECT_ALL = "SELECT * FROM image_product";

        Connection connection = ConnectionDB.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL);
            while(resultSet.next()){
                int id = resultSet.getInt(COLUMN_ID);
                MAX_ID_IN_DATABASE = Math.max(MAX_ID_IN_DATABASE, id);
                String imageLink = resultSet.getString(COLUMN_IMAGE_LINK);
                int productID = resultSet.getInt(COLUMN_PRODUCT_ID);
                ImageProduct imageProduct = new ImageProduct(id, imageLink);
                List<ImageProduct> list = new ArrayList<>();
                if(mapImage.containsKey(productID)){
                    list = mapImage.get(productID);
                }
                list.add(imageProduct);
                mapImage.put(productID, list);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public boolean insert(ImageProduct object) {
        return false;
    }

    @Override
    public boolean update(ImageProduct object) {
        return false;
    }

    @Override
    public boolean delete(ImageProduct object) {
        return false;
    }

    @Override
    public boolean isExitsID(int id) {
        return mapImage.containsKey(id);
    }

    @Override
    public ImageProduct getInstanceByID(int id) {
        return null;
    }

    public List<ImageProduct> getListImage(int productID){
        if(isExitsID(productID)){
            return mapImage.get(productID);
        }
        return null;
    }


}
