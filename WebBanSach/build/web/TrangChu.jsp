
<%@page import="Models.TheLoai"%>
<%@page import="Models.NguoiDung"%>
<%@page import="Models.Sach"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Includes/Message.jsp" %>
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
        <header class="head_bar">
            <div class="left_info">
                <a>0999999999</a>
                <a>uneti@gmail.com</a>
                <a>218 Lĩnh Nam, Hà Nội</a>
            </div>
            <div class="right_action">
                <%
                    HttpSession sesion  = request.getSession();
                    NguoiDung nd = (NguoiDung) sesion.getAttribute("nd");%>
                    <div class="user-buttons">
                        <% if (nd == null) { %>
                            <button class="btn_login" onclick="openPopup('Pages/DangNhap.jsp')">ĐĂNG NHẬP</button>
                            <button class="btn_register" onclick="openPopup('Pages/DangKy.jsp')">ĐĂNG KÝ</button>
                        <% } else { %>
                            <button class="user_info" onclick="loadPage('NguoiDung?MaNguoiDung=<%= nd.getMaNguoiDung() %>')">
                                <i class="fa fa-user"></i> Xin chào, <b><%= nd.getHoTen() %></b>
                            </button>

                            <button class="cart_icon" onclick="loadPage('GioHang?MaNguoiDung=<%= nd.getMaNguoiDung() %>')">
                                <i class="fa fa-shopping-cart"></i> Giỏ hàng
                            </button>

                            <button class="order_icon" onclick="loadPage('DonHang?MaNguoiDung=<%= nd.getMaNguoiDung() %>')">
                                <i class="fa fa-box"></i> Đơn hàng
                            </button>

                            <button class="logout_btn" onclick="window.location.href='DangNhap'">
                                <i class="fa fa-sign-out"></i> Đăng xuất
                            </button>
                        <% } %>
                    </div>
            </div>
        </header>
        
        <nav class="main_nav">
            <div class="left_info">
                <button class="menu_btn" onclick="window.location.href='Home'">
                    <i class="fa fa-bars"></i> WebSach.com
                </button>
            </div>
            <div class="search_nav" style="text-align: center;">
                <form action="TimKiem" method="post" class="search_form" autocomplete="off">
                  <div class="input_row">
                    <div class="input_group">
                      <input type="text" name="TenSanPham" placeholder=" " autocomplete="off" />
                      <label>Tìm kiếm sản phẩm</label>
                    </div>
                    <button type="submit" class="search_btn">Tìm kiếm</button>
                  </div>
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
                    <% 
                    List<Sach> listSach = (List<Sach>) request.getAttribute("SachDB");
                    
                    String pageParam = request.getParameter("page");
                    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
                    
                    int itemsPerPage = 10;
                    
                    if (listSach != null && !listSach.isEmpty()) {
                        int totalItems = listSach.size();
                        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
                        
                        int startIndex = (currentPage - 1) * itemsPerPage;
                        int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
                        
                        for (int i = startIndex; i < endIndex; i++) {
                            Sach s = listSach.get(i);
                            %>
                           <div class="book-card" onclick="loadPage('ChiTietSach?MaSach=<%= s.getMaSach() %>')">
                            <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">
                            <div class="book-title"><%= s.getTenSach() %></div>
                            <div class="book-price"><%= String.format("%,.0f", s.getGia()) %> VNĐ</div>
                        </div>
                    <% 
                        }
                    %>
                </div>
               
                <div class="pagination">
                    <% if (currentPage > 1) { %>
                        <a href="?page=<%= currentPage - 1 %>" class="page-btn">« Trang trước</a>
                    <% } else { %>
                        <span class="page-btn disabled">« Trang trước</span>
                    <% } %>
                    
                    <% for (int i = 1; i <= totalPages; i++) { %>
                        <% if (i == currentPage) { %>
                            <span class="page-number active"><%= i %></span>
                        <% } else { %>
                            <a href="?page=<%= i %>" class="page-number"><%= i %></a>
                        <% } %>
                    <% } %>
                    
                    <% if (currentPage < totalPages) { %>
                        <a href="?page=<%= currentPage + 1 %>" class="page-btn">Trang sau »</a>
                    <% } else { %>
                        <span class="page-btn disabled">Trang sau »</span>
                    <% } %>
                </div>
                    <% 
                    } else { 
                    %>
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
