package com.tomek.sdachat.servlets;

import com.google.common.hash.Hashing;
import com.tomek.sdachat.dao.UserDAO;
import com.tomek.sdachat.model.User;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

@WebServlet(name = "PasswordResetServlet", value = "/PasswordResetServlet")
public class PasswordResetServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String tokenOk = request.getParameter("token_ok");

        if (tokenOk != null && tokenOk.equals("1")) {
            String token = request.getParameter("token");
            UserDAO userDao = new UserDAO();
            User user = userDao.findOneUserByUuid(token);

            if (user != null) {
                String password1 = request.getParameter("password1");
                String password2 = request.getParameter("password2");

                if (password1.equals(password2)) {
                    final String hash = Hashing.sha256()
                            .hashString(password1 + User.SALT, StandardCharsets.UTF_8)
                            .toString();
                    user.setPassword(hash);
                    userDao.update(user);

                    response.sendRedirect("/index.jsp");
                }
            }
        } else {
            String nick = request.getParameter("nick");

            UserDAO userDAO = new UserDAO();
            User user = userDAO.findOneUserByNick(nick);
            String randomId = UUID.randomUUID().toString();
            user.setUuid(randomId);
            userDAO.update(user);

            Email email = new SimpleEmail();
            email.setHostName("mail.ruun.pl");
            email.setSmtpPort(465);
            email.setAuthenticator(new DefaultAuthenticator("test@ruun.pl", "MoQ7xXTh"));
            email.setSSLOnConnect(true);

            try {
                email.setFrom("test@ruun.pl");
                email.setSubject("TestMail");
                String url = "http://localhost:8080/passwdreset.jsp?token=" + randomId;
                email.setMsg("Click on this link to reset you password: " + url);
                email.addTo("test@ruun.pl");
                email.send();
            } catch (EmailException e) {
                e.printStackTrace();
            }

            response.sendRedirect("/index.jsp");
        }
    }
}
