<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="_menu.jsp"></jsp:include>

<h3>Register Page</h3>
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
</form>


</body>
</html>