<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.List,Model.CartProduct"%>

<jsp:include page="_header.jsp"></jsp:include>


<head>
<title>Giỏ hàng | eShop</title>
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

<c:if test="${listProduct.size() == 0}">
  <link rel="stylesheet" type="text/css" href="assets/css/error_page.css">
  <link rel="stylesheet" type="text/css" href="assets/css/cart-empty.css">
</c:if>

<c:if test="${listProduct.size() != 0}">
  <link rel="stylesheet" type="text/css" href="assets/css/error_page.css">
<link rel="stylesheet" type="text/css" href="assets/css/transaction.css">
<link rel="stylesheet" type="text/css" href="assets/css/transaction-detail.css">
<link rel="stylesheet" type="text/css" href="assets/css/cart.css">
</c:if>
</head>

<%-- <jsp:include page="_header.jsp"></jsp:include> --%>
<c:if test="${listProduct.size() == 0}">
    <h2 class="notice">Giỏ hàng <span>(0 sản phẩm)</span></h2>
    <img src="assets/image/empty_cart.svg" class="img-notice">
     <p class="empty-notice">Không có sản phẩm nào trong giỏ hàng của bạn<p>
     <a class="go-back-link" href="${pageContext.request.contextPath}/">Tiếp tục mua sắm</a>
    </main>
</c:if>

<c:if test="${listProduct.size() != 0}">
<div class="content">
  <h2 class="notice">
    Giỏ hàng <span>(${listProduct.size()} sản phẩm)</span>
  </h2>
  <div class="table-responsive-container">
    <table class="product-cart-table">
      <tr>
        <th>Sản phẩm</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Số lượng</th>
      </tr>
      <jsp:include page="_listProductInCart.jsp"></jsp:include>
    </table>
  </div>
</div>
<div class="side-container">
  <img src="assets/image/wallet.svg">
  <table class="money-container">
    <tr>
      <td class="money-item">Tạm tính</td>
      <td class="money-value" id="tmp-money">
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${totalMoney}" /> đ
      </td>
    </tr>

    <tr>
      <td class="money-item">Tổng cộng</td>
      <td class="money-value" id="total-money">
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${totalMoney}" /> đ
      </td>
    </tr>
    <tr>
      <td class="money-item"></td>
      <td class="money-value" id="notice-VAT">(Đã bao gồm VAT nếu
        có)</td>
    </tr>
  </table>
  <a href="#" class="pay-link">Tiến hành thanh toán</a>
</div>
</main>
</c:if>

<jsp:include page="_footer.jsp"></jsp:include>
<script src="assets/js/table.js"></script>
<script src="assets/js/product.js"></script>

