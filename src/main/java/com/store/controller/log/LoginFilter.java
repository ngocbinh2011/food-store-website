package com.store.controller.log;

import com.store.model.customers.User;
import com.store.utils.Constant;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

//@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    private static Map<String, Boolean> isExcept = new HashMap<>();

    static {
        isExcept.put(Constant.URL_HOME, true);
        isExcept.put(Constant.URL_LOGIN, true);
        isExcept.put(Constant.URL_SIGN_UP, true);
        isExcept.put(Constant.URL_VIEW_PRODUCT, true);
        isExcept.put(Constant.URL_LOGOUT, true);

    }


    public void init(FilterConfig config) throws ServletException {

    }

    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest requestLog = (HttpServletRequest) request;
        HttpServletResponse responseLog = (HttpServletResponse) response;

        String path = requestLog.getServletPath();

        // if file in source css/file.css
        if(isMatchesWithRegexCSSFile(path)){
            chain.doFilter(request, response);
            return;
        }

        if(isExcept.containsKey(path)){
            chain.doFilter(requestLog, responseLog);
        } else{
            boolean isPassFilter = checkPassFilter(requestLog, responseLog);
            if(isPassFilter){
                CookiesUser.addCookie(requestLog, responseLog); // reset Timeout cookie
                chain.doFilter(request, response);
            } else{
                System.out.println(path);
            }
        }
    }

    protected boolean checkPassFilter(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String jSessionIdClient = CookiesUser.getJSessionID(request);
        String jSessionIdServer = request.getSession().getId();
//        System.out.println( "fileter: " + "client:" + jSessionIdClient + " "+ "server: " + jSessionIdServer);
        if(jSessionIdClient == null || !jSessionIdServer.equals(jSessionIdClient)){
            response.sendRedirect(request.getContextPath() + Constant.URL_LOGIN);
            return false;
        }
        HttpSession session = request.getSession();
        Object object = session.getAttribute(jSessionIdClient);
        if(object == null){
            response.sendRedirect(request.getContextPath() + Constant.URL_LOGIN);
            return false;
        }
        User user = (User) object;
        session.setAttribute(jSessionIdClient, user);
        return true;
    }

    protected String getFileFormat(String path){
        int index = path.lastIndexOf('.');
        return path.substring(index + 1);
    }

    protected boolean isMatchesWithRegexCSSFile(String path){
        String regexPathForCssFile = "^.*/css/.*\\.css$";
        String regexPathImage = "^.*/image/.*$";
//        String regexPathForJspFile = "^.*\\.jsp$";
        Pattern patternCSS = Pattern.compile(regexPathForCssFile);
        Pattern patternImage = Pattern.compile(regexPathImage);
//        Pattern patternJsp = Pattern.compile(regexPathForJspFile);
        return patternCSS.matcher(path).matches() || patternImage.matcher(path).matches();
    }


}
