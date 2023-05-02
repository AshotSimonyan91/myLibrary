package com.example.mylibrary.servlet;

import com.example.mylibrary.constants.SheredConstant;
import com.example.mylibrary.manager.AuthorManager;
import com.example.mylibrary.manager.BookManager;
import com.example.mylibrary.manager.UserManager;
import com.example.mylibrary.model.Author;
import com.example.mylibrary.model.Book;
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

@WebServlet("/updateBook")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 1
)
public class UpdateBookServlet extends HttpServlet {

    private BookManager bookManager = new BookManager();
    private AuthorManager authorManager = new AuthorManager();
    private UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<Author> all = authorManager.getAll();
        Book book = bookManager.getById(id);
        req.setAttribute("book", book);
        req.setAttribute("authors", all);
        req.getRequestDispatcher("WEB-INF/updateBook.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Book book = bookManager.getById(id);
        if (book != null) {
            if (book.getPicName() != null) {
                File file = new File(BookManager.BOOK_UPLOAD_FOLDER + book.getPicName());
                if (file.exists()) {
                    file.delete();
                }
            }
        }

        Part profilePicPath = req.getPart("updateProfilePic");
        String picName = null;
        if (profilePicPath != null && profilePicPath.getSize() > 0) {
            picName = System.nanoTime() + "_" + profilePicPath.getSubmittedFileName();
            profilePicPath.write(BookManager.BOOK_UPLOAD_FOLDER + picName);
        }
        bookManager.update(Book.builder()
                .id(id)
                .title(req.getParameter("title"))
                .description(req.getParameter("description"))
                .price(Double.parseDouble(req.getParameter("price")))
                .author(authorManager.getById(Integer.parseInt(req.getParameter("authorId"))))
                .picName(picName)
                .user(userManager.getById(Integer.parseInt(req.getParameter("userId"))))
                .build());
        resp.sendRedirect("/books?name=");
    }
}
