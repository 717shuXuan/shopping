<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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
					<%if (session.getAttribute("user") == null) {%>
					<button class="btn btn-outline-dark" type="button"
						onclick="showModalOrRedirectToProfile()">
						<i class="bi-person-fill me-1"></i> 我的帳戶
					</button>
					<%} else {%>
					<div class="btn-group">
						<button type="button" class="btn btn-outline-dark dropdown-toggle"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i class="bi-person-fill me-1"></i> 我的帳戶
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="<c:url value='/profile' />">個人資料</a>
							<a class="dropdown-item" href="<c:url value='/orders' />">我的訂單</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<c:url value='/logout' />">登出</a>
						</div>
					</div>
					<%}%>



					<!-- Login reminder modal -->
					<div class="modal fade" id="loginReminderModal" tabindex="-1"
						role="dialog" aria-labelledby="loginReminderModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="loginReminderModalLabel">提示</h5>
									<button type="button" class="close" data-bs-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">請先登入或註冊會員</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										onclick="redirectToRegister()">註冊</button>
									<button type="button" class="btn btn-primary"
										onclick="redirectToLogin()">登入</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Add this script at the end of the file -->
					<script>
						function showModalOrRedirectToProfile() {
					<%if (session.getAttribute("user") == null) {%>
						// Show modal if the user is not logged in
							$("#loginReminderModal").modal("show");
					<%} else {%>
						// Redirect to the profile page if the user is logged in
							window.location.href = "<c:url value='/profile' />";
							;
					<%}%>
						}

						function redirectToLogin() {
							window.location.href = "<c:url value='/login' />";
							;
						}

						function redirectToRegister() {
							window.location.href = "<c:url value='/register' />";
							;
						}
					</script>
					<button id="viewCartBtn" class="btn btn-outline-dark" type="button">
						<i class="bi-cart-fill me-1"></i> 購物車 <span
							class="badge bg-dark text-white ms-1 rounded-pill"></span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<header class="bg-dark py-3">
		<div class="container px-4 px-lg-5 my-3">
			<div class="text-center text-white">
				<h2 class="fw-bolder">聽說今天直接購買顯卡可以免運？</h2>
			</div>
		</div>
	</header>
	<!-- 商品搜索表单 -->
	<section class="container py-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<form action="${pageContext.request.contextPath}/products"
					method="get" class="d-flex">
					<input type="text" name="search" placeholder="你想找什麼？"
						class="form-control me-2">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-search me-1"></i>
					</button>
				</form>
			</div>
		</div>
	</section>


	<!-- 商品列表 -->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${products}" var="product">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- 可根据需要添加現貨标签 -->
							<div class="badge bg-dark text-white position-absolute"
								style="top: 0.5rem; right: 0.5rem">${product.stock}</div>
							<!-- 商品图片 -->
							<img src="data:image/jpeg;base64,${base64Images[product.id]}"
								alt="${product.name}" class="img-fluid"
								style="max-width: 100%; max-height: 500px;">
							<!-- 商品详情 -->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 商品名称 -->
									<h5 class="fw-bolder">${product.name}</h5>
									<!-- 商品价格 -->
									<p>
										售價:
										<fmt:formatNumber value="${product.price}" type="currency"
											currencySymbol="NT" minFractionDigits="0"
											maxFractionDigits="0" />

									</p>
								</div>
							</div>
							<!-- 商品操作 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="${pageContext.request.contextPath}/products/${product.id}">查看更多</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
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
	<script>
		document.getElementById('viewCartBtn').addEventListener('click',
				function() {
					window.location.href = "/test/cart";
				});
	</script>
</body>
</html>