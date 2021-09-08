package com.store.services.products;


import com.store.model.products.Provider;
import com.store.services.DAO.ConnectionDB;
import com.store.services.DAO.IServiceDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProviderDAO implements IServiceDAO<Provider> {
    private static Map<Integer, Provider> mapProvider = new HashMap<>();


    private static final int COLUMN_ID = 1;
    private static final int COLUMN_NAME = 2;
    private static final int COLUMN_ADDRESS = 3;
    private static final int COLUMN_PHONE_NUMBER = 4;

    private static int MAX_ID_IN_DATABASE = 0;

    static{
        initGetAllProvider();
        Provider.setCurrentID(MAX_ID_IN_DATABASE);
    }

    private static void initGetAllProvider(){
        final String SQL_SELECT_ALL = "SELECT * FROM provider";

        Connection connection = ConnectionDB.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL);
            while (resultSet.next()){
                int id = resultSet.getInt(COLUMN_ID);
                MAX_ID_IN_DATABASE = Math.max(MAX_ID_IN_DATABASE, id);
                String name = resultSet.getString(COLUMN_NAME);
                String address = resultSet.getString(COLUMN_ADDRESS); // wards-district-city
                String phoneNumber = resultSet.getString(COLUMN_PHONE_NUMBER);
                Provider.Address pAddress =  new Provider.Address();
                Provider provider = new Provider(id, name, phoneNumber, pAddress);
                mapProvider.put(id, provider);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public boolean insert(Provider object) {
        return false;
    }

    @Override
    public boolean update(Provider object) {
        return false;
    }

    @Override
    public boolean delete(Provider object) {
        return false;
    }

    @Override
    public boolean isExitsID(int id) {
        return mapProvider.containsKey(id);
    }

    @Override
    public Provider getInstanceByID(int id) {
        if(isExitsID(id)){
            return mapProvider.get(id);
        }
        return null;
    }

}
