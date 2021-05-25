<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
  <title>${product.name} | eShop</title>
  <meta charset="UTF-8">
  <meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
  <link rel="icon" type="image/png" href="assets/image/logo200px.png">

  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
  <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>

  <!--  -->
  <link rel="stylesheet" type="text/css" href="assets/css/product-detail.css">
</head>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3>${product.name }</h3>

	<jsp:include page="_listC.jsp"></jsp:include>
	<div style="display: inline-block; border-width: 1px; border-style: solid;" >
		<h4>${product.productID}</h4>
		<img src="${product.image }" alt="${product.name}" style="height: 100px;">
		<h4>${product.name}</h4>
		<h4>${product.price}</h4>
		<h4>${product.sale}</h4>
		<h4>${product.available}</h4>
		<form method="POST" action="Cart">
			<input type="hidden" name="productID" value="${product.productID}" />
			<c:if test="${!product.isInCart() }">
				<input type="submit" name="action" value="Add To Cart" />
			</c:if>
			<c:if test="${product.isInCart() }">
				<input type="submit" name="action" value="Remove From Cart" />
			</c:if>
		</form>
	</div>

	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html> --%>

<jsp:include page="_header.jsp"></jsp:include>

<div class="info-container">
      <div class="img-product-container">
        <h2 class="product-name">${product.name}</h2>
        <img src="${product.image}" alt="${product.name}">
      </div>
      <div class="detail-container">
        <h2 class="product-name">${product.name}</h2>
        <div class="product-price">
          <p class="price-end"><fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price*product.sale}" /> đ</p>
          <c:if test="${product.sale != 1}"> 
            <p class="price-discount">
              <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price}" /> đ</span> | <span>-<fmt:formatNumber type="percent" value="${1 - product.sale}" /></span>
            </p>
          </c:if>
        </div>

        <hr>
        <form method="POST" action="Cart" id="add-form">
          <input type="hidden" name="productID" value="${product.productID}" />
          <p>Số Lượng</p>
          <div class="product-qty-container">
            <span class="decrease-qty value-button" onclick="decreaseValue(this)">-</span>
            <input class="input-qty" type="number" name="number" value="1" min="1"  max="5" id="number" required>
            <span class="increase-qty value-button" onclick="increaseValue(this)">+</span>
          </div>
          <button type="submit" class="buy-btn" name="action" value="Add To Cart">Chọn Mua</button>
        </form>
        <%-- <div id="add-form">
          <input type="hidden" id="productID" name="productID" value="${product.productID}" />
          <p>Số Lượng</p>
          <div class="product-qty-container">
            <span class="decrease-qty value-button" onclick="decreaseValue(this)">-</span>
            <input class="input-qty" type="number" name="number" value="1" min="1"  max="5" id="number" required>
            <span class="increase-qty value-button" onclick="increaseValue(this)">+</span>
          </div>
          <button type="button" class="buy-btn" name="action" value="Add To Cart" onclick="addToCart()">Chọn Mua</button>
        </div> --%>
      </div>
    </div>

    <div class="description-container">
      <h3 class="description-title">Mô tả sản phẩm</h3>
      <p class="description-p">${product.description}</p>
    </div>


    
  </main>
  
<script src="assets/js/product.js"></script>
<jsp:include page="_footer.jsp"></jsp:include>
