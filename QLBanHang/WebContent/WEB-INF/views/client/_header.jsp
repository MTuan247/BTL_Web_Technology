<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 
<!-- <div style="background: #E0E0E0; height: 55px; padding: 5px;"> -->
<!-- 	<div style="float: left"> -->
<!-- 		<h1>My Site</h1> -->
<!-- 	</div> -->

<!-- 	<div style="float: right; padding: 10px; text-align: right;"> -->

<!-- 		<!-- User store in session with attribute: loginedUser -->
<%-- 		Hello <b>${loginedUser.userName}</b> <br /> --%>
		
<!-- 		<form method="get" action="Search" style="display: inline-block;" > -->
<!-- 			<input type="search" name="searchValue" /> -->
<!-- 			<input type="submit" value="Search" /> -->
<!-- 		</form> -->

<!-- 	</div> -->

<!-- </div> -->

<!DOCTYPE html>
<html>
  <head>
    <title>eShop - Mua sắm online</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon" type="image/png" href="assets/image/logo200px.png" >

    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    
    <!-- test: thêm ${pageContext.request.contextPath} trước assets-->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>

  </head>
  <body class="overlay-scrollbar">
    <header class="header" id="header">
      <!-- navbar -->
      
      <div class="navbar">
        <ul class="navbar-nav">
          <li class="navbar-item" id="navbar-menu-btn" onclick="toggleMenu()">
            <i class="fas fa-bars navbar-icon"></i>
          </li>
          <li class="navbar-item">
          <!-- test: thêm ${pageContext.request.contextPath} trước assets của img -->
            <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/image/logo-side1200_400px.png" alt="logo eshop" class="logo"></a>
          </li>
        </ul> 

        <ul class="navbar-nav navbar-tab">
          <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/" class="navbar-item-link" title="Trang chủ">Trang chủ</a>
          </li>
          <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/ProductList" class="navbar-item-link" title="Sản phẩm">Sản phẩm</a>
          </li>
          <li class="navbar-item">
            <a href="${pageContext.request.contextPath}/" class="navbar-item-link" title="Liên hệ">Liên hệ</a>
          </li>
        </ul> 

        <ul class="navbar-nav">
          <li class="navbar-item dropdown">
            <i class="fas fa-search navbar-search-icon navbar-icon dropdown-toggle" data-toggle="search-menu" title="Tìm kiếm"></i>
            <div id="search-menu" class="dropdown-menu">
              <form method="GET" action="Search" id="search-form" autocomplete="off">
                <input type="search" placeholder="Nhập từ khóa về sản phẩm" name="searchValue" id="search-bar">
                <input type="submit" value="Tìm kiếm" id="search-button">
              </form>
            </div>
          </li>
          <li class="navbar-item dropdown">
            <i class="fas fa-user dropdown-toggle navbar-icon " data-toggle="user-menu" title="Tài khoản"></i>
            <ul id="user-menu" class="dropdown-menu">
            
            
            <c:if test="${fn:escapeXml(loginedUser.userName) == null}">
              <li class="dropdown-menu-item">
                <a href="${pageContext.request.contextPath}/Login" class="dropdown-menu-link">
                  <i class="fas fa-sign-in-alt"></i>
                  <span>Đăng nhập/ Đăng ký</span>
                </a>
              </li>
            </c:if>
            
            
            <c:if test="${fn:escapeXml(loginedUser.userName) != null}">
              <li class="dropdown-menu-item">
                <a href="${pageContext.request.contextPath}/UserInfo" class="dropdown-menu-link">
                  <i class="fas fa-user"></i>
                  <span>Thông tin tài khoản</span>
                </a>
              </li>
              <li class="dropdown-menu-item">
                <a href="${pageContext.request.contextPath}/OrderHistory" class="dropdown-menu-link">
                  <i class="fas fa-shopping-bag"></i>
                  <span>Lịch sử mua hàng</span>
                </a>
              </li>
              <li class="dropdown-menu-item">
                <a href="${pageContext.request.contextPath}/Logout" class="dropdown-menu-link">
                  <i class="fas fa-sign-out-alt"></i>
                  <span>Đăng xuất</span>
                </a>
              </li>
            </c:if>
            
            
            </ul>
          </li>
          <li class="navbar-item">
            <div class="cart-wrapper" onclick=" window.location.href = 'Cart' ">
              <i class="fas fa-shopping-cart cart-icon navbar-icon" title="Giỏ hàng"></i>
              <span class="cart-number-product">${numberOfCartProduct}</span>
            </div>
          </li>
        </ul> 
        
      </div>
      <div class="navbar-column" id="navbar-menu">
        <ul class="navbar-nav-column ">
          <li class="navbar-item-column">
            <a href="${pageContext.request.contextPath}/" class="navbar-link-column" title="Trang chủ">Trang chủ</a>
          </li>
          <li class="navbar-item-column">
            <a href="${pageContext.request.contextPath}/ProductList" class="navbar-link-column" title="Sản phẩm">Sản phẩm</a>
          </li>
          <li class="navbar-item-column">
            <a href="${pageContext.request.contextPath}/" class="navbar-link-column" title="Liên hệ">Liên hệ</a>
          </li>
          
          <c:if test="${fn:escapeXml(loginedUser.userName) == null}">
            <li class="navbar-item-column">
              <a href="${pageContext.request.contextPath}/Login" class="navbar-link-column" title="Liên hệ">Đăng nhập/ Đăng ký</a>
            </li>
          </c:if>
        </ul>
      </div>
    </header>

<!-- test: thêm ${pageContext.request.contextPath} trước assets: fix cho trường hợp http://localhost:8080/QLBanHang/Home/123-->
    <main class="main-content">
      <div class="loading-wrapper">
        <img src="${pageContext.request.contextPath}/assets/image/logo-side180_60px.png" class="loading-logo logo">
        <p>Đang tải trang, bạn chờ một chút nhé ^^</p>
        <img src="${pageContext.request.contextPath}/assets/image/loading4-crop.gif" class="loading-gif">
      </div>