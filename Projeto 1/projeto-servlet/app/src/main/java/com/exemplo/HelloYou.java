package com.exemplo;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloYou extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("name");

        response.setContentType("text/html");

        if (nome == null) {
            nome = "PSWEB";
        }

        response.getWriter().println("<h1>Hello " + nome + "!</h1>");
    }
}
