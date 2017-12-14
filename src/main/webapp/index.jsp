<%@ page import="com.tomek.sdachat.dao.TweetDAO" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page import="com.tomek.sdachat.model.User" %>
<%@ page import="com.tomek.sdachat.utility.UserSessionUtility" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="normalize.css">
    <link rel="stylesheet" href="skeleton.css">
    <link rel="stylesheet" href="my.css">
</head>
<body>

<%
    User loggedUser = null;

    UserSessionUtility userSession = new UserSessionUtility(request, response);

    if (userSession.isUserLoggedIn()) {
        loggedUser = userSession.getLoggedUser();
    }

%>

<div class="container">
    <div class="row">
        <div class="one-half column" style="margin-top: 25px">
            <h4>Tweets <% if (loggedUser != null) out.print("@" + loggedUser.getNick()); %></h4>

            <%

                if (loggedUser != null) {
                    out.println("Logged in as: @" + userSession.getLoggedUser().getNick());
                    out.println(" (<a href=\"/logout.jsp?logout=1\">logout</a>)");
                    out.println("<br><br>");
                    out.println("<a href=\"/add.jsp\">publish new tweet</a>");
                } else {
                    out.println("Not logged in. <a href=\"/login.jsp\">Please log in or sign up</a>");
                }

                out.println("<br><br>");

                TweetDAO tweetDAO = new TweetDAO();

                for (Tweet tweet : tweetDAO.getAllTweetsNewestFirst()) {
                    out.println("<p>");
                    out.println("<a href=\"user.jsp?nick=" +
                            tweet.getUser().getNick() + "\">@" +
                            tweet.getUser().getNick() + "</a> ");
                    out.print("<span title=\"" + tweet.getDetailedTime() + "\">" + tweet.getPrettyTime() + "</span>");
                    out.println("<br>");
                    out.println(tweet.getMessage());

                    if (loggedUser != null && loggedUser.getNick().equals(tweet.getUser().getNick())) {
                        out.println("<br><a href=\"update.jsp?id=" + tweet.getId() + "\">update</a> ");
                        out.println("<a href=\"delete.jsp?id=" + tweet.getId() +
                                "\" onclick=\"return confirm('Are you sure?')\">delete</a>");
                    }
                    out.println("</p>");
                }

            %>

        </div>
    </div>
</div>

</body>
</html>