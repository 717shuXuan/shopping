<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ecpay Checkout</title>
</head>
<body>
    <div class="container">
        <h1>綠界金流結帳</h1>
        <p>請確認您的訂單信息，然後點擊「確認結帳」按鈕以完成付款。</p>
        <!-- 付款表單將在此渲染 -->
        ${aioCheckOutALLForm}
    </div>
</body>
</html>
