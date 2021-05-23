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

	<h3>Cart</h3>

	<jsp:include page="_listProductInCart.jsp"></jsp:include>
	
	<br>
	<h3 id="TotalMoney">Total Money: ${totalMoney }</h3>
	<br>

	<form method="get" action="Order" style="margin-top: 20px;">
		<input type="submit" name="action" value="Buy" />
	</form>
	
	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>