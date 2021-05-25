<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>
<body>

<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="_menu.jsp"></jsp:include>

<form method="post" action="Order">
    <h3>Order</h3>
    <jsp:include page="_listProductInOrder.jsp"></jsp:include>
    <br>

    <h3 id="TotalMoney">Total Money: ${totalMoney }</h3>
    <br>

    <h3>Order details</h3>
    <table>
        <tr>
            <td>Họ tên</td>
            <td><input type="text" name="name" value= "${user.name}" /></td>
        </tr>
        <tr>
            <td>Số điện thoại</td>
            <td><input type="text" name="phone_number" value= "${user.phoneNumber}" /></td>
        </tr>
        <tr>
            <td>Tỉnh/Thành Phố</td>
            <td><input type="text" name="city" value= "" /></td>
        </tr>
        <tr>
            <td>Quận/Huyện</td>
            <td><input type="text" name="district" value= "" /></td>
        </tr>
        <tr>
            <td>Phường/Xã</td>
            <td><input type="text" name="ward" value= "" /></td>
        </tr>
        <tr>
            <td>Địa chỉ</td>
            <td><input type="text" name="address" value= "" /></td>
        </tr>
    </table>

    <h3>Payment</h3>
    COD

    <div><input type="submit" value="Order"/></div>
</form>


<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>