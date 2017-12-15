package com.tomek.sdachat.servlets;

import com.tomek.sdachat.dao.UserDAO;
import com.tomek.sdachat.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nick = request.getParameter("nick");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        UserDAO userDAO = new UserDAO();

        if (nick.equals("") || userDAO.isNickTaken(nick)) {
            response.sendRedirect("/signup.jsp?error=nick");
        } else if (password1.equals("") || password2.equals("") || (!password1.equals(password2))) {
            response.sendRedirect("/signup.jsp?error=password");
        } else {
            userDAO.create(User.builder().nick(nick).password(password1).build());
            response.sendRedirect("/login.jsp?info=signupok");
        }
    }
}
