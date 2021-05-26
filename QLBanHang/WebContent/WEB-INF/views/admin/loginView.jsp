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

<body class="overlay-scrollbar">

<main class="main-content">
   <img src="assets/image/logo-side180_60px.png" alt="logo"
        class="logo"> <img src="assets/image/login.svg"
                           alt="login img" class="img-side">
   <form class="login-form" action="${pageContext.request.contextPath}/AdminLogin" method="post">

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
<script src="assets/js/index.js"></script>
</body>

</html>