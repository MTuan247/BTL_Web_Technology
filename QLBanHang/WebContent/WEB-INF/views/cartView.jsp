<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List,Model.CartProduct" %>

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
	
	<%	
		float sum = 0;
		List<CartProduct> list = (List<CartProduct>) request.getAttribute("listProduct");
		for (CartProduct o : list){
			sum += o.getPrice() * o.getSale() * o.getNum();
		}
		
		out.println("<br>");
		out.println("<h3> Total Money: ");
		out.println(sum);
		out.println("</h3>");
		out.println("<br>");
	%>


	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>