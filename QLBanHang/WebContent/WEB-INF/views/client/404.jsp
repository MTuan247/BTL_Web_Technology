<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<head>
  <title>Không tìm thấy trang yêu cầu | 404 Error | eShop</title>
  <meta charset="UTF-8">
  <meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
  <link rel="icon" type="image/png" href="assets/image/logo200px.png">
  
  <link
    href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
    rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css">
  <script src="https://kit.fontawesome.com/aa8e5675e3.js"
    crossorigin="anonymous"></script>
  
  <!--  -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/error_page.css">
</head>
<jsp:include page="_header.jsp"></jsp:include>

  <h2 class="notice">Xin lỗi, trang bạn đang tìm kiếm không tồn tại!</h2>
  <img src="${pageContext.request.contextPath}/assets/image/page_not_found.svg" class="img-notice">
  <a class="go-back-link" href="${pageContext.request.contextPath}/Home">Quay về Trang Chủ</a>
</main>

<jsp:include page="_footer.jsp"></jsp:include>