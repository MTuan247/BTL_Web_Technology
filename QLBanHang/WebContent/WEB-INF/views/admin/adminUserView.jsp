<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<jsp:include page="./_listUser.jsp"></jsp:include>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin User</title>
    <!-- Import lib -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    <link rel="stylesheet" type="text/css" href="/assets-admin/fontawesome-free/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <!-- End import lib -->

    <link rel="stylesheet" type="text/css" href="/assets-admin/css/style.css">
</head>
<body class="overlay-scrollbar">
<c:if test="${doCreateUser}">
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <jsp:include page="_createUser.jsp"></jsp:include>
        </div>
    </div>
</c:if>
<c:if test="${doUpdateUser}">
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <jsp:include page="_updateUser.jsp"></jsp:include>
        </div>
    </div>
</c:if>
<!-- navbar -->
<jsp:include page="_navbar.jsp"></jsp:include>
<div class="wrapper">
    <div class="row">
        <div class="col-m-12 col-sm-12" style="width: 75% ; margin: auto">
            <div class="card">
                <div class="card-header">
                    <h3>
                        User
                    </h3>
                    <a href="CreateUser">
                        <i class="fas fa-plus-circle"></i>
                    </a>
                </div>
                <div>
                    <jsp:include page="_listUser.jsp"></jsp:include>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end main content -->
<!-- import script -->
<script src="/assets-admin/js/index.js"></script>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            window.location.href = "/AdminUser";
        }
    }
</script>
<!-- end import script -->
</body>
</html>
