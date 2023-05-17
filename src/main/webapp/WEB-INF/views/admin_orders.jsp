<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Order Management</title>
</head>
<body>
    <h1>Order Management</h1>

    <c:forEach var="order" items="${orders}">
        <h2>Order ID: ${order.id}</h2>
        <table>
            <tr>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
            <c:forEach var="item" items="${order.items}">
                <tr>
                    <td>${item.product.id}</td>
                    <td>${item.quantity}</td>
                    <td>${item.product.price}</td>
                    <td>${item.product.price * item.quantity}</td>
                </tr>
            </c:forEach>
        </table>
        <p>Status: ${order.status}</p>
        <a href="<c:url value='/admin/ship_order?id=${order.id}'/>">Ship Order</a> | 
        <a href="<c:url value='/admin/delete_order?id=${order.id}'/>">Delete Order</a>
    </c:forEach>

    <a href="<c:url value='/adminIndex.jsp'/>">Back to Admin Index</a>
</body>
</html>
