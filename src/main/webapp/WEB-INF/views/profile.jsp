<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<div class="modal-body">請先登入</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary"
										onclick="redirectToLogin()">確定</button>
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
	<!-- Header-->
	<header class="bg-dark py-3">
		<div class="container px-4 px-lg-5 my-3">
			<div class="text-center text-white">
				<h2 class="fw-bolder">您的個人資料</h2>
			</div>
		</div>
	</header>

	<!-- Section-->
	<section class="container py-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img src="data:image/jpeg;base64,${base64Image}" alt="User Avatar"
							class="rounded-circle mb-3" style="width: 100px; height: 100px;">
						<table class="table table-borderless" >
							<tr>
								<th>姓名</th>
								<td>${user.realname}</td>
							</tr>
							<tr>
								<th>帳號</th>
								<td>${user.account}</td>
							</tr>
							<tr>
								<th>信箱</th>
								<td>${user.email}</td>
							</tr>
							<tr>
								<th>電話</th>
								<td>${user.phone}</td>
							</tr>
							<tr>
								<th>生日</th>
								<td>${user.birthday}</td>
							</tr>
							<tr>
								<th>地址</th>
								<td>${user.address}</td>
							</tr>
							<tr>
								<th>性別</th>
								<td>${user.sex}</td>
							</tr>

						</table>
						<a href="#" id="editProfileBtn" class="btn btn-primary">修改個人資料</a>
						<!-- Edit Profile Modal -->
						<div class="modal fade" id="editProfileModal" tabindex="-1"
							role="dialog" aria-labelledby="editProfileModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="editProfileModalLabel">修改個人資料</h5>
										<button type="button" class="close" data-bs-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form action="<c:url value='/editProfile' />" method="post"
										enctype="multipart/form-data">
										<div class="modal-body">
											<div class="form-group">
												<label for="realname">姓名</label> <input type="text"
													class="form-control" id="realname" name="realname"
													value="${user.realname}" required>
											</div>
											<div class="form-group">
												<label for="email">信箱</label> <input type="email"
													class="form-control" id="email" name="email"
													value="${user.email}" required>
											</div>
											<div class="form-group">
												<label for="phone">電話</label> <input type="text"
													class="form-control" id="phone" name="phone"
													value="${user.phone}" required>
											</div>
											<div class="form-group">
												<label for="birthday">生日</label> <input type="date"
													class="form-control" id="birthday" name="birthday"
													value="${user.birthday}" required>
											</div>
											<div class="form-group">
												<label for="address">地址</label> <input type="text"
													class="form-control" id="address" name="address"
													value="${user.address}" required>
											</div>
											<div class="form-group">
												<label for="sex">性別</label> <select class="form-control"
													id="sex" name="sex" required>
													<option value="男" ${user.sex == '男' ? 'selected' : ''}>男</option>
													<option value="女" ${user.sex == '女' ? 'selected' : ''}>女</option>
												</select>
											</div>

											<div class="form-group">
												<label for="picture">用戶頭像</label> <input type="file"
													class="form-control" id="picture" name="picture"
													accept="image/*">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<button type="submit" class="btn btn-primary">保存修改</button>
										</div>
									</form>
								</div>
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
		document.getElementById('editProfileBtn').addEventListener('click',
				function() {
					$('#editProfileModal').modal('show');
				});
	</script>

</body>
</html>
