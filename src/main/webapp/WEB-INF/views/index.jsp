<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
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
<body
	onload="showAlert('${logoutMessage}'); showAlert('${registerSuccessMessage}')">
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
					<c:choose>
						<c:when test="${!empty loggedInUserName}">
							<li id="welcome-message" class="nav-item"><span
								class="nav-link">歡迎，${loggedInUserName}！</span></li>
						</c:when>
					</c:choose>
					<li class="nav-item"><a class="nav-link" href="#!">關於我們</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">所有產品</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="<c:url value='/products' />">新品上市</a></li>
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
						<i class="bi-cart-fill me-1"></i> 購物車
					</button>
				</form>
			</div>
		</div>
	</nav>
	<header>
    <div class="background-gif position-absolute" style="width: 100%; height: 65%; background-image: url('<c:url value='/gifs/gundam-gundam-the-witch-from-mercury (1).gif' />'); background-repeat: no-repeat; background-size: cover; opacity: 1.0; z-index: -1;"></div>
    <div class="container px-4 px-lg-5 my-5">
        <!-- 其他內容... -->
        <div class="text-center text-white">
            <img src="<c:url value='/images/oshopV2.jpeg'/>" alt="Banner image"
                class="img-fluid" style="max-width: 20%; max-height: 500px;" />
            <h1 class="display-4 fw-bolder">買起來，	就對了</h1>
            <p class="lead fw-normal text-white-50 mb-0">感謝BootStrap大力贊助</p>
        </div>
    </div>
</header>
	<!-- Section -->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img
							src="<c:url value='/images/products/cmsickleflow200argb-6.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">主機板</h5>
								<!-- Product price-->
								NT4000 - Nt8000
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">查看更多</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">現貨</div>
						<!-- Product image-->
						<img src="<c:url value='/images/products/darkflashs100-7.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">螢幕</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">NT2000</span>
								NT1800
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">加入購物車</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">現貨</div>
						<!-- Product image-->
						<img src="<c:url value='/images/products/awunhl9aam5-4.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">電腦CPU</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">NT5000</span>
								NT2500
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">加入購物車</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img
							src="<c:url value='/images/products/SF514-54T-79C0-001.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">電腦機殼</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								NT4000
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">查看更多</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">現貨</div>
						<!-- Product image-->
						<img src="<c:url value='/images/products/SFX14-51G-70P8-6.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">SSD硬碟</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">NT5000</span>
								NT2500
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">加入購物車</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img src="<c:url value='/images/products/11.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">顯示卡</h5>
								<!-- Product price-->
								NT12000 - NT28000
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">更多詳情</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">現貨</div>
						<!-- Product image-->
						<img src="<c:url value='/images/products/montechmetal120-8.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">鍵盤</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">NT2000</span>
								NT1800
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">加入購物車</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img src="<c:url value='/images/products/scythekazeflex-9.png'/>"
							alt="Banner image" class="img-fluid"
							style="max-width: 100%; max-height: 500px;" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">滑鼠</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								NT4000
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">查看更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">資產國際 &copy;
				跨域JAVA軟體工程師EEIT58</p>
		</div>
	</footer>
	<script>
		document.getElementById('viewCartBtn').addEventListener('click',
				function() {
					window.location.href = "/test/cart";
				});

		function showAlert(message) {
			if (message) {
				alert(message);
			}
		}
	</script>
</body>
</html>
