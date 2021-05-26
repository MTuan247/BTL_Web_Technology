<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="_header.jsp"></jsp:include>
<head>
    <title>Đặt hàng thành công | eShop</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon" type="image/png" href="assets/image/logo200px.png" >

    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>

    <!--  -->
    <link rel="stylesheet" type="text/css" href="assets/css/error_page.css">
  </head>

<%-- <form method="post" action="Order">
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

</form> --%>

  <h2 class="notice">Đặt hàng thành công! Cảm ơn bạn đã mua hàng!</h2>
  <img src="assets/image/successful_purchase.svg" class="img-notice">
  <a class="go-back-link" href="${pageContext.request.contextPath}/Home">Tiếp tục mua hàng</a>
</main>

<jsp:include page="_footer.jsp"></jsp:include>
