<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="padding: 5px;">

	<a href="${pageContext.request.contextPath}/">Home</a> 
	| 
	<a href="Cart">Cart</a>
	| 
	<a href="${pageContext.request.contextPath}/UserInfo">My Account Info</a> 
	|
	<c:if test="${loginedUser.userName == null}">
		<a href="${pageContext.request.contextPath}/Login">Login</a>
	</c:if>
	<c:if test="${loginedUser.userName != null}">
		<a href="${pageContext.request.contextPath}/Logout">Logout</a>
	</c:if>

	<h3>
		<%
		//String url = request.getHeader("referer");
		String url = (String) request.getAttribute("javax.servlet.forward.request_uri");
		out.println(url);
		%>
	</h3>

</div>
