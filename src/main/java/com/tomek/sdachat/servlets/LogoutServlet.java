package com.tomek.sdachat.servlets;

import com.tomek.sdachat.utility.UserSessionUtility;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/logout.jsp")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String logout = request.getParameter("logout");

        if (logout != null && logout.equals("1")) {
            UserSessionUtility userSession = new UserSessionUtility(request, response);
            userSession.logout();
            response.sendRedirect("/index.jsp");
        }
    }
}
