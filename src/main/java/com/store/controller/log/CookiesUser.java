package com.store.controller.log;

import com.store.utils.Constant;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

public class CookiesUser {
    public static String getJSessionID(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies == null){
            return null;
        }
        String result = null;
        for(Cookie cookie: cookies){
            if(cookie.getName().equals(Constant.COOKIE_LOGGED_NAME)){
                result = cookie.getValue();
            }
        }
        return result;
    }


    public static void addCookie(HttpServletRequest request, HttpServletResponse response){
        Cookie cookie = new Cookie(Constant.COOKIE_LOGGED_NAME, request.getSession().getId());
        cookie.setMaxAge(Constant.TIME_OUT_SESSION_IN_SECONDS);
        response.addCookie(cookie);
    }

    public static void deleteCookie(HttpServletRequest request,  HttpServletResponse response, String cookieName){
        Cookie[] cookies = request.getCookies();
        if(cookies == null){
            return;
        }
        for(Cookie cookie: cookies){
            if(cookie.getName().equals(Constant.COOKIE_LOGGED_NAME)){
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        return;
    }

}
