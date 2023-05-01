<%@ page import="java.util.List" %>
<%@ page import="com.example.mylibrary.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
</head>
<% User user = (User) session.getAttribute("user"); %>

<body>
<a style="color: black;text-decoration: none" href="/home"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">

    <h2><%=user.getName()%> <%=user.getSurname()%>
    </h2>
    <div>
        <% if (user.getPicName() == null || user.getPicName().equalsIgnoreCase("null")) {%>
        <img src="/img/img.png" width="100">
        <%} else {%>
        <a href="/getUserImage?picName=<%=user.getPicName()%>"><img
                src="/getUserImage?picName=<%=user.getPicName()%>" width="100"></a>
        <%}%>
    </div>
    <div>
        <span>Name: </span><span style="font-size: 25px"><%=user.getName()%></span><br><br>
        <span>Surname: </span><span style="font-size: 25px"><%=user.getSurname()%></span><br><br>
        <span>Email: </span><span style="font-size: 25px"><%=user.getEmail()%></span>
    </div>
    <br><br>
    <a style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none"
       href="/updateUser?email=<%=user.getEmail()%>">Update</a>
</div>
</body>
</html>
