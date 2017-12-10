package com.tomek.sdachat.servlets;

import com.tomek.sdachat.dao.TweetDAO;
import com.tomek.sdachat.dao.UserDAO;
import com.tomek.sdachat.model.Tweet;
import com.tomek.sdachat.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "tweetServlet", value = "/tweetServlet")
public class TweetServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");

        UserDAO userDAO = new UserDAO();

        User loggedUser = null;

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userid")) {
                    loggedUser = userDAO.getUser(Integer.parseInt(cookie.getValue()));
                }
            }
        }

        if (loggedUser != null) {
            TweetDAO tweetDAO = new TweetDAO();
            tweetDAO.createTweet(new Tweet(System.currentTimeMillis(), message, loggedUser));
        }
    }
}
