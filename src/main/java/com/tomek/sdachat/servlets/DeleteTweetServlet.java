package com.tomek.sdachat.servlets;

import com.tomek.sdachat.dao.TweetDAO;
import com.tomek.sdachat.model.Tweet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteTweetServlet", value = "/delete.jsp")
public class DeleteTweetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String tweetId = req.getParameter("id");

        if (tweetId != null && !tweetId.equals("")) {
            TweetDAO tweetDAO = new TweetDAO();
            Tweet selectedTweet = tweetDAO.getTweet(Integer.parseInt(tweetId));
            tweetDAO.deleteTweet(selectedTweet);
            resp.sendRedirect("index.jsp");
        }
    }
}