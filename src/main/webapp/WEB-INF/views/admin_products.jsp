<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Management</title>
</head>
<body>
    <h1>Product Management</h1>

    <table>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.stock}</td>
                <td>
                    <a href="<c:url value='/admin/edit_product?id=${product.id}'/>">Edit</a> | 
                    <a href="<c:url value='/admin/delete_product?id=${product.id}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="<c:url value='/admin/add_product'/>">Add Product</a>

    <a href="<c:url value='/adminIndex.jsp'/>">Back to Admin Index</a>
</body>
</html>
