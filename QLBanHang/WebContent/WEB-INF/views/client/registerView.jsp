<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

  <head>
    <title>Đăng ký | eShop</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon" type="image/png" href="assets/image/logo200px.png" >

    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>

    <link href="assets/css/login.css" rel="stylesheet" type="text/css">

  </head>

<%-- <h3>Register Page</h3>
<p style="color: red;">${errorString}</p>

<a href="Login" style="display: block">Login?</a>
<form method="POST" action="${pageContext.request.contextPath}/Register">
    <table>
        <tr>
            <td>User Name</td>
            <td><input type="text" name="userName" value= "${user.userName}" /> </td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="password" value= "" /> </td>
        </tr>
        <tr>
            <td>Confirm password</td>
            <td><input type="text" name="password-confirm" value= "" /> </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value= "Register" />
            </td>
        </tr>
    </table>
</form> --%>
<body class="overlay-scrollbar">

    <main class="main-content">
      <img src="assets/image/logo-side180_60px.png" alt="logo" class="logo">
      <img src="assets/image/sign_up.svg" alt="login img" class="img-side">
      <form class="login-form" action="${pageContext.request.contextPath}/Register" method="post">
        <div class="login-imgcontainer">
          <h2>Đăng ký</h2>
        </div>
        <div class="login-container">
          <div class="label-container">
            <label class="label-item" for="username">Tên đăng nhập</label>
            <span>Đã có tài khoản? <a href="${pageContext.request.contextPath}/Login">Đăng nhập</a></span>
          </div>
          <input type="text" name="userName" value= "${user.userName}" 
          pattern="[a-zA-Z][a-zA-Z0-9_]{2,19}"
          title="Tên tài khoản chỉ chứa chữ cái, số hoặc dấu gạch dưới; phải bắt đầu bằng chữ cái; dài từ 3 đến 20 ký tự"
          required>


          <div class="label-container">
            <label class="label-item" for="password">Mật khẩu</label>
            <div class="show-hide-pwd" id="show-pwd" onclick="showPwd('hide-pwd', 'show-pwd', 'password')">
              <i class="fas fa-eye"></i>
              <span>Hiện</span>
            </div>
            <div class="show-hide-pwd hide" id="hide-pwd" onclick="hidePwd('hide-pwd', 'show-pwd', 'password')">
              <i class="fas fa-eye-slash"></i>
              <span>Ẩn</span>
            </div>
          </div>
          <input type="password" name="password" id="password" 
          pattern="[a-zA-Z0-9]{3,20}"
          title="Mật khẩu chỉ chứa chữ cái hoặc số; dài từ 3 đến 20 ký tự" 
          onchange="check_pass()"
          required>

          <div class="label-container">
            <label class="label-item" for="password">Nhập lại mật khẩu</label>
            <div class="show-hide-pwd" id="show-pwd2" onclick="showPwd('hide-pwd2', 'show-pwd2', 'password-retype')">
              <i class="fas fa-eye"></i>
              <span>Hiện</span>
            </div>
            <div class="show-hide-pwd hide" id="hide-pwd2" onclick="hidePwd('hide-pwd2', 'show-pwd2', 'password-retype')">
              <i class="fas fa-eye-slash"></i>
              <span>Ẩn</span>
            </div>
          </div>
          <input type="password" name="password-confirm" id="password-retype" onchange="check_pass()" required>

          
          <p style="color: red; margin: 0" id="error-mesg">${errorString}</p>
          <button type="submit" value="Register" id="submit" disabled>Đăng ký miễn phí</button>
          <p class="sign-up-notice">Bằng việc nhấn vào nút "Đăng ký miễn phí", bạn sẽ được tạo tài khoản, và chấp nhận 
            <a href="#">Điều khoản sử dụng</a> và <a href="#">Chính sách bảo mật</a> của eShop
          </p>
        </div>
      </form>
    </main>
  <jsp:include page="_footer2.jsp"></jsp:include>
<script type="text/javascript">
function check_pass() {
    if (document.getElementById('password').value ==
            document.getElementById('password-retype').value) {
        document.getElementById('submit').disabled = false;
        document.getElementById('submit').style.cursor = 'pointer';
        document.getElementById('error-mesg').innerHTML = '';
    } else {
        document.getElementById('submit').disabled = true;
        document.getElementById('submit').style.cursor = 'not-allowed';
        document.getElementById('error-mesg').innerHTML = 'Mật khẩu nhập lại không khớp!';
    }
}
</script>