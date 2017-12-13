<%@ page import="com.tomek.sdachat.dao.TweetDAO" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page import="com.tomek.sdachat.utility.UserSessionUtility" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Update tweet</title>
</head>
<body>

<h2>Update tweet</h2>

<%
    UserSessionUtility userSession = new UserSessionUtility(request, response);

    if (userSession.isUserLoggedIn()) {
        String tweetId = request.getParameter("id");
        TweetDAO tweetDAO = new TweetDAO();
        Tweet tweetToUpdate = tweetDAO.read(Integer.parseInt(tweetId));

%>
<form action="/UpdateTweetServlet" method="post">
    <input type="hidden" name="id" value="<% out.print(tweetToUpdate.getId()); %>">
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