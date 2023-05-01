package com.example.mylibrary.servlet;

import com.example.mylibrary.constants.SheredConstant;
import com.example.mylibrary.manager.UserManager;
import com.example.mylibrary.model.Author;
import com.example.mylibrary.model.Book;
import com.example.mylibrary.model.User;
import com.example.mylibrary.model.UserType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateUser")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 1
)
public class UpdateUserServlet extends HttpServlet {

    private UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        User byEmail = userManager.getByEmail(email);
        req.setAttribute("user", byEmail);
        req.getRequestDispatcher("WEB-INF/updateUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        User user = userManager.getByEmail(email);
        if (user != null) {
            if (user.getPicName() != null) {
                File file = new File(SheredConstant.USER_UPLOAD_FOLDER + user.getPicName());
                if (file.exists()) {
                    file.delete();
                }
            }
        }

        Part profilePicPath = req.getPart("updateProfilePic");
        String picName = null;
        if (profilePicPath != null && profilePicPath.getSize() > 0) {
            picName = System.nanoTime() + "_" + profilePicPath.getSubmittedFileName();
            profilePicPath.write(SheredConstant.USER_UPLOAD_FOLDER + picName);
        }
        userManager.update(User.builder()
                .id(Integer.parseInt(req.getParameter("id")))
                .name(req.getParameter("name"))
                .surname(req.getParameter("surname"))
                .email(email)
                .password(req.getParameter("password"))
                .userType(UserType.valueOf(req.getParameter("type")))
                .picName(picName)
                .build());
//        req.getSession().removeAttribute("user");
        User user1 = userManager.getByEmail(email);
        req.getSession().setAttribute("user",user1);
        resp.sendRedirect("/profile");
    }
}
