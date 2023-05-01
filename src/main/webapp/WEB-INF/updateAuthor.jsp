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
    <form action="/updateAuthor" method="post" enctype="multipart/form-data">
        <input name="id" type="hidden" value="<%=author.getId()%>">
        <% if (author.getPicName() == null || author.getPicName().equalsIgnoreCase("null")) {%>
        <img src="/img/img.png" width="100">
        <%} else {%>
        <a href="/getAuthorImage?picName=<%=author.getPicName()%>"><img
                src="/getAuthorImage?picName=<%=author.getPicName()%>" width="100"></a>
        <%}%>
        <input type="file" name="updateProfilePic"><br>
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
