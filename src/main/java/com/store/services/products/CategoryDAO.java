package com.store.services.products;

import com.store.model.products.Category;
import com.store.services.DAO.ConnectionDB;
import com.store.services.DAO.IServiceDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CategoryDAO implements IServiceDAO<Category> {

    private static Map<Integer, Category> mapCategory = new HashMap<>();


    private static final int COLUMN_ID = 1;
    private static final int COLUMN_NAME = 2;

    private static int MAX_ID_IN_DATABASE = 0;

    static{
        initGetAllCategory();
        Category.setCurrentID(MAX_ID_IN_DATABASE);
    }

    private static void initGetAllCategory(){
        final String SQL_SELECT_ALL = "SELECT * FROM category";

        Connection connection = ConnectionDB.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL);
            while(resultSet.next()){
                int id = resultSet.getInt(COLUMN_ID);
                MAX_ID_IN_DATABASE = Math.max(MAX_ID_IN_DATABASE, id);
                String categoryName = resultSet.getString(COLUMN_NAME);
                Category category = new Category(id, categoryName);
                mapCategory.put(id, category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    @Override
    public boolean insert(Category object) {
        return false;
    }

    @Override
    public boolean update(Category object) {
        return false;
    }

    @Override
    public boolean delete(Category object) {
        return false;
    }

    @Override
    public boolean isExitsID(int id) {
        return mapCategory.containsKey(id);
    }

    @Override
    public Category getInstanceByID(int id) {
        if(isExitsID(id)){
            return mapCategory.get(id);
        }
        return null;
    }


}
