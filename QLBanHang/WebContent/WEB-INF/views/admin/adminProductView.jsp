<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th style="vertical-align: top"><jsp:include page="./_listCategoryAdmin.jsp"></jsp:include></th>
        <th style="vertical-align: top"><jsp:include page="./_listProductAdmin.jsp"></jsp:include></th>
    </tr>

</table>
</body>
</html>
