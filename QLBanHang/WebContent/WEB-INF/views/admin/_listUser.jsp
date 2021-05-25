<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Password</th>
                <th></th>
            </tr>

        </thead>
        <c:forEach items="${listUser}" var="user">
            <tbody>
                <tr>
                    <td>${user.userID}</td>
                    <td>${user.getName()}</td>
                    <td>${user.userName}</td>
                    <td>${user.password}</td>
                    <td>
                        <form method="get" action="UpdateUser">
                            <input type="hidden" name="id" value="${user.userID}" />
                            <button type="submit" name="action" value="Change Infomation" class="action-button">
                                <i class="fas fa-info-circle"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </tbody>
        </c:forEach>
    </table>
