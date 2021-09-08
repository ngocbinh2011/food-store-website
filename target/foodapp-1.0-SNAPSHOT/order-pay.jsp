<%@ page import="com.store.model.customers.User" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/8/2021
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/pay-page-style.css">
    <title>Dealer</title>
    <!-- icon -->
    <script src="https://kit.fontawesome.com/44ec9fb3c1.js" crossorigin="anonymous"></script>
    <!-- boostrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">

    <style>
        /* body{
          background-color: #f5f5f5;
        } */

    </style>
</head>
<body class="body-app">
<header class="white-div">
    <div class="login">
        <%
            boolean isLogged = false;
            String sessionID = session.getId();
            Object object = session.getAttribute(sessionID);
            if(object instanceof User){
                User user = (User) object;
                if(user.getUsername() != null){
                    isLogged = true;
                }
            }
        %>

        <c:if test="<%=!isLogged%>">
            <ul>
                <li class="login-user"><a href="login">ĐĂNG NHẬP</a></li>
                <li class="register-user"><a href="#">ĐĂNG KÝ</a></li>
                <li class="product"><a href="#">PRODUCT</a></li>
            </ul>
        </c:if>
        <c:if test="<%=isLogged%>">
            <div class="login-sucess">
                <p><a class="logout-navbar inline-login-success" href="logout" style="text-decoration: none;">Logout  <span class="profile-login-nav"><i class="fas fa-user-circle icon-profile-nav" style="font-size: 40px; color: red;"></i></span></a></p>
            </div>
        </c:if>
    </div>
    <nav class=" row">
        <a href="home" class="col-3">
            <div class="logo">
                <i class="fas fa-shopping-cart"></i>
                <div class="name">
                    <p class="shop-name"><span class="names">BÌNH</span><span style="color: black;"> SHOP</span></p>
                    <p class="details"><span style="color: red;">HÙNG</span> FAKE <span style="color: violet;">SHOPPING</span></p>
                </div>
            </div>
        </a>
        <div class="nav-bar col-8">
            <ul class="row">
                <li><a href="home">TRANG CHỦ</a></li>
                <li><a href="#">BỘ SƯU TẬP <i class="fas fa-sort-down conllection"></i></a></li>
                <li><a href="#">SẢN PHẨM <i class="fas fa-sort-down item"></i></a></li>
                <li><a href="#">TIN TỨC</a></li>
                <LI><a href="#">GIỚI THIỆU</a></LI>
            </ul>
            <div class="search">
                <form action="search" method="get">
                    <select name="" id="">
                        <option value="all">TẤT CẢ DANH MỤC</option>
                        <option value="a">A</option>
                        <option value="b">B</option>
                        <option value="c">C</option>
                    </select>
                    <input type="text" name="query" placeholder="Tìm Kiếm ...">
                    <button type="submit" class="button-search"><i class="fas fa-search"></i> TÌM KIẾM</button>
                </form>
            </div>
        </div class="col-auto">
        <a href="">
            <p class="cart"><i class="cart-icon fas fa-cart-plus"></i> GIỎ HÀNG</p>
        </a>
    </nav>
</header>

<main>
    <div class="main-content row white-div">
        <div class="info-user col-6">
            <div class="first-row-info">
                <p class="left-info">Thông tin nhận hàng</p>
                <p class="right-info"><a href="login"><i class="fa fa-user-circle-o fa-lg"></i> Đăng nhập</a></p>
            </div>
            <form action="order" method="post">
                <input type="email" name="orderEmail" placeholder="Email">
                <input type="text"  name="orderName" id="" placeholder="Họ và tên">
                <input type="number" name="orderPhone" placeholder="Số điện thoại">
                <input type="text" name="orderAddress" placeholder="Địa chỉ">
                <textarea id="" name="orderNote" rows="4" cols="78" placeholder="Ghi chú"></textarea>
            </form>
        </div>
        <div class="transport">
            <p style="font-weight: bold;">Vận chuyển</p>
            <div class="info-transport">
                <p> Vui lòng nhập thông tin giao hàng</p>
            </div>
            <p style="font-weight: bold;">Thanh Toán</p>
            <form action="order" method="post">
                <div class="payment">
                    <input type="radio" id="eleven" name="transport" value="10" checked="checked">
                    <div class="payment-details">
                        <p>Thanh toán khi giao hàng <i class="far fa-money-bill-alt"></i></p>
                        <span>(COD)</span>
                    </div>
                </div>
                <button type="submit" class="btn">Đặt Hàng</button>
            </form>
        </div>
    </div>
</main>

<footer>
    <div class="email row">
        <p>ĐĂNG KÍ ĐỂ NHẬN COUPON GIẢM GIÁ MỚI NHẤT</p>
        <form action="">
            <input type="text">
            <input type="submit" value="THEO DÕI">
        </form>
    </div>
    <div class="signature row">
        <div class="col-3 last-details">
            <i class="fas fa-ambulance row"></i>
            <span class="row">BINHSHOP</span>
            <p class="row">Nhà hàng BINH Food thiết kế theo phong cách vừa truyền thống vừa mang nét hiện đại. Kiến trúc sang trọng kết hợp với khung cảnh thiên nhiên tạo cảm giác đặc biệt hơn cho du khách khi thưởng thức ẩm thực tại đây.</p>
        </div>
        <div class="col-3 contact">
            <span class="row">LIÊN HỆ</span>
            <br>
            <p class="row"><a href="#"><i class="fas fa-phone row"></i> Di động:0900100có</a></p>
            <p class="row"><a href="#"><i class="far fa-envelope"></i> Email:pornhub@gmail.com</a></p>
            <p class="row"><a href="#"><i class="fas fa-map-marker-alt"></i> Vị Trí: 47 Phạm Văn Đồng, Hà Nội. ĐẾN LÀ ĐÓN</a></p>
        </div>
        <div class="col-3 information">
            <span class="row">THÔNG TIN</span>
            <p class="row"><a href="#">HƯỚNG DẪN MUA HÀNG</a></p>
            <p class="row"><a href="#">QUY ĐỊNH SỬ DỤNG</a></p>
            <p class="row"><a href="#">CHÍNH SÁCH VẬN CHUYỂN</a></p>
            <p class="row"><a href="#">ĐIỀU KHOẢNG DỊCH VỤ</a></p>
        </div>
        <div class="col-3 about-us">
            <span class="row">BINH FOOD</span>
            <p class="row"><a href="./index.html">TRANG CHỦ</a></p>
            <p class="row"><a href="#">TÌM KIẾM SẢN PHẨM</a></p>
            <p class="row"><a href="#">GIỚI THIỆU CỬA HÀNG</a></p>
            <p class="row"><a href="#">THÔNG TIN LIÊN HỆ</a></p>
        </div>
    </div>
</footer>



<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>