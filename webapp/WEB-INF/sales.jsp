<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Sales</title>
</head>
<body>
<h2>Sales</h2>

<!-- Forma za dodavanje nove prodaje -->
<form action="sale" method="post">
    <input type="hidden" name="action" value="create">
    Product ID: <input type="text" name="product_id"><br>
    Buyer ID: <input type="text" name="buyer_id"><br>
    Quantity: <input type="text" name="quantity"><br>
    <input type="submit" value="Add Sale">
</form>

<!-- Lista prodaja -->
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Product Name</th>
        <th>Buyer Name</th>
        <th>Quantity</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sale" items="${sales}">
        <tr>
            <td>${sale.id}</td>
            <td>${sale.productName}</td>
            <td>${sale.buyerName}</td>
            <td>${sale.quantity}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
