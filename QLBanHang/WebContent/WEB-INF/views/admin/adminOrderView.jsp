<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<style>
    table, th, td {
        border: 1px solid black;
        padding: 1px;
        spacing: 1px;
        border-spacing: 1px;
    }
</style>

<table border="1" style="display: block;">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Phone number</th>
        <th>Address</th>
        <th>Total money</th>
        <th>User ID</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${listOrder}" var="order">
        <tr>
            <td>${order.orderID}</td>
            <td>${order.fullName}</td>
            <td>${order.phoneNumber}</td>
            <td>${order.address}</td>
            <td>${order.totalMoney}</td>
            <td>${order.userID}</td>
            <c:if test="${!order.isStatus()}"><td>Pending</td></c:if>
            <c:if test="${order.isStatus()}"><td>Confirm</td></c:if>
            <td>
                <form method="get" action="AdminOrderDetail">
                    <input type="hidden" name="id" value="${order.orderID}" />
                    <input type="submit" name="action" value="Detail" />
                </form>
            </td>
        </tr>
    </c:forEach>


</table>
</body>
</html>