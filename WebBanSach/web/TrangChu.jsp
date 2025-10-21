<%@page import="Models.TheLoai"%>
<%@page import="Models.Sach"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Bán Sách</title>
        <link href="TrangChuStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header class="head_bar">
            <div class="left_info">
                <a>0999999999</a>
                <a>uneti@gmail.com</a>
                <a>218 Lĩnh Nam, Hà Nội</a>
            </div>
            <div class="right_action">
                <a href="" class="btn_login">ĐĂNG NHẬP</a>
                <a href="" class="btn_register">ĐĂNG KÝ</a>
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
                    <%
                    List<TheLoai> listTheLoai = (List<TheLoai>) request.getAttribute("TheLoaiDB");
                    for(TheLoai t : listTheLoai) {
                    %>
                    <li><%=t.getTenTheLoai()%></li>
                    <%}%>
                </ul>
            </div>
            <div class="content_div">
                <h2 style="text-align: center">Danh sách sách</h2>
                <div class="book_container">
                    <% List<Sach> listSach = (List<Sach>) request.getAttribute("SachDB");
                       if (listSach != null && !listSach.isEmpty()) {
                           for (Sach s : listSach) { %>
                           <div class="book-card" onclick="window.location.href='ChiTietSach?MaSach=<%= s.getMaSach() %>'">
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
    </body>
</html>
