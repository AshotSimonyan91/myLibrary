package com.example.mylibrary.servlet;

import com.example.mylibrary.constants.SheredConstant;
import com.example.mylibrary.manager.AuthorManager;
import com.example.mylibrary.model.Author;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/updateAuthor")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 1
)
public class UpdateAuthorServlet extends HttpServlet {

    private AuthorManager authorManager = new AuthorManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Author author = authorManager.getById(id);
        req.setAttribute("author", author);
        req.getRequestDispatcher("WEB-INF/updateAuthor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Author author = authorManager.getById(id);
        if (author != null) {
            if (author.getPicName() != null) {
                File file = new File(AuthorManager.AUTHOR_UPLOAD_FOLDER + author.getPicName());
                if (file.exists()) {
                    file.delete();
                }
            }
        }

        Part profilePicPath = req.getPart("updateProfilePic");
        String picName = null;
        if (profilePicPath != null && profilePicPath.getSize() > 0) {
            picName = System.nanoTime() + "_" + profilePicPath.getSubmittedFileName();
            profilePicPath.write(AuthorManager.AUTHOR_UPLOAD_FOLDER + picName);
        }
        authorManager.update(Author.builder()
                .id(id)
                .name(req.getParameter("name"))
                .surname(req.getParameter("surname"))
                .email(req.getParameter("email"))
                .picName(picName)
                .age(Date.valueOf(req.getParameter("age")))
                .build());
        resp.sendRedirect("/authors");
    }
}
