<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<div class="card">
    <h3 class="card-header" style="margin: 0px">
        Update Category
    </h3>
    <form action="UpdateCategory" method="POST">
        <table>
            <tr>
                <td>Category's ID</td>
                <td><input type="text" name="id" value="${fn:escapeXml(category.categoryID)}"></td>
            </tr>
            <tr>
                <td>Category's Name</td>
                <td><input type="text" name="name" value="${fn:escapeXml(category.getName())}"></td>
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
