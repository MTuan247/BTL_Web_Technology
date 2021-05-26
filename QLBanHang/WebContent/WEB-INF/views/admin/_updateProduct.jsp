<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <h3 class="card-header" style="margin: 0px">
        Update Product
    </h3>
    <form action="UpdateProduct" method="POST">
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
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn-primary">Save</button>
                    <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/Admin'" class="btn-cancel">Cancel</button>
                </td>
            </tr>
        </table>
    </form>
</div>
