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

    <h3 id="TotalMoney">Total Money: ${order.totalMoney}</h3>
    <br>

    <h3>Order details</h3>
    <table>
        <tr>
            <td>Họ tên</td>
            <td><input type="text" name="name" value= "${order.fullName}" /></td>
        </tr>
        <tr>
            <td>Số điện thoại</td>
            <td><input type="text" name="phone_number" value= "${order.phoneNumber}" /></td>
        </tr>
        <tr>
            <td>Địa chỉ</td>
            <td><input type="text" name="address" value= "${order.address}" /></td>
        </tr>
    </table>

    <h3>Payment</h3>
    COD

</form>


<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>