package com.store.controller.cart;

import com.store.controller.Shared.Common;
import com.store.services.transactions.OrdersDAO;
import com.store.utils.Constant;
import com.sun.org.apache.xpath.internal.operations.Or;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

//@WebServlet(name = "DeleteOrder", value = "/DeleteOrder")
public class DeleteOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("oid");
        String regexProductId = "^[0-9]{1,9}$";
        if(orderID == null || !Common.isMatchesRegex(orderID, regexProductId)){
            response.sendRedirect(request.getContextPath() + Constant.URL_HOME);
            return;
        }
        OrdersDAO ordersDAO = new OrdersDAO();

        int orderId = Integer.parseInt(orderID);
        boolean isSuccess = ordersDAO.delete(orderId);
        response.sendRedirect(request.getContextPath() + Constant.URL_CART);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
