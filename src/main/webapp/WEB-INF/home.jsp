<%@ page import="com.example.mylibrary.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<% User user = (User) session.getAttribute("user"); %>
<a style="color: black;text-decoration: none;font-size: 20px" href="/logout">logout</a> |
<a style="color: black;text-decoration: none;font-size: 20px" href="/profile">profile</a> <br>
<div style="display: flex;flex-direction: row;align-items: center;justify-content: center">
    <h3>Welcome</h3>
    <h1 style="margin-left: 10px"><%=user.getName()%> <%=user.getSurname()%>
    </h1>
</div>
<div style="display: flex;flex-direction: row;align-items: center;justify-content: center;margin-top: 50px">
    <a style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none" href="/authors">
        Authors</a> |
    <a style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none" href="/bookSearch">
        Books</a> |
    <a style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none"
       href="/createAuthor"> Add Authors</a> |
    <a style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none" href="/createBook">Add
        Books</a>
</div>
</body>
</html>
