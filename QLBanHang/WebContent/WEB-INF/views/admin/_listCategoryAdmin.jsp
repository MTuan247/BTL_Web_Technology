<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="sidebar">
    <table class="sidebar-nav">
        <tr>
            <td colspan="3">
                <h3>Category</h3>
            </td>
            <td>
                <a href="CreateCategory">
                    <i class="fas fa-plus-circle" style="color: black"></i>
                </a>
            </td>
        </tr>
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td colspan="2"></td>
        </tr>
        <c:forEach items="${listCategory}" var="category">
            <tr class="sidebar-nav-item">
                <td>${category.categoryID}</td>
                <td>
                    <a href="AdminCategory?categoryID=${category.categoryID }" class="sidebar-nav-link">
                            ${category.name}
                    </a>
                </td>
                <td>
                    <form method="get" action="UpdateCategory">
                        <input type="hidden" name="id" value="${category.categoryID}" />
                        <button type="submit" name="action" value="Update" class = "action-button">
                            <i class="fas fa-edit"></i>
                        </button>
                    </form>
                </td>
                <td>
                    <form method="Post" action="DeleteCategory">
                        <input type="hidden" name="id" value="${category.categoryID}" />
                        <button type="submit" name="action" value="Delete" class = "action-button">
                            <i class="fa fa-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


