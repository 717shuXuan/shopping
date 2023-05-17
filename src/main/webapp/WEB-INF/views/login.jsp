<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Original Shop</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/oShopBlack-no.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">
<!-- Core theme JS-->
<script src="<c:url value='/js/scripts.js' />"></script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:choose>
	<c:when test="${message=='sessionMiss'}">
		<script type="text/javascript">
			alert("連線逾時，請重新登入")
		</script>
	</c:when>
</c:choose>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/test">Original Shop</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="<c:url value='/register' />">註冊</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">關於我們</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">所有產品</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">新品上市</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">熱門產品</a></li>
							<li><a class="dropdown-item" href="#!">折扣專區</a></li>
						</ul></li>
				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> 購物車 <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-3">
		<div class="container px-4 px-lg-5 my-3">
			<div class="text-center text-white">
				<h2 class="fw-bolder">買起來，就對了</h2>
			</div>
		</div>
	</header>
	<!-- Section-->
	<c:if test="${not empty message}">
    <div class="alert alert-warning" role="alert">${message}</div>
</c:if>
<section class="container py-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h2 class="text-center mb-4">登入</h2>
            <form id="loginForm" action="login" method="post">
                <div class="form-group mb-3">
                    <label for="role">身份</label>
                    <select class="form-control" id="role" name="role">
                        <option value="user">一般用戶</option>
                        <option value="admin">管理員</option>
                    </select>
                </div>
                <div class="form-group mb-3">
                    <label for="username">帳號</label> <input type="text"
                        class="form-control" id="username" name="account" required>
                </div>
                <div class="form-group mb-3">
                    <label for="password">密碼</label> <input type="password"
                        class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">登入</button>
            </form>
        </div>
    </div>
</section>
<script>
    function updateFormAction() {
        var form = document.getElementById('loginForm');
        var role = document.getElementById('role');
        if (role.value == 'admin') {
            form.action = '/test/admin/login';
        } else {
            form.action = '/test/login';
        }
    }
    document.getElementById('role').addEventListener('change', updateFormAction);
    // 立即执行一次，以确保表单的action属性在页面加载时被正确设置
    updateFormAction();
</script>
<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">資展國際 &copy;
				跨域JAVA軟體工程師EEIT58</p>
		</div>
	</footer>
</body>
</html>