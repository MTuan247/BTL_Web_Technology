
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>
    <tr>
        <th>Product's name</th>
        <th>Product's image</th>
        <th>Product's price</th>
        <th>Product's sale</th>
        <th>Amount</th>
    </tr>
    <c:forEach items="${listProduct}" var="product">
        <tr>
            <td>${product.name}</td>
            <td><img src="${product.image }" alt="${product.name}" style="height: 100px;"></td>
            <td>${product.price}</td>
            <td>${product.sale }</td>
            <td>${product.num }</td>
        </tr>
    </c:forEach>
</table> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>
  <meta charset="UTF-8">
</head>

<c:forEach items="${listProduct}" var="product">
    <%-- <tr>
        <td>${product.name}</td>
        <td><img src="${product.image }" alt="${product.name}" style="height: 100px;"></td>
        <td>${product.price}</td>
        <td>${product.sale }</td>
        <td>${product.num }</td>
    </tr> --%>
    
    <tr>
      <%-- <td class="table-row-link" data-link="#">${product.productID}</td> --%>
      <td class="table-row-link" data-link="${pageContext.request.contextPath}/Product?productID=${product.productID}">
        <img class="img-product-row" style="width: 5rem; height: 5rem;" src="${product.image }" alt="${fn:escapeXml(product.name)}" data-link="${pageContext.request.contextPath}/Product?productID=${product.productID}">
      </td>
      <td>${fn:escapeXml(product.name)}</td>
      <td>
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price}" /> đ
      </td>
      <td>
        <fmt:formatNumber type="percent" value="${1 - product.sale}" />
      </td>
      <td>
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price*product.sale}" /> đ
      </td>
      <td>SLx ${product.num }</td>
    </tr>
</c:forEach>
