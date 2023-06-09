<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
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
						aria-current="page" href="<c:url value='/login' />">登入</a></li>
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
	<section class="container py-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h2 class="text-center mb-4">註冊</h2>
				<form action="register" method="post" enctype="multipart/form-data">
					<div class="form-group mb-3">
						<label for="realname">姓名：</label> <input type="text"
							class="form-control" id="realname" name="realname" required>
					</div>
					<div class="form-group mb-3">
						<label for="account">帳號：</label> <input type="text"
							class="form-control" id="account" name="account" required>
					</div>
					<div class="form-group mb-3">
						<label for="password">密碼：</label> <input type="password"
							class="form-control" id="password" name="password" required>
					</div>
					<div class="form-group mb-3">
						<label for="phone">手機：</label> <input type="text"
							class="form-control" id="phone" name="phone" required>
					</div>
					<div class="form-group mb-3">
						<label for="birthday">生日：</label> <input type="date"
							class="form-control" id="birthday" name="birthday" required>
					</div>
					<div class="form-group mb-3">
						<label for="email">電子郵件：</label> <input type="email"
							class="form-control" id="email" name="email" required>
					</div>
					<div class="form-group mb-3">
						<label for="address">地址：</label> <input type="text"
							class="form-control" id="address" name="address" required>
					</div>
					<div class="form-group mb-3">
						<label for="male">男</label> <input type="radio" id="male"
							name="sex" value="男" /> <label for="female">女</label> <input
							type="radio" id="female" name="sex" value="女" />
					</div>
					<div class="form-group mb-3">
						<label for="picture">大頭貼：</label> <input type="file"
							class="form-control" id="picture" name="picture"
							accept="image/jpeg, image/png" required>
					</div>
					<button type="submit" class="btn btn-primary">註冊</button>
				</form>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">資展國際 &copy;
				跨域JAVA軟體工程師EEIT58</p>
		</div>
	</footer>
</body>
</html>