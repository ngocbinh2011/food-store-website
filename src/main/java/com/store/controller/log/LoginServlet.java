package com.store.controller.log;

import com.store.model.customers.SessionUser;
import com.store.model.customers.User;
import com.store.services.DAO.IServiceDAO;
import com.store.services.users.SessionDAO;
import com.store.services.users.UserDAO;
import com.store.utils.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.regex.Pattern;


public class LoginServlet extends HttpServlet {

    private IServiceDAO<User> iUserDAO = new UserDAO();
    private IServiceDAO<SessionUser> iSessionDAO = new SessionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String contextPath = request.getContextPath();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constant.JSP_FILE_LOGIN);
        String sessionIDServer = session.getId();
        String sessionIDClient = CookiesUser.getJSessionID(request);

        if(sessionIDClient == null || !sessionIDServer.equals(sessionIDClient)){
            requestDispatcher.forward(request, response);
            return;
        }

        // call form session
        Object object = session.getAttribute(sessionIDClient);
        if(object != null){
            User user1 = (User) object;
            redirectedPassLogin(request, response, user1);
            return;
        }


        // call from database check login
        SessionDAO sessionDAO = (SessionDAO) iSessionDAO;
        SessionUser sessionUser = sessionDAO.getSessionUser(sessionIDClient);
        if(sessionUser == null){
            requestDispatcher.forward(request, response);
            return;
        }
        User user = sessionUser.getUser();
        if(user.getUsername() != null){
            redirectedPassLogin(request, response, user);
            return;
        }
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("pUsername");
        String password = request.getParameter("pPassword");

        if(!checkConventionUsernamePassword(username, password)){
            redirectedLoginFail(request, response);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        UserDAO userDAO = (UserDAO) iUserDAO;
        if(userDAO.isLoginSuccess(user)){

            HttpSession session = request.getSession();
            String newSessionID = session.getId();

            // init sessionuser and add session into database
            SessionUser sessionUser = new SessionUser(newSessionID, user);
            boolean isInsertSuccess = iSessionDAO.insert(sessionUser);
            if(isInsertSuccess){
                CookiesUser.deleteCookie(request, response, Constant.COOKIE_LOGGED_NAME);
                redirectedPassLogin(request, response, user);
                return;
            }
        }

        // if login fail
        redirectedLoginFail(request, response);

    }

    protected void redirectedPassLogin(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {
        HttpSession session = request.getSession();
        CookiesUser.addCookie(request, response);
        session.setAttribute(session.getId(), user);
        response.sendRedirect(request.getContextPath() + Constant.URL_HOME);
    }

    protected void redirectedLoginFail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("statusLogin", Constant.NOTIFY_LOGIN_FAIL);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Constant.JSP_FILE_LOGIN);
        requestDispatcher.forward(request, response);
        return;
    }

    protected boolean checkConventionUsernamePassword(String username, String password){
        if(username == null || password == null){
            return false;
        }
        if(username.isEmpty() || password.isEmpty()){
            return false;
        }
        return true;
    }


}
