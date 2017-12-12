<%@ page import="com.tomek.sdachat.dao.TweetDAO" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Log in</title>
</head>
<body>

<h2>Update tweet</h2>

<%

    Boolean isUserLoggedIn = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userid")) {
                isUserLoggedIn = true;
            }
        }
    }

    if (isUserLoggedIn) {
        String tweetId = request.getParameter("update");
        TweetDAO tweetDAO = new TweetDAO();
        Tweet tweetToUpdate = tweetDAO.readTweet(Integer.parseInt(tweetId));

%>

<form action="/tweetServlet" method="post">
    Message:<br>
    <textarea name="message"><% out.print(tweetToUpdate.getMessage()); %></textarea> <br><br>
    <input type="submit" value="Submit">
</form>

<%

    } else {
        out.println("Not logged in. <a href=\"/login.jsp\">Please log in clicking here</a><br><br>");
    }

%>

<br>

<a href="/index.jsp">back to the home page</a><br><br>

</body>
</html>