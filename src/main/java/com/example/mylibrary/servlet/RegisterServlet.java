package com.example.mylibrary.servlet;


import com.example.mylibrary.constants.SheredConstant;
import com.example.mylibrary.manager.UserManager;
import com.example.mylibrary.model.User;
import com.example.mylibrary.model.UserType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet("/register")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 1
)
public class RegisterServlet extends HttpServlet {

    private UserManager userManager = new UserManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part profilePicPath = req.getPart("profilePic");
        String picName = null;
        if (profilePicPath != null && profilePicPath.getSize() > 0) {
            picName = System.nanoTime() + "_" + profilePicPath.getSubmittedFileName();
            profilePicPath.write(UserManager.USER_UPLOAD_FOLDER + picName);
        }
        String email = req.getParameter("email");
        User user = userManager.getByEmail(email);
        if (user == null) {
            userManager.save(User.builder()
                    .name(req.getParameter("name"))
                    .surname(req.getParameter("surname"))
                    .email(email)
                    .password(req.getParameter("password"))
                    .userType(UserType.valueOf(req.getParameter("type")))
                    .picName(picName)
                    .build());
        }
        resp.sendRedirect("/");
    }

}
