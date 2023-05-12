<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
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

<script>
    function increaseQuantity(itemId) {
        updateQuantity(itemId, 1);
    }

    function decreaseQuantity(itemId) {
        updateQuantity(itemId, -1);
    }

    function updateQuantity(itemId, delta) {
        fetch('/test/cart/update/' + itemId, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'X-CSRF-TOKEN': document.querySelector('[name="_csrf"]').value
            },
            body: 'delta=' + delta
        })
        .then(function(response) {
            if (!response.ok) {
                throw new Error('更新失敗，請稍後重試');
            }
            return response.text();
        })
        .then(function(message) {
            alert(message);
            location.reload();
        })
        .catch(function(error) {
            alert(error.message);
        });
    }

    function deleteCartItem(itemId) {
        fetch('/test/cart/delete/' + itemId, {
            method: 'DELETE',
            headers: {
                'X-CSRF-TOKEN': document.querySelector('[name="_csrf"]').value
            }
        })
        .then(function(response) {
            if (!response.ok) {
                throw new Error('刪除失敗，請稍後重試');
            }
            return response.text();
        })
        .then(function(message) {
            alert(message);
            location.reload();
        })
        .catch(function(error) {
            alert(error.message);
        });
    }
</script>
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
						<i class="bi-cart-fill me-1"></i> 購物車 <span
							class="badge bg-dark text-white ms-1 rounded-pill"></span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">結帳前，請記得確認商品數量喔</h1>
			</div>
		</div>
	</header>
	<div class="container mt-5">
		<h2 class="mb-4">購物車</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">商品名稱</th>
					<th scope="col">數量</th>
					<th scope="col">價格</th>
					<th scope="col">總價</th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cartItems}">
					<tr>
						<td>${item.product.name}</td>
						<td>${item.quantity}</td>
						<td><fmt:formatNumber value="${item.product.price}"
								pattern="#,##0" /></td>
						<td><fmt:formatNumber
								value="${item.product.price * item.quantity}" pattern="#,##0" /></td>
						<td>
							<form action="<c:url value='/cart/update' />" method="post"
								class="d-inline">
								<input type="hidden" name="itemId" value="${item.id}" /> <input
									type="hidden" name="delta" value="1" />
								<button type="submit" class="btn btn-primary">+</button>
							</form>
							<form action="<c:url value='/cart/update' />" method="post"
								class="d-inline">
								<input type="hidden" name="itemId" value="${item.id}" /> <input
									type="hidden" name="delta" value="-1" />
								<button type="submit" class="btn btn-primary">-</button>
							</form> <a href="<c:url value='/products/${item.product.id}' />"
							class="btn btn-info">查看詳情</a>
							<form action="<c:url value='/cart/remove' />" method="post"
								class="d-inline">
								<input type="hidden" name="itemId" value="${item.id}" />
								<button type="submit" class="btn btn-danger">刪除</button>
							</form>
							<form action="<c:url value='/ecpayCheckout' />" method="post"
								id="checkoutForm">
								<button id="checkoutBtn" class="btn btn-success">結帳</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
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
		};
		
		$(document).ready(function () {
	        $("#checkoutBtn").click(function (event) {
	            event.preventDefault();
	            // 您的結帳邏輯將在這裡執行
	            // ...
	            $("#checkoutForm").submit();
	        });
	    });
	</script>
</body>
</html>