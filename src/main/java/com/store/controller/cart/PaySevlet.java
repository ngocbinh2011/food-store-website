package com.store.controller.cart;

import com.store.model.customers.Customer;
import com.store.model.customers.User;
import com.store.model.transactions.Orders;
import com.store.services.transactions.OrdersDAO;
import com.store.services.users.SessionDAO;
import com.store.utils.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "PaySevlet", value = "/PaySevlet")
public class PaySevlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(  "/" + Constant.JSP_FILE_ORDER_PAY);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderEmail = request.getParameter("orderEmail");
        String orderName = request.getParameter("orderName");
        String orderPhone = request.getParameter("orderPhone");
        String orderAddress = request.getParameter("orderAddress");
//        System.out.println(orderAddress + orderName + orderPhone);
        Customer customer = new Customer(orderEmail, orderName, orderPhone, orderAddress);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(session.getId());
        OrdersDAO ordersDAO = new OrdersDAO();
        List<Orders> listOrder = ordersDAO.getListOrderOfUser(user);

        request.setAttribute("customer", customer);
        request.setAttribute("listOrder", listOrder);
        String priceStringFormat = (new Orders()).toStringPriceFormat(ordersDAO.getTotalPrice(listOrder));
        request.setAttribute("total", priceStringFormat);
        listOrder.stream().forEach(order -> {
            order.setPay(true);
            order.setUser(user);
            ordersDAO.update(order);
        });
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/" + Constant.JSP_FILE_ORDER_SUCCESS);
        requestDispatcher.forward(request, response);

    }
}
