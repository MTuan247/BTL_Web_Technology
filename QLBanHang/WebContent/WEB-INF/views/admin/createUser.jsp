<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="admin.CreateUserServlet"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update JSP</title>
</head>
<body>
<form action="CreateUser" method="POST">
    <h1>Create User</h1>
    <table>
        <tr>
            <td>User's ID</td>
            <td><input type="text" name="id" value="${user.getUserID()}"></td>
        </tr>
        <tr>
            <td>User's Name</td>
            <td><input type="text" name="name" value="${user.getName()}"></td>
        </tr>
        <tr>
            <td>Username</td>
            <td><input type="text" name="username" value="${user.getUserName()}"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <c:if test="${invalidUsername}">
                    <p style="color: red; margin: 0px;font-size: small">Username has already been taken</p>
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="password" value="${user.getPassword()}"></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Create</button>
            </td>
        </tr>
</form>
</body>
</html>
