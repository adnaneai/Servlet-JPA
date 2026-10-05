package org.example.controle.controller;

import org.example.controle.dao.UserDAO;
import org.example.controle.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show registration page
        request.getRequestDispatcher("/view/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");


        User newUser = new User(username, password);

        boolean isRegistered = userDAO.register(newUser);

        if (isRegistered) {

            response.sendRedirect("login");
        } else {

            request.setAttribute("error", "Registration failed. Username might already exist.");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
        }
    }
}
