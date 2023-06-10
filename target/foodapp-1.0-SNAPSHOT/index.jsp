<%@ page import="com.store.utils.Constant" %>
<%@ page import="com.store.model.customers.User" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/3/2021
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">

    <title>Dealer</title>
    <!-- icon -->
    <script src="https://kit.fontawesome.com/44ec9fb3c1.js" crossorigin="anonymous"></script>
    <!-- boostrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
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
                    <p class="shop-name"><span class="names">My</span><span style="color: black;"> SHOP</span></p>
                    <p class="details"><span style="color: red;"></span> FAKE <span style="color: violet;">SHOPPING</span></p>
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
                <form action="search">
                    <select name="" id="">
                        <option value="all">TẤT CẢ DANH MỤC</option>
                        <option value="a">A</option>
                        <option value="b">B</option>
                        <option value="c">C</option>
                    </select>
                    <input type="text" name="query" placeholder="Tìm Kiếm ...">
                    <button type="submit" class="button-search" style="height: 32px; padding-right: 2px"><i class="fas fa-search"></i> TÌM KIẾM</button>
                </form>
            </div>
        </div class="col-auto">
        <a href="cart">
            <p class="cart" style="font-weight: 500"><i class="cart-icon fas fa-cart-plus"></i> GIỎ HÀNG</p>
        </a>
    </nav>
</header>
<div class="part-2nd row">
    <div class="left-2nd col-2 navbar__row">
        <ul>
            <div class="title-item-div"><li class="navbar__tittle-head"><i class="fas fa-bars"></i> DANH MỤC</li></div>
            <div style="height: 20px;"></div>
            <li><a href="search?query=do+uong" class="item-color"><i class="fas fa-glass-martini-alt"></i> ĐỒ UỐNG</a></li>
            <li><a href="search?query=do+an+nhanh" class="item-color"><i class="fas fa-hamburger"></i> ĐỒ ĂN NHANH</a></li>
            <li><a href="search?query=com" class="item-color"><i class="fas fa-concierge-bell"></i> CƠM</a></li>
            <li><a href="search?query=bun+my" class="item-color"><i class="fas fa-cookie-bite"></i> BÚN & MỲ</a></li>
            <li><a href="search?query=hoa+qua" class="item-color"><i class="fas fa-lemon"></i> HOA QUẢ</a></li>
            <li><a href="search?query=lau" class="item-color"><i class="fas fa-mug-hot"></i> LẨU</a></li>
            <li><a href="search?query=do+nuong" class="item-color"><i class="fas fa-bacon"></i> ĐỒ NƯỚNG</a></li>
            <li><a href="search?query=hai+san" class="item-color"><i class="fas fa-fish"></i> HẢI SẢN</a></li>
        </ul>
    </div>
    <div class="mid-2nd col-6">
        <p>NGON-BỔ-RẺ-CHẤT LƯỢNG <span style="font-size: 7px;">đó là những gì chúng tôi không có</span></p>
    </div>
    <div class="right-2nd col-4">
        <p>HÃY ĐẾN VỚI CHÚNG TÔI</p>
        <P>QUÝ KHÁCH CHẮC CHẮN SẼ KO THẤT VỌNG</P>
        <p style="font-size: 6px;">còn thất vọng thì mặc kệ quý khách</p>
    </div>
</div>
<div class="best-seller white-div">
    <p class="title">BÁN CHẠY NHẤT</p>
    <div class="row">
        <c:forEach var="product" items="${listProductBestSeller}">
            <div class="col-2 list-items">
                <a href="view-product?pid=${product.getId()}">
                    <img style="margin-top: 15px; border: 1px solid black;" src="${product.getImageLinkAvatar().getImageLink()}" alt="${product.getName()}" width="164px" height="84px">
                </a>
                <p><a href="view-product?pid=${product.getId()}">${product.getName()}<span> - ${product.getPrice()}<i class="fas fa-dollar-sign"></i></span></a></p>
            </div>
        </c:forEach>
    </div>

</div>
<div class="transport white-div background-color-transport">
    <div class="row">
        <div class="col">
            <i class="fas fa-truck icon-transport"></i>
            <div class="details">
                <p>Miễn Phí Vận Chuyển</p>
                <span>Trong vòng 3km</span>
            </div>
        </div>
        <div class="col">
            <i class="far fa-clock icon-transport"></i>
            <div class="details">
                <p>Hỗ Trợ Khách Hàng</p>
                <span>24/24 Tất cả các ngày</span>
            </div>
        </div>
        <div class="col">
            <i class="fas fa-mouse icon-transport"></i>
            <div class="details">
                <p>Mua Hàng Tiện Lợi</p>
                <span>Nhấn và chọn</span>
            </div>
        </div>
        <div class="col">
            <i class="fas fa-money-bill-alt icon-transport"></i>
            <div class="details">
                <p>Giá Cả Hấp Dẫn</p>
                <span>Giảm đến 40%</span>
            </div>
        </div>
    </div>
</div>
<div class="menu">
    <div class="row title">
        <p class="menu-title-left col-7 navbar__title-category">ĐỒ ĂN NÓNG</p>
        <div class="menu-title-right">
        </div>
    </div>
    <div class="contain row">
        <div class="col-9 navbar__contain">
            <c:forEach var="product" items="${listProduct}" varStatus="status">
                <c:if test="${status.index % amountProductInRow == 0}">
                    <div class="row">
                </c:if>
                        <div class="list-items col-4">
                            <a href="view-product?pid=${product.getId()}">
                                <img style="margin-top: 20px; border: 1px solid black;" src="${product.getImageLinkAvatar().getImageLink()}" alt="${product.getName()}" width="200px" height="120px">
                            </a>
                            <p><a href="view-product?pid=${product.getId()}">${product.getName()}<span> - ${product.getPrice()}<i class="fas fa-dollar-sign"></i></span></a></p>
                            <p class="fas"><span></span></p>

                        </div>
                <c:if test="${status.index % amountProductInRow == amountProductInRow - 1
                 || status.index == listProduct.size() - 1}">
                    </div>
                </c:if>
            </c:forEach>

        </div>
        <div class="col-3">
            <img src="https://tronhouse.com/assets/data/editor/source/chup-anh-mon-an-va-nhung-loi-ich-khong-he-nho/chup-hinh-mon-an-1.jpg" alt="soup" width="285" height="560">
        </div>
    </div>
    <div class="page-number col-5">
        <span style="font-size: 20px;">Trang </span>
        <span><a href="home?page=${currentPage - 1}"><i class="fas fa-arrow-left"></i></a></span>
        <c:if test="${currentPage >= 3}">
            <span><a href="home?page=1">1</a></span>
            <span><a href="home?page=2">2</a></span>
            <span> ... </span>
        </c:if>
        <span><a href="home?page=${currentPage}" style="color: red">${currentPage}</a></span>
        <span><a href="home?page=${currentPage + 1}">${currentPage + 1}</a></span>
        <span><a href="home?page=${currentPage + 2}">${currentPage + 2}</a></span>
        <span><a href="home?page=${currentPage + 3}">${currentPage + 3}</a></span>
        <c:if test="${currentPage + 3 < lastPage - 1}">
            <span> ... </span>
            <span><a href="home?page=${lastPage - 1}">${lastPage - 1}</a></span>
            <span><a href="home?page=${lastPage}">${lastPage}</a></span>
        </c:if>
        <span><a href="home?page=${currentPage + 1}"><i class="fas fa-arrow-right"></i></a></span>
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
            <p class="row">Nhà hàng Food thiết kế theo phong cách vừa truyền thống vừa mang nét hiện đại. Kiến trúc sang trọng kết hợp với khung cảnh thiên nhiên tạo cảm giác đặc biệt hơn cho du khách khi thưởng thức ẩm thực tại đây.</p>
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
            <p class="row"><a href="#">TRANG CHỦ</a></p>
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