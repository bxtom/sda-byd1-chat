<%@ page import="com.tomek.sdachat.dao.TweetDAO" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page import="com.tomek.sdachat.utility.UserSessionUtility" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<body>

<h2>List of tweets</h2>

<br><br>

<%
    UserSessionUtility userSession = new UserSessionUtility(request, response);

    if (userSession.isUserLoggedIn()) {
        out.println("Logged in as: " + userSession.getLoggedUser().getNick());
        out.println("<br><br>");
        out.println("<a href=\"/add.jsp\">add tweet</a>");
        out.println("<br><br>");

        out.println("<table border=\"1\">");
        out.println("<th width=\"150px\">author</th>");
        out.println("<th width=\"150px\">message</th>");
        out.println("<th width=\"150px\">timestamp</th>");
        out.println("<th width=\"150px\">actions</th>");

        TweetDAO tweetDAO = new TweetDAO();

        for (Tweet tweet : tweetDAO.getAllTweets()) {
            out.println("<tr>");
            out.println("<td>" + tweet.getUser().getNick() + "</td>");
            out.println("<td>" + tweet.getMessage() + "</td>");
            out.println("<td>" + tweet.getTimestamp() + "</td>");
            out.println("<td>");
            out.println("<a href=\"update.jsp?id=" + tweet.getId() + "\">update</a> ");
            out.println("<a href=\"delete.jsp?id=" + tweet.getId() +
                    "\" onclick=\"return confirm('Are you sure?')\">delete</a>");
            out.println("</td>");
            out.println("</tr>");
        }

        out.println("");

    } else {
        out.println("Not logged in. <a href=\"/login.jsp\">Please log in clicking here</a>");
    }

%>

</body>
</html>