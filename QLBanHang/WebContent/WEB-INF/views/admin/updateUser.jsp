<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update JSP</title>
</head>
<body>
<form action="UpdateUser" method="POST">
    <h1>Update User</h1>
    <table>
        <tr>
            <td>User's ID</td>
            <td><input type="text" name="id" value="${user.userID}"></td>
        </tr>
        <tr>
            <td>User's Name</td>
            <td><input type="text" name="name" value="${user.getName()}"></td>
        </tr>
        <tr>
            <td>User Name</td>
            <td><input type="text" name="username" value="${user.userName}"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="password" value="${user.password}"></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Update</button>
            </td>
        </tr>
</form>
</body>
</html>
