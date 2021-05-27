<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="_header.jsp"></jsp:include>

<head>
    <title>Thông tin thanh toán | eShop</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon" type="image/png" href="assets/image/logo200px.png" >

    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/aa8e5675e3.js" crossorigin="anonymous"></script>

    <!--  -->
    <link rel="stylesheet" type="text/css" href="assets/css/error_page.css">
    <link rel="stylesheet" type="text/css" href="assets/css/transaction.css">
    <link rel="stylesheet" type="text/css" href="assets/css/transaction-detail.css">
    <link rel="stylesheet" type="text/css" href="assets/css/cart.css">
    <link rel="stylesheet" type="text/css" href="assets/css/payment.css">
  </head>





<%-- <form method="post" action="Order">
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
</form> --%>

<div class="content">
        <h2 class="notice">1. Đơn hàng </h2>
        <div class="table-responsive-container">
          <table class="product-cart-table" >
            <tr>
              <th>Sản phẩm</th>
              <th>Tên sản phẩm</th>
              <th>Giá</th>
              <th>Số lượng</th>
            </tr>
            
           <jsp:include page="_listProductInOrder.jsp"></jsp:include>
    
          </table>
        </div>


        <hr class="hr-break">

        <form action="Order" method="POST" id="transaction-form">
        <h2 class="notice">2. Thông tin giao hàng</h2>
          <table class="address-table">
            <tr class="form-item">
              <td><label for="receiver-name">Họ tên</label></td>
              <td><input type="text" name="name" value="" required></td>
            </tr>
            <tr class="form-item">
              <td><label for="tel">Số điện thoại</label></td>
              <td>
              <input type="tel" name="phone_number" value="" 
              pattern="[0-9]{10}" title="Số điện thoại dài 10 chữ số" required>
              </td>
            </tr>
            <tr class="form-item">
              <td><label for="province">Tỉnh/Thành phố</label></td>
              <td>
                <select name="city" id="province" required>
                  <!-- disabled options need to have empty value fields: value="" -->
                  <option value="" selected disabled>Chọn Tỉnh/Thành phố</option>
                </select>
              </td>
            </tr>
            <tr class="form-item"> 
              <td><label for="district">Quận/Huyện</label></td>
              <td>
                <select name="district" id="district" required>
                  <option value="" selected disabled>Chọn Quận/Huyện</option>
                </select>
              </td>
            </tr>
            <tr class="form-item">
              <td><label for="ward">Phường/Xã</label></td>
              <td>
                <select name="ward" id="ward" required>
                  <option value="" selected disabled>Chọn Phường/Xã</option>
                </select>
              </td>
            </tr>
            <tr class="form-item">
              <td><label for="address">Địa chỉ</label></td>
              <td>
                <!-- Chú ý: Không xuống dòng giữa 2 thẻ textarea -->
                <textarea name="address" placeholder="Ví dụ: số 50, đường Lê Thanh Nghị" required></textarea>
              </td>
            </tr>
          </table>


          <hr class="hr-break">



          <h2 class="notice">3. Hình thức thanh toán</h2>
            <div class="payment-method">
              <label>
                <input type="radio" value="0" name="method" checked>
                <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-cod.svg">
                <span>Thanh toán tiền mặt khi nhận hàng</span>
              </label>
              <label class="upcoming-feature">
                <input type="radio" value="1" name="method" disabled>
                <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-credit.svg">
                <span>Thanh toán bằng thẻ quốc tế Visa, Master, JCB</span>
                <span>(tính năng sắp có)</span>
              </label>
              <label class="upcoming-feature">
                <input type="radio" value="2" name="method" disabled>
                <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-atm.svg">
                <span>Thẻ ATM nội địa/Internet Banking</span>
                <span>(tính năng sắp có)</span>
              </label>
              <label class="upcoming-feature">
                <input type="radio" value="3" name="method" disabled>
                <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-mo-mo.svg">
                <span>Thanh toán bằng ví MoMo</span>
                <span>(tính năng sắp có)</span>
              </label>
              <label class="upcoming-feature">
                <input type="radio" value="4" name="method" disabled>
                <img class="method-icon" src="https://cdn6.aptoide.com/imgs/9/c/e/9cee8d6902e9f024f98d965815a74fec_icon.png">
                <span>Thanh toán bằng ViettelPay</span>
                <span>(tính năng sắp có)</span>
              </label>
            </div>

              <table class="money-container ">
                <tr>
                  <td class="money-item">Tạm tính</td>
                  <td class="money-value">
                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${totalMoney }" /> đ
                  </td>
                </tr>
                <tr>
                  <td class="money-item">Phí vận chuyển</td>
                  <td class="money-value">0 đ</td>
                </tr>
                <tr>
                  <td class="money-item"><strong>Thành tiền</strong></td>
                  <td class="money-value" id="total-money">
                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${totalMoney }" /> đ
                  </td>
                </tr>
                <tr>
                  <td class="money-item"></td>
                  <td class="money-value" id="notice-VAT">(Đã bao gồm VAT nếu có)</td>
                </tr>
              </table>
            <!-- <input type="submit"class="pay-link" value="ĐẶT MUA"> -->
            <button type="submit"class="pay-link" value="Order">ĐẶT MUA</button>
        </form>
      </div>
      <div class="side-container">
        <img src="assets/image/wallet.svg">
        <table class="money-container">
          <tr>
            <td class="money-item">Tạm tính</td>
            <td class="money-value">
              <fmt:formatNumber type="number" maxFractionDigits="0" value="${totalMoney }" /> đ
            </td>
          </tr>
          <tr>
            <td class="money-item">Phí vận chuyển</td>
            <td class="money-value">0 đ</td>
          </tr>
          <tr>
            <td class="money-item"><strong>Thành tiền</strong></td>
            <td class="money-value" id="total-money">
              <fmt:formatNumber type="number" maxFractionDigits="0" value="${totalMoney }" /> đ
            </td>
          </tr>
          <tr>
            <td class="money-item"></td>
            <td class="money-value" id="notice-VAT">(Đã bao gồm VAT nếu có)</td>
          </tr>
        </table>
        <!-- <a href="#" class="pay-link">ĐẶT MUA</a> -->
      </div>
    </main>
    
    
<script src="assets/js/table.js"></script>
<script src="assets/js/product.js"></script>
<script src="assets/js/payment2.js"></script>
<jsp:include page="_footer.jsp"></jsp:include>
<script>
function clickRowLink(event) {
    if(event.target.matches('.img-product-row')) {
      var link = event.target.dataset.link;
      window.open(link);
    }
  }

  window.onclick = function(event) {
    clickRowLink(event);
  };
</script>
