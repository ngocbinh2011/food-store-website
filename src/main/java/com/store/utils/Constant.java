package com.store.utils;

import com.store.controller.log.CookiesUser;

import javax.servlet.http.Cookie;

public class Constant {

    public static final String JSP_FILE_HOME = "index.jsp";
    public static final String JSP_FILE_CART = "cart.jsp";
    public static final String JSP_FILE_LOGIN = "login.jsp";
    public static final String JSP_FILE_VIEW_PRODUCT = "view-product.jsp";
    public static final String JSP_FILE_SEARCH = "search-product.jsp";
    public static final String JSP_FILE_ORDER_PAY = "order-pay.jsp";
    public static final String JSP_FILE_ORDER_SUCCESS = "order-success.jsp";

    public static final String URL_HOME = "/home";
    public static final String URL_LOGIN = "/login";
    public static final String URL_SIGN_UP = "/sign-up";
    public static final String URL_VIEW_PRODUCT = "/view-product";
    public static final String URL_CART = "/cart";
    public static final String URL_SEARCH_PRODUCT = "/search";
    public static final String URL_LOGOUT = "/logout";
    public static final String URL_ORDER = "/cart/order";

    // seconds
    public static final int MINUTES_IN_SECONDS = 60;
    public static final int HOURS_IN_SECONDS = 60 * 60;
    public static final int DAYS_IN_SECONDS = 24 * 60 * 60;

    // minutes
    public static final int HOURS_IN_MINUTES = 60;
    public static final int DAYS_IN_MINUTES = 24 * 60;

    public static final String NOTIFY_LOGIN_FAIL = "Username or password is wrong!";

    public static final String SESSIONID_NAME = "JSESSIONID";
    public static final String COOKIE_LOGGED_NAME = "JSESSIONID";

    public static final int AMOUNT_PRODUCT_IN_PAGE = 9;
    public static final int AMOUNT_PRODUCT_IN_ROW = 3;
    public static final int AMOUNT_PRODUCT_IN_ROW_SEARCH = 4;
    public static final int AMOUNT_PRODUCT_BEST_SELLER = 6;

    public static final int TIME_OUT_SESSION_IN_SECONDS = 2 * HOURS_IN_SECONDS;

}
