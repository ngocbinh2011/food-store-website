
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/8/2021
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>

</head>

<body>
<div style="text-align: center;">
    <h1>ĐẶT HÀNG THÀNH CÔNG</h1>
    <p>Email: ${customer.getEmail()}</p>
    <p>Họ Tên: ${customer.getName()}</p>
    <p>Số điện thoại: ${customer.getPhoneNumber()}</p>
    <p>địa chỉ: ${customer.getAddressString()}</p>
    <table style="padding-left: 40%;">
        <tr>
            <th>ten san pham</th>
            <th>gia</th>
            <th>so luong</th>
            <th>don gia</th>
        </tr>
        <c:forEach var="order" items="${listOrder}">
            <tr>
                <td>${order.getProduct().getName()}</td>
                <td>${order.getProduct().getPrice()}</td>
                <td>${order.getAmount()}</td>
                <td>${order.getProduct().getPrice() * order.getAmount()}</td>
            </tr>
        </c:forEach>
    </table>
    <p>Tổng Hóa Đơn: ${total}</p>
</div>

</body>

</html>