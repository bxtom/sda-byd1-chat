<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="normalize.css">
    <link rel="stylesheet" href="skeleton.css">
    <link rel="stylesheet" href="my.css">
    <title>Tweets - log in</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="one-half column" style="margin-top: 25px">
            <h4>Log in</h4>

            <%
                String error = request.getParameter("error");
                if (error != null && error.equals("1")) {
                    out.println("<span class=\"error\">Wrong login and/or password!</span>" + "<br><br>");
                }

                String info = request.getParameter("info");
                if (info != null && info.equals("signupok")) {
                    out.println("<span class=\"info\">Account created! Please log in</span>" + "<br><br>");
                }
            %>

            <form action="/LoginServlet" method="post">
                <label for="nick">nick:</label>
                <input id="nick" name="nick" type="text">
                <label for="password">password:</label>
                <input id="password" name="password" type="password"><br>
                <input class="button-primary" type="submit" value="Log in">
            </form>
            New to Tweets? <a href="signup.jsp">Sign up</a>
        </div>
    </div>
</div>

</body>
</html>