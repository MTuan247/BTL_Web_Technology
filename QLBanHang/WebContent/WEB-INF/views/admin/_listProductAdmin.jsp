<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table border="1" cellpadding="5" cellspacing="1"
       style="display: inline-block;">
    <tr><a href="/CreateProduct" style="display: block">Create a product</a></tr>
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
            <td>${product.name}</td>
            <td><img src="${product.image }" alt="${product.name}"
                     style="height: 100px;"></td>
            <td>${product.price}</td>
            <td>${product.sale }</td>
            <td>${product.available }</td>
            <td>
                <form method="get" action="UpdateProduct">
                    <input type="hidden" name="id" value="${product.productID}" />
                    <input type="submit" name="action" value="Change Infomation" />
                </form>
                <form method="Post" action="DeleteProduct">
                    <input type="hidden" name="id" value="${product.productID}" />
                    <input type="submit" name="delete" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>