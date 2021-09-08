package com.store.controller.search;

import com.store.model.products.Product;
import com.store.services.DAO.IServiceDAO;
import com.store.services.products.ProductDAO;
import com.store.utils.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {

    private IServiceDAO<Product> iProductDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        ProductDAO productDAO = (ProductDAO) iProductDAO;
        List<Product> listProduct = productDAO.getListProductSearch(query);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("amountInRow", Constant.AMOUNT_PRODUCT_IN_ROW_SEARCH);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constant.JSP_FILE_SEARCH);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
