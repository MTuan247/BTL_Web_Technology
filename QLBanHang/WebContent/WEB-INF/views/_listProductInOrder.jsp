<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="UTF-8">
</head>

<c:forEach items="${listProduct}" var="product">
  <tr>
    <td class="table-row-link"
      data-link="Product?productID=${product.productID}"><img
      class="img-product-row" src="${product.image}"
      data-link="Product?productID=${product.productID}"></td>
    <td class="product-name-row">${product.name}</td>
    <td class="product-price-row">
      <p class="price-end-row">
        <fmt:formatNumber type="number" maxFractionDigits="0"
          value="${product.price*product.sale}" />
        đ
      </p>
    </td>
    <td class="product-qty-row">SL: x${product.num }</td>
  </tr>

</c:forEach>

<script src="assets/js/product.js"></script>