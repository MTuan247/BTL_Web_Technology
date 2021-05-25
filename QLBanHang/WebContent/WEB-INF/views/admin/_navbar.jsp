<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/25/2021
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar">
    <ul class="navbar-nav nav-right">
        <li><a href="/Admin" class="nav-link">Admin Product</a></li>
        <li><a href="/AdminOrder" class="nav-link">Admin Order</a></li>
        <li><a href="/AdminUser" class="nav-link">Admin User</a></li>
    </ul>
    <ul class="navbar-nav">
        <li class="nav-item mode">
            <a class="nav-link" href="#" onclick="switchTheme()">
                <i class="fas fa-moon dark-icon"></i>
                <i class="fas fa-sun light-icon"></i>
            </a>
        </li>
    </ul>
    <!-- end nav right -->
</div>
