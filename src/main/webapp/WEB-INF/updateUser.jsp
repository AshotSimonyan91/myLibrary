<%@ page import="com.example.mylibrary.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Author</title>
</head>
<% User user = (User) request.getAttribute("user");%>
<body>
<a style="color: black;text-decoration: none" href="/profile"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Update Profile</h2>
    <form action="/updateUser" method="post" enctype="multipart/form-data">
        <input name="id" type="hidden" value="<%=user.getId()%>">
        <% if (user.getPicName() == null || user.getPicName().equalsIgnoreCase("null")) {%>
        <img src="/img/img.png" width="100">
        <%} else {%>
        <a href="/getUserImage?picName=<%=user.getPicName()%>"><img
                src="/getUserImage?picName=<%=user.getPicName()%>" width="100"></a>
        <%}%>
        <input type="file" name="updateProfilePic"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="name"
               value="<%=user.getName()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="text" name="surname"
               value="<%=user.getSurname()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="email" name="email"
               value="<%=user.getEmail()%>"><br>
        <input style="width: 300px; height: 30px; border-radius: 10px;margin-top: 5px" type="password" name="password"
               value="<%=user.getPassword()%>"><br>
        <input type="hidden" name="type"
               value="<%=user.getUserType().name()%>"><br>

        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px;margin-top: 10px"
               type="submit" value="update">
    </form>
</div>
</body>
</html>
