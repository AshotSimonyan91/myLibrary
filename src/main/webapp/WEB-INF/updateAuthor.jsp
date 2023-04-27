<%@ page import="com.example.mylibrary.model.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Author</title>
</head>
<% Author author = (Author) request.getAttribute("author");%>
<body>
<a style="color: black;text-decoration: none" href="/authors"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Update Author</h2>
    <form action="/updateAuthor" method="post">
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" name="id" type="hidden"
               value="<%=author.getId()%>">
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="name"
               value="<%=author.getName()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="surname"
               value="<%=author.getSurname()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="email" name="email"
               value="<%=author.getEmail()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="date" name="age"
               value="<%=author.getAge()%>"><br>
        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px;margin-top: 10px"
               type="submit" value="update">
    </form>
</div>
</body>
</html>
