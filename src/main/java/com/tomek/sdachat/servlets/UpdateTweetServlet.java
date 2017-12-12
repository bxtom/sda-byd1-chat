package com.tomek.sdachat.servlets;

import com.tomek.sdachat.dao.TweetDAO;
import com.tomek.sdachat.model.Tweet;
import com.tomek.sdachat.utility.UserSessionUtility;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateTweetServlet", value = "/UpdateTweetServlet")
public class UpdateTweetServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserSessionUtility session = new UserSessionUtility(request, response);

        if (session.isUserLoggedIn()) {
            String message = request.getParameter("message");
            String tweetId = request.getParameter("id");

            TweetDAO tweetDAO = new TweetDAO();
            Tweet tweet = tweetDAO.getTweet(Integer.parseInt(tweetId));
            tweet.setMessage(message);
            tweetDAO.updateTweet(tweet);

            response.sendRedirect("index.jsp");
        }
    }
}