<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Log in</title>
</head>
<body>

    <h2>Log in</h2>

    <%

        String error = request.getParameter("error");
        if (error != null && error.equals("1")) {
            out.println("Wrong login and/or password!" + "<br><br>");
        }

    %>

    <form action="/loginServlet" method="post">

        <label>nick:<br>
            <input name="nick">
        </label> <br>

        <label>password:<br>
            <input name="password">
        </label> <br><br>
        <input type="submit" value="Submit">
    </form>

    <br>

    <a href="/index.jsp">back to the home page</a><br><br>

</body>
</html>