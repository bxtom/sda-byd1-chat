<%@ page import="com.tomek.sdachat.model.User" %>
<%@ page import="com.tomek.sdachat.model.Tweet" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Session" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<body>

<h2>List of tweets</h2>

<br><br>


<%

//    User user = new User("tomek", "123");
//    Tweet tweet = new Tweet(System.currentTimeMillis(), "Test", user);
//
//    SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
//    Session session1 = sessionFactory.openSession();
//    session1.beginTransaction();
//    session1.save(user);
//    session1.save(tweet);
//    session1.getTransaction().commit();
//    session1.close();


    String nick = "";
    Boolean isUserLoggedIn = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("nick")) {
                isUserLoggedIn = true;
                nick = cookie.getValue();
            }
        }
    }

    if (isUserLoggedIn) {
        out.println("Logged in as: " + nick);
    } else {
        out.println("Not logged in. <a href=\"/login.jsp\">Please log in clicking here</a>");
    }


%>


</body>
</html>