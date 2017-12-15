<%@ page import="com.tomek.sdachat.dao.TweetDAO" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page import="com.tomek.sdachat.utility.UserSessionUtility" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/skeleton.css">
    <link rel="stylesheet" href="assets/css/my.css">
    <title>Tweets - update tweet</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="one-half column" style="margin-top: 25px">
            <h4>Update tweet</h4>

            <%
                UserSessionUtility userSession = new UserSessionUtility(request, response);

                if (userSession.isUserLoggedIn()) {
                    String tweetId = request.getParameter("id");
                    TweetDAO tweetDAO = new TweetDAO();
                    Tweet tweetToUpdate = tweetDAO.read(Integer.parseInt(tweetId));
            %>

            <form action="/UpdateTweetServlet" method="post">
                <input type="hidden" name="id" value="<% out.print(tweetToUpdate.getId()); %>">
                <label for="message">Message:</label>
                <textarea id="message" name="message" style="width: 100%; height: 150px"><%
                    out.print(tweetToUpdate.getMessage());
                %></textarea>
                <input class="button-primary" type="submit" value="Submit">
            </form>

            <%
                } else {
                    out.println("Not logged in. <a href=\"/login.jsp\">Please log in clicking here</a><br><br>");
                }
            %>

        </div>
    </div>
</div>

</body>
</html>