package com.tomek.sdachat.servlets;

import com.google.common.hash.Hashing;
import com.tomek.sdachat.dao.UserDAO;
import com.tomek.sdachat.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

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
            final String hash = Hashing.sha256()
                    .hashString(password1 + User.SALT, StandardCharsets.UTF_8)
                    .toString();

            userDAO.create(User.builder().nick(nick).password(hash).build());
            response.sendRedirect("/login.jsp?info=signupok");
        }
    }
}
