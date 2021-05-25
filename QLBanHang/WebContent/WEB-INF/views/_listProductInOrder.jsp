
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
</table>