<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="normalize.css">
    <link rel="stylesheet" href="skeleton.css">
    <link rel="stylesheet" href="my.css">
    <title>Tweets - sign up</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="one-half column" style="margin-top: 25px">
            <h4>Sign up</h4>

            <%
                String error = request.getParameter("error");

                if (error != null) {
                    if (error.equals("nick")){
                        out.println("<span class=\"error\">This nick is empty or taken!</span>" + "<br><br>");
                    } else if (error.equals("password")) {
                        out.println("<span class=\"error\">Passwords are empty or do not match!</span>" + "<br><br>");
                    }
                }
            %>

            <form action="/SignUpServlet" method="post">
                <label for="nick">nick:</label>
                <input id="nick" name="nick" type="text">
                <label for="password1">password:</label>
                <input id="password1" name="password1" type="password">
                <label for="password2">re-type password:</label>
                <input id="password2" name="password2" type="password"><br>
                <input class="button-primary" type="submit" value="Sign up">
            </form>
            Already registered? <a href="login.jsp">Log in</a>
        </div>
    </div>
</div>

</body>
</html>