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
        <th>Product</th>
        <th>Total money</th>
        <th>Status</th>
    </tr>
    <tr>
        <td>${order.orderID}</td>
        <td>${order.fullName}</td>
        <td>${order.phoneNumber}</td>
        <td>${order.address }</td>
        <td>
            <jsp:include page="_listProductInOrder.jsp"></jsp:include>
        </td>
        <td>${order.totalMoney }</td>
        <c:if test="${!order.status}"><td>Pending</td></c:if>
        <c:if test="${order.status}"><td>Confirm</td></c:if>
    </tr>

</table>
</body>
</html>
