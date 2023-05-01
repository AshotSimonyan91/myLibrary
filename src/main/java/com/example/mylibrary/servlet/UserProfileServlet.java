package com.example.mylibrary.servlet;


import com.example.mylibrary.manager.UserManager;
import com.example.mylibrary.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {

    private UserManager userManager = new UserManager();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/profile.jsp").forward(req,resp);
    }
}
