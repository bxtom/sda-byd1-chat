<%@ page import="com.tomek.sdachat.utility.UserSessionUtility" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Log in</title>
</head>
<body>

<h2>New tweet</h2>

<%
    UserSessionUtility userSession = new UserSessionUtility(request, response);

    if (userSession.isUserLoggedIn()) {
%>

<form action="/AddTweetServlet" method="post">
    <label>Message:<br>
        <textarea name="message"></textarea>
    </label> <br><br>
    <input type="submit" value="Submit">
</form>

<%

    } else {
        out.println("Not logged in. <a href=\"/login.jsp\">Please log in by clicking here</a><br><br>");
    }

%>

<br>

<a href="/index.jsp">back to the home page</a><br><br>

</body>
</html>