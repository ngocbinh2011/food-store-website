package com.store.services.users;

import com.store.model.customers.User;
import com.store.services.DAO.ConnectionDB;
import com.store.services.DAO.IServiceDAO;

import java.sql.*;
import java.util.List;

public class UserDAO implements IServiceDAO<User> {


    private static final int COLUMN_ID = 1;
    private static final int COLUMN_USERNAME = 2;
    private static final int COLUMN_PASSWORD = 3;

    @Override
    public User getInstanceByID(int id) {
        final String SQL_GET_USER_BY_ID = "SELECT * FROM user WHERE id = ?";

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_GET_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int userID = resultSet.getInt(COLUMN_ID);
                String username = resultSet.getString(COLUMN_USERNAME);
                String password = resultSet.getString(COLUMN_PASSWORD);
                return new User(userID, username, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isLoginSuccess(User user){
        if(user == null){
            return false;
        }
        final String SQL_CHECK_LOGIN = "SELECT * FROM user WHERE u_username = ? AND u_password = ?";

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_CHECK_LOGIN);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                user.setId(resultSet.getInt(COLUMN_ID));
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean insert(User object) {
        return false;
    }

    @Override
    public boolean update(User object) {
        return false;
    }

    @Override
    public boolean delete(User object) {
        return false;
    }

    @Override
    public boolean isExitsID(int id) {
        return false;
    }


}
