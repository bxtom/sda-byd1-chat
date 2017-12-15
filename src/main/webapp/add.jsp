<%@ page import="com.tomek.sdachat.utility.UserSessionUtility" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/skeleton.css">
    <link rel="stylesheet" href="assets/css/my.css">
    <title>Tweets - new tweet</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="one-half column" style="margin-top: 25px">
            <h4>New tweet</h4>

            <%
                UserSessionUtility userSession = new UserSessionUtility(request, response);

                if (userSession.isUserLoggedIn()) {
            %>

            <form action="/AddTweetServlet" method="post">
                <label for="message">Message:</label>
                <textarea id="message" name="message" style="width: 100%; height: 150px"></textarea>
                <input class="button-primary" type="submit" value="Submit">
            </form>

            <%
                } else {
                    out.println("Not logged in. <a href=\"/login.jsp\">Please log in by clicking here</a><br><br>");
                }
            %>

        </div>
    </div>
</div>

</body>
</html>