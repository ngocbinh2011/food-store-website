package com.store.controller.homeweb;

import com.store.controller.Shared.Common;
import com.store.model.products.Product;
import com.store.services.products.ProductDAO;
import com.store.utils.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//@WebServlet(name = "HomePage", value = "/home")
public class HomePage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pages = request.getParameter("page");
        int page = 1;
        if(Common.isMatchesRegex(pages, "^[0-9]+$")){
            if(pages.length() <= 8){
                page = Integer.parseInt(pages);
            }
        }
        List<Product> listProductBestSeller = ProductDAO.getListProductBestSeller();
        ProductDAO productDAO = new ProductDAO();
        int totalAmountProduct = productDAO.getAmountProduct();
        int subListProductStart = (page - 1) * Constant.AMOUNT_PRODUCT_IN_PAGE;
        int subListProductEnd = Math.min(page * Constant.AMOUNT_PRODUCT_IN_PAGE, totalAmountProduct);
        int lastPage = totalAmountProduct / Constant.AMOUNT_PRODUCT_IN_PAGE;
        if(totalAmountProduct % Constant.AMOUNT_PRODUCT_IN_PAGE != 0){
            lastPage += 1;
        }

        List<Product> listProduct = new ArrayList<>();
        if(subListProductStart < totalAmountProduct){
            listProduct = productDAO.getSubListProduct(subListProductStart, subListProductEnd);
        }

        request.setAttribute("listProductBestSeller", listProductBestSeller);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("amountProductInRow", Constant.AMOUNT_PRODUCT_IN_ROW);
        request.setAttribute("currentPage", page);
        request.setAttribute("lastPage", lastPage);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constant.JSP_FILE_HOME);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
