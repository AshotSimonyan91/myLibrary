<%@ page import="com.example.mylibrary.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Author</title>
</head>

<body>
<a style="color: black;text-decoration: none" href="/home"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Create Author</h2>

    <form action="/createAuthor" method="post">
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="name"
               placeholder="name"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="surname"
               placeholder="surname"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="email" name="email"
               placeholder="email"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="date" name="age"
               placeholder="age"><br>

        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px;margin-top: 10px"
               type="submit" value="Add">
    </form>
</div>
</body>
</html>
