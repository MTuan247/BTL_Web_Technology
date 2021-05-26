<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
  <title>Thông tin tài khoản | eShop</title>
  <meta charset="UTF-8">
  <meta name="viewport"
    content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
  <link rel="icon" type="image/png" href="assets/image/logo200px.png">

  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
  <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>

  <!--  -->
  <link rel="stylesheet" type="text/css" href="assets/css/error_page.css">
  <link rel="stylesheet" type="text/css" href="assets/css/user.css">
</head>
<%-- <body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3>Hello: ${user.userName}</h3>

	User Name:
	<b>${user.userName}</b>
	<br />


	<br />

	<button
		onclick='window.location.href="${pageContext.request.contextPath}/Logout"'>Logout</button>

	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html> --%>
<jsp:include page="_header.jsp"></jsp:include>

<div class="sidebar">
      <div class="sidebar-title-container">
        <i class="fas fa-user-circle"></i>
        <p class="sidebar-title">Tài khoản của<br><span id="user-name">${user.userName}</span></p>
      </div>
      <!-- <p class="sidebar-title">Tài khoản của<br><span id="user-name">Phạm Trung Hiếu</span></p> -->
      <ul class="sidebar-menu">
        <li class="sidebar-item">
          <a href="${pageContext.request.contextPath}/UserInfo" class="sidebar-link active-link">
            <i class="fas fa-user"></i>
            <span>Thông tin tài khoản</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a href="#" class="sidebar-link">
            <i class="fas fa-shopping-bag"></i>
            <span>Lịch sử mua hàng</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a href="${pageContext.request.contextPath}/Logout" class="sidebar-link">
            <i class="fas fa-sign-out-alt"></i>
            <span>Đăng xuất</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="content">
      <h3>Thông tin tài khoản</h3>
      <form>
        <div class="form-item">
          <label for="name">Họ tên</label>
          <input type="text" name="name" value="${user.userName}">
        </div>

        <div class="form-item">
          <label for="tel">Số điện thoại</label>
          <input type="text" name="tel" value="">
        </div>

        <div class="form-item">
          <label for="email">Email</label>
          <input type="text" name="email" value="">
        </div>

        <div class="form-item">
          <label id="gender-label">Giới tính</label>
          <div>
            <label for="gender"><input type="radio" name="gender" value="Nam" checked>Nam</label>
            <label for="gender"><input type="radio" name="gender" value="Nữ">Nữ</label>
            <label for="gender"><input type="radio" name="gender" value="Khác">Khác</label>
          </div>
        </div>
        <div class="form-item">
          <input type="submit" name="update-info" value="Cập nhật">
        </div>
      </form>

      <h3>Thay đổi mật khẩu</h3>
      <form>
        <div class="form-item">
          <label for="old-password">Mật khẩu cũ</label>
          <input type="password" name="old-password" placeholder="Nhập mật khẩu cũ">
        </div>

        <div class="form-item">
          <label for="new-password">Mật khẩu mới</label>
          <input type="password" name="new-password" placeholder="Nhập mật khẩu mới">
        </div>

        <div class="form-item">
          <label for="new-password-retype">Nhập lại</label>
          <input type="password" name="new-password-retype" placeholder="Nhập lại mật khẩu mới">
        </div>

        <div class="form-item">
          <input type="submit" name="update-password" value="Cập nhật">
        </div>
      </form>
    </div>
  </main>
  
  <script src="assets/js/index.js"></script>
  <script src="assets/js/scrollToTop.js"></script>
<jsp:include page="_footer.jsp"></jsp:include>
