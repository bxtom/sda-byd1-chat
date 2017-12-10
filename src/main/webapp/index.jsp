<%@ page import="com.tomek.sdachat.model.User" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tomek.sdachat.dao.TweetDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<body>

<h2>List of tweets</h2>

<br><br>


<%

//    User user = new User("tomek", "123");
//    Tweet sampleTweet = new Tweet(System.currentTimeMillis(), "Test", user);
//
//    SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
//    Session session1 = sessionFactory.openSession();
//    session1.beginTransaction();
//    session1.save(user);
//    session1.save(sampleTweet);
//    session1.getTransaction().commit();
//    session1.close();
//
//    TweetDAO sampleTweetDAO = new TweetDAO();
//    sampleTweetDAO.createTweet(new Tweet(System.currentTimeMillis(), "TEEST TEEST TEEST ", user));


    String userId = "";
    Boolean isUserLoggedIn = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userid")) {
                isUserLoggedIn = true;
                userId = cookie.getValue();
            }
        }
    }

    if (isUserLoggedIn) {
        out.println("Logged in as: " + userId);
        out.println("<br><br>");
        out.println("<a href=\"/add.jsp\">add tweet</a>");
        out.println("<br><br>");

        out.println("<table border=\"1\">");
        out.println("<th width=\"150px\">author</th>");
        out.println("<th width=\"150px\">message</th>");
        out.println("<th width=\"150px\">timestamp</th>");
        out.println("<th width=\"150px\">akcje</th>");

        TweetDAO tweetDAO = new TweetDAO();

        for (Tweet tweet : tweetDAO.getTweetList()){
            out.println("<tr>");
            out.println("<td>" + tweet.getUser().getNick() + "</td>");
            out.println("<td>" + tweet.getMessage() + "</td>");
            out.println("<td>" + tweet.getTimestamp() + "</td>");
            out.println("<td><a href=\"update.jsp\">update</a> <a href=\"tweetServlet?delete=" +
                    tweet.getId() + "\">delete</a></td>");
            out.println("</tr>");
        }

        out.println("");

    } else {
        out.println("Not logged in. <a href=\"/login.jsp\">Please log in clicking here</a>");
    }


%>


</body>
</html>