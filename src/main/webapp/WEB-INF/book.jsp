<%@ page import="com.example.mylibrary.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mylibrary.model.Book" %>
<%@ page import="com.example.mylibrary.model.UserType" %>
<%@ page import="com.example.mylibrary.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<% List<Book> bookList = (List<Book>) request.getAttribute("books");
    User user = (User) session.getAttribute("user");
%>
<body>
<a style="color: black;text-decoration: none" href="/"> Back </a>
<div style="display: flex;flex-direction: column;align-items: center;justify-content: center">
    <h2>Books</h2>
    <table border="1">
        <tr>
            <th>id</th>
            <th>title</th>
            <th>description</th>
            <th>price</th>
            <th>author</th>
            <% if (user.getUserType() == UserType.ADMIN) { %>
            <th>action</th>
            <%}%>
        </tr>
        <% if (bookList != null && !bookList.isEmpty()) {%>
        <% for (Book book : bookList) { %>
        <tr>
            <td><%=book.getId()%>
            </td>
            <td><%=book.getTitle()%>
            </td>
            <td><%=book.getDescription()%>
            </td>
            <td><%=book.getPrice()%>
            </td>
            <td><%=book.getAuthor().getName()%> <%=book.getAuthor().getSurname()%>
            </td>
            <% if (user.getUserType() == UserType.ADMIN) { %>
            <td><a style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none"
                   style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none"
                   href="/removeBook?id=<%=book.getId()%>">Delete</a>
                / <a style="color: black;margin-left: 5px;margin-right: 5px;font-size: 20px;text-decoration: none"
                     href="/updateBook?id=<%=book.getId()%>">Update</a></td>
            <%}%>
        </tr>
        <%}%>
        <%}%>
    </table>
</div>
</body>
</html>
