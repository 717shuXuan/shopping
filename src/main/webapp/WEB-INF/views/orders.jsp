<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.custom-table {
	width: 150%;
	table-layout: fixed;
}

.custom-table th {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
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
					<%}%>
						}

						function redirectToLogin() {
							window.location.href = "<c:url value='/login' />";
						}
					</script>
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> 購物車 
					</button>
				</form>
			</div>
		</div>
	</nav>
	<header class="bg-dark py-3">
		<div class="container px-4 px-lg-5 my-3">
			<div class="text-center text-white">
				<h2 class="fw-bolder">您的訂單資訊</h2>
			</div>
		</div>
	</header>
	<!-- Section-->
	<section class="container py-5">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header bg-primary text-white"></div>
					<div class="card-body">
						<table class="table table-striped table-hover custom-table">
							<thead class="thead-dark">
								<tr>
									<th class="text-center" style="width: 10%;">訂單 ID</th>
									<th class="text-center" style="width: 20%;">商品名稱</th>
									<th class="text-center" style="width: 10%;">價格</th>
									<th class="text-center" style="width: 10%;">數量</th>
									<th class="text-center" style="width: 15%;">總金額</th>
									<th class="text-center" style="width: 20%;">訂單日期</th>
									<th class="text-center" style="width: 15%;">狀態</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${ordersPage.content}">
									<c:forEach var="orderItem" items="${order.orderItems}">
										<tr>
											<td class="text-center">${order.orderId}</td>
											<td class="text-center">${orderItem.product.name}</td>
											<td class="text-center"><fmt:formatNumber
													value="${orderItem.unitPrice}" pattern="#,##0" /></td>
											<td class="text-center">${orderItem.quantity}</td>
											<td class="text-center"><fmt:formatNumber
													value="${orderItem.totalPrice}" pattern="#,##0" /></td>
											<td class="text-center"><fmt:formatDate
													value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
											<td class="text-center">${order.status}</td>
										</tr>
									</c:forEach>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Pagination -->
		<nav aria-label="Page navigation example" class="mt-4">
			<ul class="pagination justify-content-center">
				<li
					class="page-item <c:if test="${ordersPage.first}">disabled</c:if>">
					<a class="page-link" href="?page=0&size=${ordersPage.size}">第一頁</a>
				</li>
				<li
					class="page-item <c:if test="${ordersPage.first}">disabled</c:if>">
					<a class="page-link"
					href="?page=${ordersPage.number - 1}&size=${ordersPage.size}">上一頁</a>
				</li>
				<c:forEach begin="0" end="${ordersPage.totalPages - 1}"
					var="pageNum">
					<li
						class="page-item <c:if test="${pageNum == ordersPage.number}">active</c:if>">
						<a class="page-link"
						href="?page=${pageNum}&size=${ordersPage.size}">${pageNum + 1}</a>
					</li>
				</c:forEach>
				<li
					class="page-item <c:if test="${ordersPage.last}">disabled</c:if>">
					<a class="page-link"
					href="?page=${ordersPage.number + 1}&size=${ordersPage.size}">下一頁</a>
				</li>
				<li
					class="page-item <c:if test="${ordersPage.last}">disabled</c:if>">
					<a class="page-link"
					href="?page=${ordersPage.totalPages - 1}&size=${ordersPage.size}">最後一頁</a>
				</li>
			</ul>
		</nav>
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
