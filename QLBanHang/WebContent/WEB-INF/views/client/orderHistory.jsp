<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
            <c:if test="${!order.status}"><td>Pending</td></c:if>
            <c:if test="${order.status}"><td>Confirm</td></c:if>
            <td>
                <form method="get" action="OrderDetail">
                    <input type="hidden" name="id" value="${order.orderID}" />
                    <input type="submit" name="action" value="Detail" />
                </form>
            </td>
        </tr>
    </c:forEach>


</table>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<head>
<title>Lịch sử đặt hàng | eShop</title>
<meta charset="UTF-8">
<meta name="viewport"
  content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="icon" type="image/png" href="assets/image/logo200px.png">

<link
  href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
  rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/aa8e5675e3.js"
  crossorigin="anonymous"></script>

<!--  -->
<link rel="stylesheet" type="text/css" href="assets/css/error_page.css">
<link rel="stylesheet" type="text/css" href="assets/css/user.css">
<c:if test="${listOrder.size() != 0}">
  <link rel="stylesheet" type="text/css"
    href="assets/css/transaction.css">
</c:if>

</head>
<jsp:include page="_header.jsp"></jsp:include>

<div class="sidebar">
  <div class="sidebar-title-container">
    <i class="fas fa-user-circle"></i>
    <p class="sidebar-title">
      Tài khoản của<br> <span id="user-name">${fn:escapeXml(user.userName)}</span>
    </p>
  </div>
  <!-- <p class="sidebar-title">Tài khoản của<br><span id="user-name">Phạm Trung Hiếu</span></p> -->
  <ul class="sidebar-menu">
    <li class="sidebar-item"><a
      href="${pageContext.request.contextPath}/UserInfo"
      class="sidebar-link"> <i class="fas fa-user"></i> <span>Thông
          tin tài khoản</span>
    </a></li>
    <li class="sidebar-item"><a
      href="${pageContext.request.contextPath}/OrderHistory"
      class="sidebar-link active-link"> <i
        class="fas fa-shopping-bag"></i> <span>Lịch sử mua hàng</span>
    </a></li>
    <li class="sidebar-item"><a
      href="${pageContext.request.contextPath}/Logout"
      class="sidebar-link"> <i class="fas fa-sign-out-alt"></i> <span>Đăng
          xuất</span>
    </a></li>
  </ul>
</div>
<div class="content">
  <h3>Đơn hàng của tôi</h3>
  <c:if test="${listOrder.size() == 0}">
    <p class="notice">Danh sách đơn hàng trống</p>
    <img src="assets/image/no_data.svg" class="img-notice">
    <a class="go-back-link" href="${pageContext.request.contextPath}/Home">Tiếp tục mua hàng</a>
  </c:if>
  <c:if test="${listOrder.size() != 0}">
    <div class="table-responsive-container">
      <table>
        <!-- <tr>
        <th>Mã đơn hàng</th>
        <th>Ngày mua</th>
        <th>Sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Trạng thái đơn hàng</th>
      </tr> -->

        <tr>
          <th>Mã đơn hàng</th>
          <th>Ngày đặt hàng</th>
          <th>Tên người nhận</th>
          <th>Số điện thoại</th>
          <th>Địa chỉ</th>
          <th>Giá trị</th>
          <th>Trạng thái</th>
        </tr>

        <c:forEach items="${listOrder}" var="order">
          <tr>
            <td class="table-row-link"
              data-link="${pageContext.request.contextPath}/OrderDetail?id=${order.orderID}">${order.orderID}</td>
            <td>${order.createdDate}</td>
            <td>${fn:escapeXml(order.fullName)}</td>
            <td>${fn:escapeXml(order.phoneNumber)}</td>
            <td>${fn:escapeXml(order.address)}</td>
            <td>
              <fmt:formatNumber type="number" maxFractionDigits="0" value="${order.totalMoney}" /> đ
            </td>
            <c:if test="${!order.status}">
              <td style="color: var(--warning-color);">Pending</td>
            </c:if>
            <c:if test="${order.status}">
              <td style="color: var(--success-color);">Confirm</td>
            </c:if>
            <%-- <td>
            <form method="get" action="OrderDetail">
              <input type="hidden" name="id" value="${order.orderID}" />
              <input type="submit" name="action" value="Detail" />
            </form>
          </td> --%>
          </tr>
        </c:forEach>
        <!-- <tr>

        <td class="table-row-link" data-link="#">123456</td>
        <td>5/5/2021</td>
        <td>Dell Latitude 7480</td>
        <td>15.000.000</td>
        <td>Giao hàng thành công</td>
      </tr> -->

      </table>
    </div>
  </c:if>
</div>
</main>


<jsp:include page="_footer.jsp"></jsp:include>
<script src="assets/js/table.js"></script>
