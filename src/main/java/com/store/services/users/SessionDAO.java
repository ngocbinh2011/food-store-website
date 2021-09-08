package com.store.services.users;

import com.store.model.customers.SessionUser;
import com.store.model.customers.User;
import com.store.services.DAO.ConnectionDB;
import com.store.services.DAO.IServiceDAO;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class SessionDAO implements IServiceDAO<SessionUser> {

    private static final int COLUMN_ID = 1;
    private static final int COLUMN_SESION_ID = 2;
    private static final int COLUMN_DATE_CREATE = 3;
    private static final int COLUMN_DATE_END = 4;
    private static final int COLUMN_ACTIVE = 5;
    private static final int COLUMN_USER_ID = 6;

    public SessionUser getSessionUser(String jSessionID) {
        final String SQL_SELECT_SESSION_USER_BY_JSESSIONID = "SELECT * FROM session_info WHERE session_id = ?";

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_SESSION_USER_BY_JSESSIONID);
            preparedStatement.setString(1, jSessionID);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int id = resultSet.getInt(COLUMN_ID);
                String sessionID = resultSet.getString(COLUMN_SESION_ID);
                Timestamp dateStart = resultSet.getTimestamp(COLUMN_DATE_CREATE);
                Timestamp dateEnd = resultSet.getTimestamp(COLUMN_DATE_END);
                boolean isActive = resultSet.getBoolean(COLUMN_ACTIVE);
                int userID = resultSet.getInt(COLUMN_USER_ID);
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getInstanceByID(userID);
                java.util.Date dateCreate = new java.util.Date(dateStart.getTime());
                java.util.Date dateFis = new java.util.Date(dateEnd.getTime());
                return new SessionUser(id, sessionID, user, dateCreate, dateFis, isActive);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(SessionUser sessionUser) {
        final String SQL_INSERT_NEW_SESSION_USER = "INSERT INTO session_info(session_id, date_create, date_end, active, user_id)" + " "
                + "VALUES(?, ?, ?, ?, ?)";

        Calendar calendarStart = Calendar.getInstance();
        calendarStart.setTime(new Date());
        Calendar calendarEnd = Calendar.getInstance();
        calendarEnd.setTime(new Date());

        java.sql.Timestamp dateStart = new java.sql.Timestamp(calendarStart.getTime().getTime());
        java.sql.Timestamp dateEnd = new java.sql.Timestamp(calendarEnd.getTime().getTime());

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_NEW_SESSION_USER);
            preparedStatement.setString(1, sessionUser.getSessionID());
            preparedStatement.setTimestamp(2, dateStart);
            preparedStatement.setTimestamp(3, dateEnd);
            preparedStatement.setInt(4, 1);
            preparedStatement.setInt(5, sessionUser.getUser().getId());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(SessionUser sessionUser) {
        final String SQL_UPDATE_SESSION_USER = "UPDATE session_info SET date_create = ? WHERE session_id = ?";

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_UPDATE_SESSION_USER);
            Date date = new Date();
            String now = (new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(date);
            preparedStatement.setString(1, now);
            preparedStatement.setString(2, sessionUser.getSessionID());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(String sessionId){
        final String SQL_DELETE_SESSION = "DELETE FROM session_info WHERE session_id = ?";

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_DELETE_SESSION);
            preparedStatement.setString(1, sessionId);
            preparedStatement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(SessionUser object) {
        return false;
    }

    @Override
    public boolean isExitsID(int id) {
        return false;
    }

    @Override
    public SessionUser getInstanceByID(int id) {
        return null;
    }

}
