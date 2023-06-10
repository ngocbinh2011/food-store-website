<%@ page import="com.store.model.products.Product" %>
<%@ page import="com.store.model.products.ImageProduct" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.model.customers.User" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/6/2021
  Time: 8:31 AM
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/view-product-style.css">
    <title>Cart</title>
    <!-- icon -->
    <script src="https://kit.fontawesome.com/44ec9fb3c1.js" crossorigin="anonymous"></script>
    <!-- boostrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
</head>
<body>
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
        <a href="/food/home" class="col-3">
            <div class="logo">
                <i class="fas fa-shopping-cart"></i>
                <div class="name">
                    <p class="shop-name"><span class="names">My</span><span style="color: black;"> SHOP</span></p>
                    <p class="details"><span style="color: red;"></span> FAKE <span style="color: violet;">SHOPPING</span></p>
                </div>
            </div>
        </a>
        <div class="nav-bar col-8">
            <ul class="row">
                <li><a href="/food/home">TRANG CHỦ</a></li>
                <li><a href="#">BỘ SƯU TẬP <i class="fas fa-sort-down conllection"></i></a></li>
                <li><a href="#">SẢN PHẨM <i class="fas fa-sort-down item"></i></a></li>
                <li><a href="#">TIN TỨC</a></li>
                <LI><a href="#">GIỚI THIỆU</a></LI>
            </ul>
            <div class="search">
                <form action="">
                    <select name="" id="">
                        <option value="all">TẤT CẢ DANH MỤC</option>
                        <option value="a">A</option>
                        <option value="b">B</option>
                        <option value="c">C</option>
                    </select>
                    <input type="text" placeholder="Tìm Kiếm ...">
                </form>
                <button type="submit" class="button-search"><i class="fas fa-search"></i> TÌM KIẾM</button>
            </div>
        </div class="col-auto">
        <a href="cart">
            <p class="cart"><i class="cart-icon fas fa-cart-plus"></i> GIỎ HÀNG</p>
        </a>
    </nav>
</header>
<div class="mini-nav">
    <p><a href="home"><i class="fas fa-home"></i>Trang chủ</a> /</p>
    <p> <a href="home">Tất cả sản phẩm </a> /</p>
    <p> <a href="view-product?pid=${product.getId()}">${product.getName()}</a></p>
</div>
<main class="white-div">
    <div class="about-item row">

        <c:if test="${product.getId() == 0}">
            <c:out value="NOT FOUND"></c:out>
        </c:if>
        <c:if test="${product.getId() != 0}">
            <div class="img-item col-4">
                <img src="${product.getImageLinkAvatar().getImageLink()}" alt="${product.getName()}" height="450" width="400" >
            </div>
            <div class="col-7 item-detail">
                <h5>${product.getName()}</h5>
                <p>${product.getDescribe()}</p>
                <span>Nhãn hiệu:</span>
                <p><span>Tình trạng:</span> Còn Lại ${product.getAmount()} sản phẩm</p>
                <span class="item-price">${product.getPrice()}<i class="fas fa-dollar-sign"></i></span>
                <form action="cart?pid=${product.getId()}" method="post">
                    <label for="amount">Số lượng: </label>
                    <input id="amount" name="pAmount" type="number" min="0" max="10000" value="1">
                    <br>
                    <button class="btn" title="">THÊM VÀO GIỎ HÀNG</button>
                </form>
                <div class="print">
                    <p><a href="#"><i class="fas fa-print"></i> In</a></p>
                </div>
                <div class="share-item">
                    <p class="btn"><a href="https://twitter.com/"><i class="fab fa-twitter"></i>TWEET</a></p>
                    <p class="btn"><a href="https://www.facebook.com/"><i class="fab fa-facebook"></i>FACEBOOK</a></p>
                </div>
            </div>
        </c:if>

    </div>
</main>
<div class="info white-div">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="detail-tab" data-toggle="tab" href="#detail" role="tab" aria-controls="detail" aria-selected="true">THÔNG TIN CHI TIẾT</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="comment-tab" data-toggle="tab" href="#comment" role="tab" aria-controls="comment" aria-selected="false">NHẬN XÉT</a>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
            <p>${product.getDescribe()}</p>
            <%
                Product product = (Product) request.getAttribute("product");
                String sourceImage = product.getImageLinkAvatar().getImageLink();
                List<ImageProduct> list = product.getListImage();
                if(list.size() > 1){
                    sourceImage = list.get(1).getImageLink();
                }
            %>
            <img src="<%=sourceImage%>" alt="${product.getName()}" style="padding-left: 25%;;" height="700" width="882">
        </div>
        <div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="comment-tab">
            <form action="" id="">Tên: <input type="text" name="">.
                <br>
                <br>
                <textarea rows="4" cols="50" name="comment" form="">Nhận xét ở đây</textarea>
                <br>
                <input type="submit">
            </form>
            <br>
            <h1>HIỆN TẠI CHƯA CÓ NHẬN XÉT ĐÂU, VIẾT ĐI MỚI CÓ CÁI ĐỌC</h1>
        </div>
    </div>
</div>
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
            <span class="row">MySHOP</span>
            <p class="row">Nhà hàng  Food thiết kế theo phong cách vừa truyền thống vừa mang nét hiện đại. Kiến trúc sang trọng kết hợp với khung cảnh thiên nhiên tạo cảm giác đặc biệt hơn cho du khách khi thưởng thức ẩm thực tại đây.</p>
        </div>
        <div class="col-3 contact">
            <span class="row">LIÊN HỆ</span>
            <br>
            <p class="row"><a href="#"><i class="fas fa-phone row"></i> Di động:0900100có</a></p>
            <p class="row"><a href="#"><i class="far fa-envelope"></i> Email:demo@gmail.com</a></p>
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
            <span class="row">My FOOD</span>
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
