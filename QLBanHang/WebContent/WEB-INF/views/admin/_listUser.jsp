<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="display: inline-block;">
    <table border="1" cellpadding="5" cellspacing="1" >
        <tr><a href="/CreateUser" style="display: block">Create New User</a></tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Username</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${listUser}" var="user">
            <tr>
                <td>${user.userID}</td>
                <td>${user.getName()}</td>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>
                    <form method="get" action="UpdateUser">
                        <input type="hidden" name="id" value="${user.userID}" />
                        <input type="submit" name="action" value="Change Infomation" />
                    </form>
                    <form method="Post" action="DeleteUser">
                        <input type="hidden" name="id" value="${user.userID}" />
                        <input type="submit" name="delete" value="Delete" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
