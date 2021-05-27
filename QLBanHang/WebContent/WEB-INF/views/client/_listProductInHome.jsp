<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>
<meta charset="UTF-8">
</head>
<!-- <table border="1" cellpadding="5" cellspacing="1" -->
<!-- 	style="display: inline-block;"> -->
<!-- 	<tr> -->
<!-- 		<th>ID</th> -->
<!-- 		<th>Name</th> -->
<!-- 		<th>Image</th> -->
<!-- 		<th>Price</th> -->
<!-- 		<th>Sale</th> -->
<!-- 		<th>Available</th> -->
<!-- 		<th>Action</th> -->
<!-- 	</tr> -->
<%-- 	<c:forEach items="${listProduct}" var="product"> --%>
<!-- 		<tr> -->
<%-- 			<td>${product.productID}</td> --%>
<%-- 			<td><a href="Product?productID=${product.productID }" >${product.name}</a></td> --%>
<%-- 			<td><img src="${product.image }" alt="${product.name}" --%>
<!-- 				style="height: 100px;"></td> -->
<%-- 			<td>${product.price}</td> --%>
<%-- 			<td>${product.sale }</td> --%>
<%-- 			<td>${product.available }</td> --%>
<!-- 			<td> -->
<!-- 				<form method="POST" action="Cart"> -->
<%-- 					<input type="hidden" name="productID" value="${product.productID}" /> --%>
<%-- 					<c:if test="${!product.isInCart() }"> --%>
<!-- 						<input type="submit" name="action" value="Add To Cart" /> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${product.isInCart() }"> --%>
<!-- 						<input type="submit" name="action" value="Remove From Cart" /> -->
<%-- 					</c:if> --%>
<!-- 				</form> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
<!-- </table> -->
<c:forEach items="${listProduct}" var="product" begin="1" end="6">
  <div class="flex-item product-item" data-link="Product?productID=${product.productID}">
    <img src="${product.image}" alt="${fn:escapeXml(product.name)}" loading="lazy"> 
    
    <c:if test="${product.sale != 1}">
      <span class="product-discount-tag">-<fmt:formatNumber type="percent" value="${1 - product.sale}" /></span>
    </c:if>
    
    <p class="product-name">
      <span>${fn:escapeXml(product.name)}</span>
    </p>
    
    <span class="product-price-after">
      <fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price*product.sale}" /> đ
    </span>
    
    <c:if test="${product.sale != 1}"> 
      <span class="product-price-before">
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price}" /> đ
      </span>
    </c:if>

    <%-- form method="POST" action="Cart" id="add-cart-form">
      <input type="hidden" name="productID" value="${product.productID}" />
      <c:if test="${!product.isInCart() }">
        <input type="submit" name="action" value="Add To Cart" />
      </c:if>
      <c:if test="${product.isInCart()}">
        <input type="submit" name="action" value="Remove From Cart" />
      </c:if>
    </form>

    <div class="add-cart-btn">
      <i class="fas fa-cart-plus"></i>
    </div> --%>
    
  </div>
</c:forEach>