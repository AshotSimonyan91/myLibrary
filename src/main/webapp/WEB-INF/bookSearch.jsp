<%@ page import="java.util.List" %>
<%@ page import="com.example.mylibrary.model.Book" %>
<%@ page import="com.example.mylibrary.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
</head>
<% User user = (User) session.getAttribute("user"); %>
<body>
<a style="color: black;text-decoration: none" href="/"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Books</h2>
    <form action="/books" method="get">
        <input type="hidden" name="userId" value="<%=user.getId()%>">
        <input style="width: 300px; height: 30px; border-radius: 10px" type="text" name="name"
               placeholder="book name"><br>
        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px; margin-top: 10px"
               type="submit" value="Search">
    </form>
</div>
</body>
</html>
