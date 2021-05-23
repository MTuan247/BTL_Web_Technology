<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3>${product.name }</h3>

	<div>
		<img src="${product.image }" alt="${product.name}" style="height: 100px;">
		<h4>${product.name}</h4>
		<h4>${product.description}</h4>
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
</html>