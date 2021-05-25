<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Home Page</title> -->
<!-- </head> -->
<!-- <body> -->

<%-- 	<jsp:include page="_header.jsp"></jsp:include> --%>
<%-- 	<jsp:include page="_menu.jsp"></jsp:include> --%>

<!-- 	<h3>Home Page</h3> -->

<%-- 	<jsp:include page="_listC.jsp"></jsp:include> --%>
<%-- 	<jsp:include page="_listP.jsp"></jsp:include> --%>

<%-- 	<jsp:include page="_footer.jsp"></jsp:include> --%>

<!-- </body> -->
<!-- </html> -->
<head>
    <title>eShop - Mua sắm online</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/css/slideshow.css">
    <link rel="stylesheet" type="text/css" href="assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="assets/css/product.css">
</head>
  
<jsp:include page="_header.jsp"></jsp:include>

<div class="slideshow-container">
  <div class="slide-item fade">
    <!-- <div class="numbertext">1 / 3</div> -->
    <img src="assets/image/slide1.jpg">
    <!-- <div class="text">Caption One</div> -->
  </div>
  <div class="slide-item fade">
    <!-- <div class="numbertext">2 / 3</div> -->
    <img src="assets/image/slide2.jpg">
    <!-- <div class="text">Caption Two</div> -->
  </div>
  <div class="slide-item fade">
    <!-- <div class="numbertext">3 / 3</div> -->
    <img src="assets/image/slide3.jpg">
    <!-- <div class="text">Caption Three</div> -->
  </div>

  <a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
    onclick="plusSlides(1)">&#10095;</a> <br>

  <div class="slideshow-dot-container">
    <span class="dot" onclick="currentSlide(1)"></span> <span
      class="dot" onclick="currentSlide(2)"></span> <span class="dot"
      onclick="currentSlide(3)"></span>
  </div>
</div>
<div class="container1">
  <div class="container1-item">
    <div>
      <i class="fas fa-shipping-fast"></i>
    </div>
    <span>Vận chuyển toàn quốc</span>
  </div>
  <div class="container1-item">
    <div>
      <i class="fas fa-laptop"></i>
    </div>
    <span>Sản phẩm đa dạng</span>
  </div>
  <div class="container1-item">
    <div>
      <i class="fas fa-ticket-alt"></i>
    </div>
    <span>Ưu đãi hấp dẫn</span>
  </div>
  <div class="container1-item">
    <div>
      <i class="fas fa-phone-alt"></i>
    </div>
    <span>Tư vấn 24/7</span>
  </div>

</div>

<div class="product-container">
  <a class="product-container-title" href="product.html">Sản phẩm
    nổi bật</a>
  <div class="flex">
    <jsp:include page="_listProductInHome.jsp"></jsp:include>
  </div>

  <a class="more-product-btn" href="product.html">Xem thêm sản phẩm</a>
</div>
</main>

<script src="assets/js/slideshow.js"></script>
<script src="assets/js/product.js"></script>
<jsp:include page="_footer.jsp"></jsp:include>

  