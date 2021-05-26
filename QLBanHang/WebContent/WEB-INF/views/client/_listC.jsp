<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
</head>
<%-- <div style="display: inline-block;">
	<table border="1" cellpadding="5" cellspacing="1" >
		<tr>
			<th>CategoryID</th>
			<th>Name</th>
		</tr>
		<c:forEach items="${listCategory}" var="category">
			<tr>
				<td>${category.categoryID}</td>
				<td><a href="Category?categoryID=${category.categoryID }">${category.name}</a></td>
			</tr>
		</c:forEach>
	</table>
</div> --%>

<c:forEach items="${listCategory}" var="category">
     <li class="sidebar-item">
          <a href="Category?categoryID=${category.categoryID }" class="sidebar-link">
            <span>${category.name}</span>
          </a>
      </li>
</c:forEach>
