<%@ page import="com.example.mylibrary.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Author</title>
</head>
<% List<Author> authorsList = (List<Author>) request.getAttribute("authors");%>
<body>
<a style="color: black;text-decoration: none" href="/home"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Create Book</h2>
    <form action="/createBook" method="post">
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="title"
               placeholder="title"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="description"
               placeholder="description"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="number" name="price"
               placeholder="price"><br>
        <select style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" name="authorId">
            <% for (Author author : authorsList) { %>
            <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%>
            </option>
            <% }%>
        </select><br>

        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px;margin-top: 10px"
               type="submit" value="Add">
    </form>
</div>
</body>
</html>
