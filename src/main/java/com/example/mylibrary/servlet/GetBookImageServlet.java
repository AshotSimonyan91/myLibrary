package com.example.mylibrary.servlet;

import com.example.mylibrary.constants.SheredConstant;
import com.example.mylibrary.manager.BookManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/getBookImage")
public class GetBookImageServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String picName = req.getParameter("picName");
        File imageFile = new File(BookManager.BOOK_UPLOAD_FOLDER + picName);
        if (imageFile.exists()) {
            try (FileInputStream inputStream = new FileInputStream(imageFile);
                 OutputStream outputStream = resp.getOutputStream()) {

                resp.setContentType("image/jpeg");
                resp.setContentLength((int) imageFile.length());

                byte[] buffer = new byte[4096];
                int byteRead = -1;

                while ((byteRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, byteRead);
                }
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
