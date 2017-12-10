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

<a href="publish.jsp">publish new tweet</a><br><br>

<table border="1">

    <th width="150px">author</th>
    <th width="150px">message</th>
    <th width="150px">timestamp</th>

<%

    User user = new User("tomek", "123");
    //Tweet tweet = new Tweet(1, 1, System.currentTimeMillis(), "Test");

    SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
    Session session1 = sessionFactory.openSession();
    session1.beginTransaction();
    session1.save(user);
    session1.getTransaction().commit();
    session1.close();

%>

</table>

</body>
</html>