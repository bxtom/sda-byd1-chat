package com.tomek.sdachat.utility;

import com.tomek.sdachat.dao.UserDAO;
import com.tomek.sdachat.model.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSessionUtility {
    private static final String USER_ID = "userid";
    private static final int COOKIE_MAX_AGE = 10 * 60;
    private User loggedUser;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public UserSessionUtility(HttpServletRequest request, HttpServletResponse response) {
        loggedUser = null;
        this.request = request;
        this.response = response;
    }

    private void readCookie() {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(USER_ID)) {
                    UserDAO userDAO = new UserDAO();
                    loggedUser = userDAO.read(Integer.parseInt(cookie.getValue()));
                }
            }
        }
    }

    public void login(User user) {
        Cookie userIdCookie = new Cookie(USER_ID, String.valueOf(user.getId()));
        userIdCookie.setMaxAge(COOKIE_MAX_AGE);
        this.response.addCookie(userIdCookie);
    }

    public void logout() {
        Cookie userIdCookie = new Cookie(USER_ID, "");
        userIdCookie.setMaxAge(0);
        this.response.addCookie(userIdCookie);
    }

    public boolean isUserLoggedIn() {
        readCookie();
        return this.loggedUser != null;
    }

    public User getLoggedUser() {
        readCookie();
        return this.loggedUser;
    }
}
