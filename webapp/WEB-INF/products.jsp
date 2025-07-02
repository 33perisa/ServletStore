<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Products</title>
</head>
<body>
<h2>Products</h2>

<!-- Forma za dodavanje novog proizvoda -->
<form action="product" method="post">
    <input type="hidden" name="action" value="create">
    Name: <input type="text" name="name"><br>
    Price: <input type="text" name="price"><br>
    <input type="submit" value="Add Product">
</form>

<!-- Lista proizvoda -->
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>
                <!-- Forma za brisanje proizvoda -->
                <form action="product" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${product.id}">
                    <input type="submit" value="Delete">
                </form>

                <!-- Forma za ažuriranje proizvoda -->
                <form action="product" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${product.id}">
                    Name: <input type="text" name="name" value="${product.name}">
                    Price: <input type="text" name="price" value="${product.price}">
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
