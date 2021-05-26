<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order</title>
    <!-- Import lib -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    <link rel="stylesheet" type="text/css" href="assets-admin/fontawesome-free/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <!-- End import lib -->

    <link rel="stylesheet" type="text/css" href="assets-admin/css/style.css">
</head>
<body class="overlay-scrollbar">
<!-- navbar -->
<jsp:include page="_navbar.jsp"></jsp:include>
<div class="wrapper">
    <div class="row">
        <div class="col-m-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h3>
                        Order
                    </h3>
                </div>
                <div class="pdoduct-content">
                    <table>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Total money</th>
                            <th>User ID</th>
                            <th>Status</th>
                            <th>Created date</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
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
                                <td>${order.createdDate}</td>
                                <td>
                                    <form class="navbar-nav nav-left">
                                        <li class="nav-item">
                                            <a class="nav-link" href="${pageContext.request.contextPath }/AdminOrderDetail?id=${order.orderID}">
                                                <i class="fas fa-info-circle"></i>
                                            </a>
                                        </li>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end main content -->
<!-- import script -->
<script src="assets-admin/js/index.js"></script>
<!-- end import script -->
</body>
</html>