<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Quản lý đơn hàng</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon" type="image/png" href="assets/image/logo200px.png">

    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/slideshow.css">

    <!--  -->
    <link rel="stylesheet" type="text/css" href="assets/css/error_page.css">
    <link rel="stylesheet" type="text/css" href="assets/css/user.css">
    <link rel="stylesheet" type="text/css" href="assets/css/transaction-detail.css">
    <link rel="stylesheet" type="text/css" href="assets/css/transaction.css">
</head>

<body class="overlay-scrollbar">
<jsp:include page="_navbar.jsp"></jsp:include>
    <div class="content" style="margin: auto">
        <h3>Chi tiết đơn hàng #${order.orderID}</h3>
        <p class="transaction-date">Ngày đặt hàng: ${order.createdDate}</p>
        <h5 class="transaction-info-title">ĐỊA CHỈ NGƯỜI NHẬN</h5>
        <div class="transaction-info-item">
            <p id="receiver-name">${order.fullName.toUpperCase()}</p>
            <p>Địa chỉ: ${order.address }<p>
            <p>Điện thoại: ${order.phoneNumber}</p>
        </div>
        <h5 class="transaction-info-title">HÌNH THỨC THANH TOÁN</h5>
        <div class="transaction-info-item">
            <p>Thanh toán tiền mặt khi nhận hàng</p>
        </div>
        <h5 class="transaction-info-title">DANH SÁCH SẢN PHẨM</h5>
        <jsp:include page="_listProductInOrder.jsp"></jsp:include>
        <br>
        <table class="money-container">
            <tr>
                <td class="money-item">Tạm tính</td>
                <td class="money-value">${order.totalMoney }</td>
            </tr>
            <tr>
                <td class="money-item">Phí vận chuyển</td>
                <td class="money-value">0 đ</td>
            </tr>
            <tr>
                <td class="money-item">Tổng cộng</td>
                <td class="money-value" id="total-money">${order.totalMoney }</td>
            </tr>
        </table>
        <h5 class="transaction-info-title">TRẠNG THÁI ĐƠN HÀNG</h5>
        <div class="transaction-info-item" style="width: max-content; border: none" >
                <c:if test="${!order.status}">
                    Đang giao hàng
                    <form method="Post" action="UpdateOrder" style="display: inline; vertical-align: middle; margin-left: 20px;">
                        <input type="hidden" name="id" value="${order.orderID}" />
                        <button type="submit" name="action" value="Confirm" class="action-button" style="color: darkolivegreen">
                            <i class="fas fa-check-circle"></i>
                        </button>
                    </form>
                </c:if>
                <c:if test="${order.status}">
                    Đã nhận hàng
                    <form method="Post" action="UpdateOrder" style="display: inline; vertical-align: middle; margin-left: 20px;">
                        <input type="hidden" name="id" value="${order.orderID}" />
                        <button type="submit" name="action" value="Pending" class="action-button" style="color: red">
                            <i class="fas fa-times-circle"></i>
                        </button>
                    </form>
                </c:if>
        </div>
    </div>
    <hr>
<a id="go-to-head" onclick="topFunction()">
    <i class="fas fa-angle-up"></i>
</a>

<!-- <script src="assets/js/table.js"></script> -->
<script src="assets/js/index.js"></script>
<script src="assets/js/table.js"></script>
<script src="assets/js/scrollToTop.js"></script>
</body>

</html>