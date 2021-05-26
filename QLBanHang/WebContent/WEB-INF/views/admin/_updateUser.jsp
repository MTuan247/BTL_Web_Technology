<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <h3 class="card-header" style="margin: 0px">
        Update User
    </h3>
    <form action="UpdateUser" method="POST">
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
            <c:if test="${invalidUsername}">
                <tr>
                    <td colspan="2">
                        <p style="color: red; margin: 0px;font-size: small">Username has already been taken</p>
                    </td>
                </tr>
            </c:if>
            <td>Password</td>
            <td><input type="text" name="password" value="${user.getPassword()}"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn-primary">Save</button>
                    <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/AdminUser'" class="btn-cancel" >Cancel</button>
                </td>
            </tr>
        </table>
    </form>
</div>
