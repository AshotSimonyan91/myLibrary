<%@ page import="com.example.mylibrary.model.Book" %>
<%@ page import="com.example.mylibrary.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Book</title>
</head>
<% Book book = (Book) request.getAttribute("book");%>
<% List<Author> authorsList = (List<Author>) request.getAttribute("authors");%>
<body>
<a style="color: black;text-decoration: none" href="/books"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Update Book</h2>
    <form action="/updateBook" method="post">
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" name="id" type="hidden"
               value="<%=book.getId()%>">
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
