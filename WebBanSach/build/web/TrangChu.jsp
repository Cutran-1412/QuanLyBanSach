<%@page import="Models.NguoiDung"%>
<%@page import="Models.Sach"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Bán Sách</title>
        <link href="TrangChuStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <style>
            .popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.6);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999; /* nổi trên tất cả */
            }

            /* KHUNG POPUP CHÍNH */
            .popup-box {
                background: #fff;
                padding: 25px 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0,0,0,0.3);
                width: 420px;
                max-width: 90%;
                position: relative;
                animation: popupFadeIn 0.3s ease;
            }

            /* NÚT ĐÓNG (X) */
            .close-btn {
                position: absolute;
                top: 10px;
                right: 15px;
                font-size: 24px;
                color: #666;
                cursor: pointer;
                transition: 0.2s;
            }
            .close-btn:hover {
                color: #e74c3c;
                transform: scale(1.2);
            }

            /* HIỆU ỨNG MỞ MƯỢT */
            @keyframes popupFadeIn {
                from { opacity: 0; transform: scale(0.9); }
                to { opacity: 1; transform: scale(1); }
            }
            </style>

            <script>
            function openPopup(url) {
                $.ajax({
                    url: url,
                    method: "GET",
                    success: function (response) {
                        $("#popup-content").html(response);
                        $("#popup").fadeIn(200);
                    },
                    error: function () {
                        alert("Không thể tải trang!");
                    }
                });
            }

            function closePopup() {
                $("#popup").fadeOut(200);
            }
        </script>
    </head>
    <body>
        <div id="popupMessage"></div>
        <script>
            // Hàm hiển thị popup 3 giây
            function showPopup(message, type = "success") {
                const popup = document.getElementById("popupMessage");
                popup.innerText = message;
                popup.style.backgroundColor = type === "error" ? "#e74c3c" : "#2ecc71";
                popup.classList.add("show");

                setTimeout(() => {
                    popup.classList.remove("show");
                }, 3000);
            }
        </script>

        <% 
            // Lấy thông báo từ session
            String tb = (String) session.getAttribute("ThongBao");
            if (tb != null) { 
        %>
            <script>
                showPopup("<%= tb %>");
            </script>
        <%
            session.removeAttribute("ThongBao");
            }
        %>
        <header class="head_bar">
            <div class="left_info">
                <a>0999999999</a>
                <a>uneti@gmail.com</a>
                <a>218 Lĩnh Nam, Hà Nội</a>
            </div>
            <div class="right_action">
                <%
                    NguoiDung nd = (NguoiDung) request.getAttribute("NguoiDung");
                    if (nd == null) {%>
                        <a href="#" class="btn_login" onclick="openPopup('Pages/DangNhap.jsp')">ĐĂNG NHẬP</a>
                        <a href="#" class="btn_register" onclick="openPopup('Pages/DangKy.jsp')">ĐĂNG KÝ</a>
                    <%} else {%>
                        <span class="user_info">
                            <i class="fa fa-user"></i> Xin chào, <b><%=nd.getHoTen() %></b>
                        </span>
                        <a href="#" class="cart_icon" onclick="loadPage('GioHang?MaNguoiDung=<%= nd.getMaNguoiDung() %>')">
                            <i class="fa fa-shopping-cart"></i>
                        </a>
                        <a href="DangNhap" class="logout_btn">
                            <i class="fa fa-sign-out"></i> Đăng xuất
                        </a>
                    <%}%>
            </div>
        </header>
        
        <nav class="main_nav">
            <a class="logo">websach.com</a>
            <div class="search_nav">
                <input type="text" placeholder="Tìm kiếm sản phầm">
                <button class="search_btn">Tìm kiếm</button>
            </div>
        </nav>
        
        <section class="main_section">
            <div class="category_div">
                <ul class="category_bar">
                    <a>Danh mục</a>
                    <li>Sách Kinh Tế</li>
                    <li>Sách Văn Học Nước Ngoài</li>
                    <li>Sách Văn Học Trong Nước</li>
                    <li>Sách Thiếu Nhi</li>
                    <li>Sách Tin Học</li>
                    <li>Sách Giáo Khoa</li>
                    <li>Sách Phát Hành 2024</li>
                    <li>Sách Phát Hành 2025</li>
                    <li>Sách Triết Học</li>
                </ul>
            </div>
            <div id="content" class="content_div">
                <div class="book_container">
                    <% List<Sach> list = (List<Sach>) request.getAttribute("SachDB");
                       if (list != null && !list.isEmpty()) {
                           for (Sach s : list) { %>
                           <div class="book-card" onclick="loadPage('ChiTietSach?MaSach=<%= s.getMaSach() %>')">
                            <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">
                            <div class="book-title"><%= s.getTenSach() %></div>
                            <div class="book-price"><%= String.format("%,.0f", s.getGia()) %> VNĐ</div>
                        </div>
                    <% } } else { %>
                        <p>Không có sách nào để hiển thị.</p>
                    <% } %>
                </div>
            </div>
        </section>
        <div id="popup" class="popup-overlay" style="display:none;">
            <span class="close-btn" onclick="closePopup()">×</span>
            <div id="popup-content"></div>
        </div>
    </div>
        <script>
            function loadPage(url) {
                $.ajax({    
                    url: url,
                    method: "GET",
                    success: function (response) {
                        $("#content").html(response);
                    },
                    error: function () {
                        $("#content").html("<p style='color:red;'>Lỗi khi tải dữ liệu!</p>");
                    }
                });
            }
            function openPopup(url) {
                $.ajax({
                    url: url,
                    method: "GET",
                    success: function (response) {
                        $("#popup-content").html(response);
                        $("#popup").show();
                    },
                    error: function () {
                        alert("Không thể tải trang!");
                    }
                });
            }
            function closePopup() {
                $("#popup").hide();
            }
        </script>
    </body>  
</html>
