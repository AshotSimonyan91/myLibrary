package com.example.mylibrary.servlet;

import com.example.mylibrary.constants.SheredConstant;
import com.example.mylibrary.manager.AuthorManager;
import com.example.mylibrary.model.Author;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;

@WebServlet("/removeAuthor")
public class RemoveAuthorServlet extends HttpServlet {

    private AuthorManager authorManager = new AuthorManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Author author = authorManager.getById(id);
        if (author != null) {
            if (author.getPicName() != null) {
                File file = new File(AuthorManager.AUTHOR_UPLOAD_FOLDER + author.getPicName());
                if (file.exists()) {
                    file.delete();
                }
            }
            authorManager.removeById(id);
        }
        resp.sendRedirect("/authors");
    }
}
