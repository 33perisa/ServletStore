<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Buyers</title>
</head>
<body>
<h2>Buyers</h2>

<!-- Forma za dodavanje novog kupca -->
<form action="buyer" method="post">
    <input type="hidden" name="action" value="create">
    Name: <input type="text" name="name"><br>
    Email: <input type="text" name="email"><br>
    <input type="submit" value="Add Buyer">
</form>

<!-- Lista kupaca -->
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="buyer" items="${buyers}">
        <tr>
            <td>${buyer.id}</td>
            <td>${buyer.name}</td>
            <td>${buyer.email}</td>
            <td>
                <!-- Forma za brisanje kupca -->
                <form action="buyer" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${buyer.id}">
                    <input type="submit" value="Delete">
                </form>

                <!-- Forma za ažuriranje kupca -->
                <form action="buyer" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${buyer.id}">
                    Name: <input type="text" name="name" value="${buyer.name}">
                    Email: <input type="text" name="email" value="${buyer.email}">
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
