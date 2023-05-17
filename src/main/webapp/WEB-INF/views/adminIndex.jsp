<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Index</title>
</head>
<body>
    <h1>Welcome, Admin!</h1>

    <h2>Manage your site</h2>

    <select id="admin_options" onchange="location = this.value;">
        <option value="">--Select Option--</option>
        <option value="<c:url value='/admin_users.jsp'/>">User Management</option>
        <option value="<c:url value='/admin_products.jsp'/>">Product Management</option>
        <option value="<c:url value='/admin_orders.jsp'/>">Order Management</option>
    </select>

    <script>
        document.getElementById('admin_options').value = "";
    </script>

</body>
</html>
