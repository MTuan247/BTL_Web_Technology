<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table border="1" cellpadding="5" cellspacing="1"
	style="display: inline-block;">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Image</th>
		<th>Price</th>
		<th>Sale</th>
		<th>Available</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${listProduct}" var="product">
		<tr>
			<td>${product.productID}</td>
			<td><a href="Product?productID=${product.productID }" >${product.name}</a></td>
			<td><img src="${product.image }" alt="${product.name}"
				style="height: 100px;"></td>
			<td>${product.price}</td>
			<td>${product.sale }</td>
			<td>${product.available }</td>
			<td>
				<form method="POST" action="Cart">
					<input type="hidden" name="productID" value="${product.productID}" />
					<c:if test="${!product.isInCart() }">
						<input type="submit" name="action" value="Add To Cart" />
					</c:if>
					<c:if test="${product.isInCart() }">
						<input type="submit" name="action" value="Remove From Cart" />
					</c:if>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>