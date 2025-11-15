
<%@page import="Models.TheLoai"%>
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
    </head>
    <body>
        
        <%
            String msg = (String) session.getAttribute("message");
            String msgType = (String) session.getAttribute("msgType");
            if (msg != null) {
        %>
            <div id="toast" class="<%= msgType %>"><%= msg %></div>

            <style>
                #toast {
                    position: fixed;
                    top: 5%;    
                    left: 40%;
                    transform: translate(-50%, -50%);
                    padding: 20px 40px;
                    border-radius: 12px;
                    font-size: 24px;
                    color: white;
                    font-weight: bold;
                    font-family: sans-serif;
                    box-shadow: 0 6px 20px rgba(0,0,0,.3);
                    opacity: 0;
                    animation: fadeSlide 0.5s forwards, disappear 3s forwards 2.5s;
                    z-index: 9999;
                    text-align: center;

                }
                #toast.success { background: #28a745; }
                #toast.error   { background: #dc3545; }
                #toast.warning { background: #ffc107; color: black; }

                @keyframes fadeSlide {
                    to { opacity: 1; transform: translateY(0); }
                }
                @keyframes disappear {
                    to { opacity: 0; transform: translateY(-20px); }
                }
            </style>

        <%
                session.removeAttribute("message");
                session.removeAttribute("msgType");
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
                    HttpSession sesion  = request.getSession();
                    NguoiDung nd = (NguoiDung) sesion.getAttribute("nd");
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
            <a onclick="window.location.href='Home'" class="logo">Home</a>
            <div class="search_nav" style="text-align: center;">
                <form action="TimKiem" method="post" style="display: inline-block;">
                    <input type="text" name="TenSanPham" placeholder="Tìm kiếm sản phẩm">
                    <button type="submit" class="search_btn">Tìm kiếm</button>
                </form>
            </div>
        </nav>
        
        <section class="main_section">
            <div class="category_div">
                <ul class="category_bar">
                    <%
                        List<TheLoai> ltl = (List<TheLoai>)request.getAttribute("TheLoai");
                    %>
                    <a>Danh mục</a>
                    <%
                        if(ltl!=null){
                            for(TheLoai item : ltl){%>
                            <li onclick="window.location.href='TimKiem?MaTheLoai=<%= item.getMaTheLoai() %>'"><%=item.getTenTheLoai() %></li>    
                        <%}
                        }else{%>
                            <li>Không có thể loại</li>
                        <%}
                    %> 
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
    <script src="Assets/JS/TrangChujs.js" type="text/javascript"></script>
    </body>  
</html>
