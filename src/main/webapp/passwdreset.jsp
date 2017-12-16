<%@ page import="com.tomek.sdachat.dao.UserDAO" %>
<%@ page import="com.tomek.sdachat.model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<html>
<head>
    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/skeleton.css">
    <link rel="stylesheet" href="assets/css/my.css">
    <title>Tweets - reset password</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="one-half column" style="margin-top: 25px">
            <h4>Reset password</h4>

            <%
                String token = request.getParameter("token");
                if (token != null && !token.equals("")) {

                    UserDAO userDao = new UserDAO();
                    User user = userDao.findOneUserByUuid(token);

                    if (user != null) {

            %>

            <form action="/PasswordResetServlet" method="post">
                <input name="token_ok" type="hidden" value="1"><br>
                <input name="token" type="hidden" value="<% out.print(token); %>"><br>

                <label for="password1">new password:</label>
                <input id="password1" name="password1" type="password">
                <label for="password2">re-type password:</label>
                <input id="password2" name="password2" type="password"><br>
                <input class="button-primary" type="submit" value="Reset password">
            </form>

            <%
                } else {
                    out.println("<span class=\"error\">Invalid token! Try again.</span>" + "<br><br>");
                }
            } else {

            %>

            <form action="/PasswordResetServlet" method="post">
                <label for="nick"> nick:</label>
                <input id="nick" name="nick" type="text"><br>
                <input class="button-primary" type="submit" value="Reset password">
            </form>

            <%

                }

            %>
        </div>
    </div>
</div>

</body>
</html>