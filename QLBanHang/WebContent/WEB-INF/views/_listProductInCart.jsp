<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function changeNumber(id) {
		var num = document.getElementById(id).value;
		var data = "action=Change&productID="+id+"&num="+num;
		
		var xhttp = new XMLHttpRequest();	
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		      document.getElementById("TotalMoney").innerHTML =
		      "Total Money: " + this.responseText;
		    }
		  };
		xhttp.open("POST", "Cart", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send(data);
	}
	
	function Buy() {
		var data = "action=Buy";
		
		var xhttp = new XMLHttpRequest();	
		xhttp.open("POST", "Cart", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send(data);
	}
</script>

<%-- <table border="1" style="display: block;">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Image</th>
		<th>Price</th>
		<th>Sale</th>
		<th>Available</th>
		<th>Number</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${listProduct}" var="product">
		<tr>
			<td>${product.productID}</td>
			<td><a href="Product?productID=${product.productID }" >${product.name}</a></td>
			<td><img src="${product.image }" alt="${product.name}" style="height: 100px;"></td>
			<td>${product.price}</td>
			<td>${product.sale }</td>
			<td>${product.available }</td>
	
			<td>
				<input id="${product.productID }" type="number" onchange="changeNumber(${product.productID})" name="num" min="0" max="${product.available}" value="${product.num}" /> 
			</td>
			<td>
				<form method="POST" action="Cart">
					<input type="hidden" name="productID" value="${product.productID}" /> 
					<input type="submit" name="action" value="Remove From Cart" />
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
<form method="POST" action="Cart" style="margin-top: 20px;">
	<input type="submit" name="action" value="Buy" />
</form> --%>

<c:forEach items="${listProduct}" var="product">
  <tr>
    <td class="table-row-link" data-link="#">
      <img class="img-product-row" src="${product.image}" alt="${product.name}">
    </td>
    <td class="product-name-row">${product.image}</td>
    <td class="product-price-row">
      <p class="price-end-row"><fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price*product.sale}" /> đ</p>
      <c:if test="${product.sale != 1}"> 
        <p class="price-discount-row">
          <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price}" /> đ</span> | <span>-<fmt:formatNumber type="percent" value="${1 - product.sale}" /></span>
        </p>
      </c:if>
    </td>
    <td class="product-qty-row">
      <div>
        <span class="decrease-qty value-button"
          onclick="decreaseValue(this)">-</span> <input
          class="input-qty" type="number" value="1" min="1" max="99"
          id="number" required> <span
          class="increase-qty value-button"
          onclick="increaseValue(this)">+</span>
      </div> <a href="#" class="remove-product-btn">Xóa</a>
    </td>
  </tr>
</c:forEach>
