<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-12 col-m-12 col-sm-12">
    <div class="card">
        <div class="card-header">
            <h3>
                Product
            </h3>
            <a href="CreateProduct">
                <i class="fas fa-plus-circle"></i>
            </a>
        </div>
        <div class="product-content">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Sale</th>
                    <th>Description</th>
                    <th>Available</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listProduct}" var="product">
                        <tr>
                            <td>${product.productID}</td>
                            <td>${product.name}</td>
                            <td><img src="${product.image }" alt="${product.name}" style="height: 100px;"></td>
                            <td>
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price}" />đ
                            </td>
                            <td>
                                <fmt:formatNumber type="percent" value="${1 - product.sale}" />
                            </td>
                            <td>${product.description }</td>
                            <td>${product.available }</td>
                            <td>
                                <form method="get" action="UpdateProduct">
                                    <input type="hidden" name="id" value="${product.productID}" />
                                    <button type="submit" name="action" value="Update" class = "action-button">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                </form>
                            </td>
                            <td>
                                <form method="Post" action="DeleteProduct">
                                    <input type="hidden" name="id" value="${product.productID}" />
                                    <button type="submit" name="action" value="Delete" class = "action-button">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>