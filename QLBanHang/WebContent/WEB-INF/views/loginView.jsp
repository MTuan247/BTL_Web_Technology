<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<head>
<title>Đăng nhập | eShop</title>
<meta charset="UTF-8">
<meta name="viewport"
  content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="icon" type="image/png" href="assets/image/logo200px.png">

<link
  href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
  rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/aa8e5675e3.js"
  crossorigin="anonymous"></script>

<link href="assets/css/login.css" rel="stylesheet" type="text/css">
</head>

<%-- <body>
      <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
 
      <h3>Login Page</h3>
      <p style="color: red;">${errorString}</p>
 
 
      <form method="POST" action="${pageContext.request.contextPath}/Login">
         <table>
            <tr>
               <td>User Name</td>
               <td><input type="text" name="userName" value= "${user.userName}" /> </td>
            </tr>
            <tr>
               <td>Password</td>
               <td><input type="text" name="password" value= "${user.password}" /> </td>
            </tr>
            <tr>
               <td>Remember me</td>
               <td><input type="checkbox" name="rememberMe" value= "Y" /> </td>
            </tr>
            <tr>
               <td colspan ="2">
                  <input type="submit" value= "Submit" />
                  <a href="${pageContext.request.contextPath}/">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
 
      <p style="color:blue;">User Name: tuan, password: 123</p>
  --%>
<body class="overlay-scrollbar">

  <main class="main-content">
    <img src="assets/image/logo-side180_60px.png" alt="logo"
      class="logo"> <img src="assets/image/login.svg"
      alt="login img" class="img-side">
    <form class="login-form" action="${pageContext.request.contextPath}/Login" method="post">

      <div class="login-imgcontainer">
        <h2>Đăng nhập</h2>
      </div>
      <div class="login-container">
        <div class="label-container">
          <label class="label-item" for="username">Tên đăng nhập</label>
          <span>Chưa có tài khoản? <a href="sign-up.html">Đăng ký</a></span>
        </div>
        <input type="text" placeholder="Nhập tên đăng nhập" name="userName" required>


        <div class="label-container">
          <label class="label-item" for="password">Mật khẩu</label>
          <div class="show-hide-pwd" id="show-pwd" onclick="showPwd('hide-pwd', 'show-pwd', 'password')">
            <i class="fas fa-eye"></i> <span>Hiện</span>
          </div>
          <div class="show-hide-pwd hide" id="hide-pwd" onclick="hidePwd('hide-pwd', 'show-pwd', 'password')">
            <i class="fas fa-eye-slash"></i> <span>Ẩn</span>
          </div>
        </div>
        <input type="password" placeholder="Nhập mật khẩu" name="password" id="password" required> 
        <label><input type="checkbox" checked="checked" name="rememberMe">Lưu thông tin đăng nhập</label> 
        
        <p style="color: red;">${errorString}</p>
        
        
        <input type="submit" value="Đăng Nhập">
      </div>
    </form>
  </main>
  <jsp:include page="_footer2.jsp"></jsp:include>
   <script src="assets/js/index.js"></script>
    <script src="assets/js/scrollToTop.js"></script>
  </body>
  
</html>