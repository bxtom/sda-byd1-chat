package com.tomek.sdachat.servlets;

import com.tomek.sdachat.model.User;
import com.tomek.sdachat.utility.UserSessionUtility;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nick = request.getParameter("nick");
        String password = request.getParameter("password");

        if (nick.equals("tomek") && password.equals("123")) {
            UserSessionUtility userSession = new UserSessionUtility(request, response);
            userSession.login(User.builder().id(1).nick("Tomek").build());
            response.sendRedirect("/index.jsp");
        } else {
            response.sendRedirect("/login.jsp?error=1");
        }
    }
}
