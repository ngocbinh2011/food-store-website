package com.store.controller.cart;

import com.store.controller.Shared.Common;
import com.store.controller.log.CookiesUser;
import com.store.model.customers.User;
import com.store.model.products.Product;
import com.store.model.transactions.Orders;
import com.store.services.DAO.IServiceDAO;
import com.store.services.products.ProductDAO;
import com.store.services.transactions.OrdersDAO;
import com.store.utils.Constant;
import com.sun.org.apache.xpath.internal.operations.Or;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

//@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {

    private IServiceDAO<Orders> iOrderDAO = new OrdersDAO();
    private IServiceDAO<Product> iProductDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(session.getId());
        OrdersDAO ordersDAO = (OrdersDAO) iOrderDAO;
        List<Orders> listOrders = ordersDAO.getListOrderOfUser(user);
        request.setAttribute("listOrders", listOrders);
        String priceStringFormat = (new Orders()).toStringPriceFormat(ordersDAO.getTotalPrice(listOrders));
        request.setAttribute("total", priceStringFormat);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constant.JSP_FILE_CART);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = (String) request.getParameter("pid");
        int amount = Integer.parseInt(request.getParameter("pAmount"));

        String regexProductId = "^[0-9]{1,9}$";
        if(productId == null || !Common.isMatchesRegex(productId, regexProductId)){
            response.sendRedirect(request.getContextPath() + Constant.URL_HOME);
            return;
        }

        int productID = Integer.parseInt(productId);
        if(!iProductDAO.isExitsID(productID)){
            response.sendRedirect(request.getContextPath() + Constant.URL_HOME);
            return;
        }
        Product product = iProductDAO.getInstanceByID(productID);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(session.getId());
        Orders order = new Orders(user, product, new Date(), amount, false);

        boolean isUpdatedAtLeastOneRow = iOrderDAO.update(order);

        // if order dont exist int database
        if(!isUpdatedAtLeastOneRow){
            iOrderDAO.insert(order);
        }
        response.sendRedirect(request.getContextPath() + Constant.URL_CART);
    }

}
