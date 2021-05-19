<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="display: inline-block;">
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
</div>
