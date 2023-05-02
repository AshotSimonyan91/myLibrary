package com.example.mylibrary.servlet;

import com.example.mylibrary.constants.SheredConstant;
import com.example.mylibrary.manager.BookManager;
import com.example.mylibrary.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;

@WebServlet("/removeBook")
public class RemoveBookServlet extends HttpServlet {

    private BookManager bookManager = new BookManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Book book = bookManager.getById(id);
        if (book != null) {
            if (book.getPicName() != null) {
                File file = new File(BookManager.BOOK_UPLOAD_FOLDER + book.getPicName());
                if (file.exists()) {
                    file.delete();
                }
            }
            bookManager.removeById(id);
        }
        resp.sendRedirect("/books?name=");
    }
}
