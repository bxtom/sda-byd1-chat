package com.tomek.sdachat.servlets;

import com.tomek.sdachat.dao.TweetDAO;
import com.tomek.sdachat.model.Tweet;
import com.tomek.sdachat.utility.UserSessionUtility;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddTweetServlet", value = "/AddTweetServlet")
public class AddTweetServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserSessionUtility session = new UserSessionUtility(request, response);

        if (session.isUserLoggedIn()) {
            String message = request.getParameter("message");
            TweetDAO tweetDAO = new TweetDAO();

            Tweet tweet = Tweet.builder()
                    .message(message)
                    .timestamp(System.currentTimeMillis())
                    .user(session.getLoggedUser())
                    .build();

            tweetDAO.create(tweet);
            response.sendRedirect("index.jsp");
        }
    }
}