<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
table, th, td {
	border: 1px solid black;
	padding: 1px;
	spacing: 1px;
	border-spacing: 1px;
}
</style>
<script>
	function changeNumber(id) {
		var data = "action=Change&productID="+id;
		
		var xhttp = new XMLHttpRequest();	
		xhttp.open("POST", "Cart", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send(data);
	}
</script>

<table border="1" style="display: inline-block;">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Image</th>
		<th>Price</th>
		<th>Sale</th>
		<th>Available</th>
		<th>Number</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${listProduct}" var="product">
		<tr>
			<form method="POST" action="Cart">
				<td>${product.productID}</td>
				<td>${product.name}</td>
				<td><img src="${product.image }" alt="${product.name}" style="height: 100px;"></td>
				<td>${product.price}</td>
				<td>${product.sale }</td>
				<td>${product.available }</td>
	
				<td>
					<input type="number" onchange="changeNumber(${product.productID })" name="num" min="0" max="${product.available}" value="${product.num}" /> 
				</td>
				<td>
					<input type="hidden" name="productID" value="${product.productID}" /> 
					<input type="submit" name="action" value="Remove From Cart" />
				</td>
			</form>
		</tr>
	</c:forEach>
</table>