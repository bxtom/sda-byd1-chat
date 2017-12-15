<%@ page import="com.tomek.sdachat.dao.TweetDAO" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page import="com.tomek.sdachat.model.User" %>
<%@ page import="com.tomek.sdachat.utility.UserSessionUtility" %>
<%@ page import="com.tomek.sdachat.dao.UserDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    User loggedUser = null;

    UserSessionUtility userSession = new UserSessionUtility(request, response);

    if (userSession.isUserLoggedIn()) {
        loggedUser = userSession.getLoggedUser();
    }

    String nick = request.getParameter("nick");

%>

<html>
<head>
    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/skeleton.css">
    <link rel="stylesheet" href="assets/css/my.css">
    <title>Tweets @<% out.print(nick); %></title>
</head>
<body>



<div class="container">
    <div class="row">
        <div class="one-half column" style="margin-top: 25px">
            <h4>Tweets @<% out.print(nick); %></h4>

            <%
                UserDAO userDAO = new UserDAO();
                User user = userDAO.findOneUserByNick(nick);

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

                for (Tweet tweet : tweetDAO.getAllTweetsOfOneUserNewestFirst(user)) {
                    out.println("<p>");
                    out.println("<a href=\"profile.jsp?nick=" +
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