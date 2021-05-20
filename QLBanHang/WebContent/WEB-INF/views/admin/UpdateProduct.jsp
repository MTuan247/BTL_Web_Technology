<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update JSP</title>
</head>
<body>
<form action="UpdateProduct" method="POST">
    <h1>Update New Product</h1>
    <table>
        <tr>
            <td>Product's ID</td>
            <td><input type="text" name="id" value="${product.productID}"></td>
        </tr>
        <tr>
            <td>Product's Name</td>
            <td><input type="text" name="name" value="${product.name}"></td>
        </tr>
        <tr>
            <td>Image</td>
            <td><input type="text" name="image" value="${product.image}"></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><input type="text" name="description" value="${product.description}"></td>
        </tr>

        <tr>
            <td>Price</td>
            <td><input type="text" name="price" value="${product.price}"></td>
        </tr>
        <tr>
            <td>Sale</td>
            <td><input type="text" name="sale" value="${product.sale}"></td>
        </tr>
        <tr>
            <td>Available</td>
            <td><input type="text" name="available" value="${product.available}"></td>
        </tr>
<%--        <tr>--%>
<%--            <td colspan="2" align="right">--%>
<%--                <button type="submit">Update</button>--%>
<%--                <button type="reset">Reset</button>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
            <td>
                <button type="submit">Update</button>
            </td>
        </tr>
</form>
</body>
</html>
