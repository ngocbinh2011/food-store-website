package com.store.services.transactions;

import com.store.model.customers.Customer;
import com.store.model.customers.User;
import com.store.model.products.Product;
import com.store.model.transactions.Orders;
import com.store.services.DAO.ConnectionDB;
import com.store.services.DAO.IServiceDAO;
import com.store.services.products.ProductDAO;
import com.store.utils.Constant;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrdersDAO implements IServiceDAO<Orders> {

    public List<Orders> getListOrderOfUser(User user){
        final String SQL_GET_LIST_ORDERS_OF_USER = "SELECT id, product_id, order_amount FROM orders" + " " +
                "WHERE user_id = ? AND order_pay = 0;";
        List<Orders> list = new ArrayList<>();
        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_GET_LIST_ORDERS_OF_USER);
            preparedStatement.setInt(1, user.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int orderId = resultSet.getInt(1);
                int productId = resultSet.getInt(2);
                int amount = resultSet.getInt(3);
                ProductDAO productDAO = new ProductDAO();
                Orders orders = new Orders(orderId, productDAO.getInstanceByID(productId), amount, false); // isPay = false because orders is not be pay
                list.add(orders);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean insert(Orders order) {
        final String SQL_INSERT_NEW_ORDER = "INSERT INTO orders(order_date, order_amount, order_pay, product_id, user_id)" + " " +
                "VALUES(?,?,?,?,?)";

        Date date = new java.util.Date();
        Timestamp timeOrder = new Timestamp(date.getTime());

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_NEW_ORDER);
            preparedStatement.setTimestamp(1, timeOrder);
            preparedStatement.setInt(2, order.getAmount());
            preparedStatement.setInt(3, 0); // order_pay = 0 because product not be pay
            preparedStatement.setInt(4, order.getProduct().getId());
            preparedStatement.setInt(5, order.getUser().getId());

            preparedStatement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Orders order) {
        final String SQL_UPDATE_ORDER = "UPDATE orders SET order_date = ?, order_amount = order_amount + ?, order_pay = ?" + " " +
                "WHERE user_id = ? and product_id = ? and order_pay = 0";

        Date date = new java.util.Date();
        Timestamp timeOrder = new Timestamp(date.getTime());

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_UPDATE_ORDER);
            preparedStatement.setTimestamp(1, timeOrder);
            preparedStatement.setInt(2, order.getAmount());
            preparedStatement.setInt(3, order.isPay()? 1 : 0); // order_pay = 0 if product not be pay
            preparedStatement.setInt(4, order.getUser().getId());
            preparedStatement.setInt(5, order.getProduct().getId());
            int countRowUpdated = preparedStatement.executeUpdate();
            if(countRowUpdated > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean delete(int orderId){
        final String SQL_DELETE_ORDER = "DELETE FROM orders WHERE id = ?";

        Connection connection = ConnectionDB.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_DELETE_ORDER);
            preparedStatement.setInt(1, orderId);
            preparedStatement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(Orders orders) {
        return false;
    }

    @Override
    public boolean isExitsID(int id) {
        return false;
    }

    @Override
    public Orders getInstanceByID(int id) {
        return null;
    }

    public long getTotalPrice(List<Orders> list){
        long total = 0;
        for(Orders orders: list){
            total += (long)orders.getProduct().getPrice() * orders.getAmount();
        }
        return total;
    }

}
