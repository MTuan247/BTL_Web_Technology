<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%-- 	<jsp:include page="_header.jsp"></jsp:include> --%>
<%-- 	<jsp:include page="_menu.jsp"></jsp:include> --%>

<!-- 	<h3>Home Page</h3> -->

<%-- 	<jsp:include page="_listC.jsp"></jsp:include> --%>
<%-- 	<jsp:include page="_listP.jsp"></jsp:include> --%>

<%-- 	<jsp:include page="_footer.jsp"></jsp:include> --%>

<!-- </body> -->
<!-- </html> -->

  
<jsp:include page="_header.jsp"></jsp:include>
<head>
  <title>Sản phẩm | eShop</title>
  <meta charset="UTF-8">
  <meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
  <link rel="icon" type="image/png" href="assets/image/logo200px.png">

  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
  <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>

  <!--  -->
  <link rel="stylesheet" type="text/css" href="assets/css/user.css">
  <link rel="stylesheet" type="text/css" href="assets/css/product.css">
</head>

<div class="sidebar" id="sidebar">
      <p class="cat-title">Danh mục sản phẩm</p>
      <ul class="sidebar-menu">
      
        <jsp:include page="_listC.jsp"></jsp:include>
        
      </ul>
    </div>

    <div class="content">
    
    <c:if test="${param.searchValue != null}">
      <p>Kết quả tìm kiếm <strong> "${param.searchValue}" </strong></p>
      
    </c:if>
    
    <c:if test="${param.searchValue == null}">
      <h2 id="page-title">Sản phẩm</h2>
    </c:if>
    
    <c:choose>
      <c:when test="${param.searchValue != null && listProduct.size() == 0}">
        <div style="text-align: center">
          <p >Không tìm thấy sản phẩm phù hợp!</p>
          <img style="max-width: 60%" src="assets/image/search-empty.svg">
        </div>
      </c:when>
      
      <c:otherwise>
        <div class="flex">
          <jsp:include page="_listP.jsp"></jsp:include>
        </div>
      </c:otherwise>
      
    </c:choose>
      
    </div>
  </main>


<script src="assets/js/product.js"></script>
<jsp:include page="_footer.jsp"></jsp:include>
