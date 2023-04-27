<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
</head>
<body>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("/home");
    }
    String msg = (String) session.getAttribute("msg");
%>
<% if (msg != null) {%>
<span style="color: red"><%=msg%></span><br>
<%
        session.removeAttribute("msg");
    }%>
<div style="display: flex; flex-direction: column;align-items: center">
    <h3>Login</h3>
    <form action="/login" method="post">
        <input style="width: 300px; height: 30px; border-radius: 10px" name="email" type="text"
               placeholder="email"><br/><br/>
        <input style="width: 300px; height: 30px; border-radius: 10px" name="password" type="password"
               placeholder="password"><br/><br/>
        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px" type="submit" value="login">
    </form>
    <br/>
    <a style="color: black;text-decoration: none" href="/register.jsp">Register</a>
</div>
</body>
</html>
