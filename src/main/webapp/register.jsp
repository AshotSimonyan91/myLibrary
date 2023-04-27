<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Page</title>
</head>
<body>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("/home");
    }
%>
<a style="color: black;text-decoration: none" href="/">Back</a>
<div style="display: flex; flex-direction: column;align-items: center">
    <h3>Register</h3>
    <form action="/register" method="post">
        <input style="width: 300px; height: 30px; border-radius: 10px" name="name" type="text"
               placeholder="name"><br/><br/>
        <input style="width: 300px; height: 30px; border-radius: 10px" name="surname" type="text" placeholder="surname"><br/><br/>
        <input style="width: 300px; height: 30px; border-radius: 10px" name="email" type="email"
               placeholder="email"><br/><br/>
        <input style="width: 300px; height: 30px; border-radius: 10px" name="password" type="password"
               placeholder="password"><br/><br/>
        <select style="width: 300px; height: 30px; border-radius: 10px" name="type">
            <option value="ADMIN">ADMIN</option>
            <option value="USER">USER</option>
        </select><br/><br/>
        <input style="width: 100px; height: 30px; margin-left: 100px; border-radius: 50px" type="submit"
               value="register">
    </form>
    <br/>

</div>
</body>
</html>
