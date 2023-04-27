package com.example.mylibrary.servlet;


import com.example.mylibrary.manager.UserManager;
import com.example.mylibrary.model.User;
import com.example.mylibrary.model.UserType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserManager userManager = new UserManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        User user = userManager.getByEmail(email);
        if (user == null) {
            userManager.save(User.builder()
                    .name(req.getParameter("name"))
                    .surname(req.getParameter("surname"))
                    .email(email)
                    .password(req.getParameter("password"))
                    .userType(UserType.valueOf(req.getParameter("type")))
                    .build());
        }
        resp.sendRedirect("/");
    }

}
