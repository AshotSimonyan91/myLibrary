<%@ page import="com.example.mylibrary.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mylibrary.model.UserType" %>
<%@ page import="com.example.mylibrary.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<% List<Author> authorsList = (List<Author>) request.getAttribute("authors");
    User user = (User) session.getAttribute("user");
%>
<body>
<a style="color: black;text-decoration: none" href="/"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Authors</h2>
    <table>
        <tr>
            <th>image</th>
            <th>id</th>
            <th>name</th>
            <th>surname</th>
            <th>email</th>
            <th>age</th>
            <% if (user.getUserType() == UserType.ADMIN) { %>
            <th>action</th>
            <%}%>
        </tr>
        <% if (authorsList != null && !authorsList.isEmpty()) {%>
        <% for (Author author : authorsList) { %>
        <tr>
            <td>
                <% if (author.getPicName() == null || author.getPicName().equalsIgnoreCase("null")) {%>
                <img src="/img/img.png" width="100">
                <%} else {%>
                <a href="/getAuthorImage?picName=<%=author.getPicName()%>"><img
                        src="/getAuthorImage?picName=<%=author.getPicName()%>" width="100"></a>
                <%}%>
            </td>
            <td><%=author.getId()%>
            </td>
            <td><%=author.getName()%>
            </td>
            <td><%=author.getSurname()%>
            </td>
            <td><%=author.getEmail()%>
            </td>
            <td><%=author.getAge()%>
            </td>
            <% if (user.getUserType() == UserType.ADMIN) { %>
            <td><a style="color: black;text-decoration: none" href="/removeAuthor?id=<%=author.getId()%>">Delete</a>
                / <a style="color: black;text-decoration: none" href="updateAuthor?id=<%=author.getId()%>">Edit</a></td>
            <%}%>
        </tr>
        <%}%>
        <%}%>
    </table>
</div>
</body>
</html>
