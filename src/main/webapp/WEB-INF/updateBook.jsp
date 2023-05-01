<%@ page import="com.example.mylibrary.model.Book" %>
<%@ page import="com.example.mylibrary.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mylibrary.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Book</title>
</head>
<% Book book = (Book) request.getAttribute("book");%>
<% List<Author> authorsList = (List<Author>) request.getAttribute("authors");%>
<% User user = (User) session.getAttribute("user"); %>
<body>
<a style="color: black;text-decoration: none" href="/books"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Update Book</h2>
    <form action="/updateBook" method="post" enctype="multipart/form-data">
        <input name="id" type="hidden" value="<%=book.getId()%>">
        <input type="hidden" name="userId" value="<%=user.getId()%>">
        <% if (book.getPicName() == null || book.getPicName().equalsIgnoreCase("null")) {%>
        <img src="/img/img.png" width="100">
        <%} else {%>
        <a href="/getBookImage?picName=<%=book.getPicName()%>"><img
                src="/getBookImage?picName=<%=book.getPicName()%>" width="100"></a>
        <%}%>
        <input type="file" name="updateProfilePic"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="title"
               value="<%=book.getTitle()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="description"
               value="<%=book.getDescription()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="number" name="price"
               value="<%=book.getPrice()%>"><br>
        <select style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" name="authorId">
            <% for (Author author : authorsList) { %>
            <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%>
            </option>
            <% }%>
        </select><br>
        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px;margin-top: 10px"
               type="submit" value="update">
    </form>
</div>
</body>
</html>
