package com.store.controller.cart;

import com.store.controller.Shared.Common;
import com.store.model.products.Product;
import com.store.services.DAO.IServiceDAO;
import com.store.services.products.ProductDAO;
import com.store.utils.Constant;
import com.sun.org.apache.bcel.internal.Const;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


public class ViewProduct extends HttpServlet {

    private IServiceDAO<Product> iProductDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("pid");
//        System.out.println(request.getRequestURL());
        String regexProductId = "^[0-9]{1,9}$";
        if(productId == null || !Common.isMatchesRegex(productId, regexProductId)){
            response.sendRedirect(request.getContextPath() + Constant.URL_HOME);
            return;
        }

        int productID = Integer.parseInt(productId);
        Product product = new Product();
        if(iProductDAO.isExitsID(productID)){
            product = iProductDAO.getInstanceByID(productID);
        }
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constant.JSP_FILE_VIEW_PRODUCT);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
