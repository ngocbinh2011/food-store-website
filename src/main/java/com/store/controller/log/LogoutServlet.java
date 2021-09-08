package com.store.controller.log;

import com.mysql.cj.Session;
import com.store.model.customers.SessionUser;
import com.store.services.DAO.IServiceDAO;
import com.store.services.users.SessionDAO;
import com.store.utils.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

//@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    private IServiceDAO<SessionUser> iSessionDAO = new SessionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sessionID = session.getId();
        SessionDAO sessionDAO = (SessionDAO) iSessionDAO;

        boolean isDeleteSuccess = sessionDAO.delete(sessionID);

        if(isDeleteSuccess){
            CookiesUser.deleteCookie(request, response, Constant.COOKIE_LOGGED_NAME);
            session.invalidate();
            response.sendRedirect(request.getContextPath() + Constant.URL_LOGIN);
        } else{
            response.sendRedirect(request.getContextPath() + Constant.URL_HOME);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
