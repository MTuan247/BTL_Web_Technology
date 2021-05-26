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
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="_header.jsp"></jsp:include>

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
<link rel="stylesheet" type="text/css" href="assets/css/transaction-detail.css">
 <link rel="stylesheet" type="text/css" href="assets/css/transaction.css">
</head>


<div class="sidebar">
  <div class="sidebar-title-container">
    <i class="fas fa-user-circle"></i>
    <p class="sidebar-title">
      Tài khoản của<br> <span id="user-name">${user.userName}</span>
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
      <h3>Chi tiết đơn hàng #${order.orderID}</h3>
      <p class="transaction-date">Ngày đặt hàng: ${order.createdDate}</p>
      
      <h5 class="transaction-info-title">TRẠNG THÁI ĐƠN HÀNG</h5>
      <div class="transaction-info-item">
          <c:if test="${!order.status}"><p style="color: var(--warning-color);">Pending</p></c:if>
          <c:if test="${order.status}"><p style="color: var(--success-color);">Confirm</p></c:if>
      </div>
      
      <h5 class="transaction-info-title">ĐỊA CHỈ NGƯỜI NHẬN</h5>
      <div class="transaction-info-item">
        <p id="receiver-name">${order.fullName}</p>
        <p>Địa chỉ: ${order.address }<p>
        <p>Điện thoại: ${order.phoneNumber}</p>
      </div>
      
      <h5 class="transaction-info-title">HÌNH THỨC THANH TOÁN</h5>
      <div class="transaction-info-item">
        <p>Thanh toán tiền mặt khi nhận hàng</p>
      </div>
      
      <h5 class="transaction-info-title">DANH SÁCH SẢN PHẨM</h5>
      <div class="table-responsive-container">
        <table>
          <tr>
            <th>Sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Giảm giá</th>
            <th>Tạm tính</th>
            <th>Số lượng</th>
          </tr>
          <jsp:include page="_listProductInOrderDetail.jsp"></jsp:include>
        </table>
      </div>
      <br>
      <table class="money-container">
        <tr>
          <td class="money-item">Tạm tính</td>
          <td class="money-value">
            <fmt:formatNumber type="number" maxFractionDigits="0" value="${order.totalMoney }" /> đ
          </td>
        </tr>
        <tr>
          <td class="money-item">Phí vận chuyển</td>
          <td class="money-value">0 đ</td>
        </tr>
        <tr>
          <td class="money-item">Tổng cộng</td>
          <td class="money-value" id="total-money">
            <fmt:formatNumber type="number" maxFractionDigits="0" value="${order.totalMoney }" /> đ
          </td>
        </tr>
      </table>
    </div>
  </main>



<script src="assets/js/table.js"></script>
<jsp:include page="_footer.jsp"></jsp:include>
<script>
function clickRowLink(event) {
    if(event.target.matches('.img-product-row')) {
      var link = event.target.dataset.link;
      window.open(link);
    }
  }

  window.onclick = function(event) {
    clickRowLink(event);
  };
</script>
