<%@page import="Models.TheLoai"%>
<%@page import="Models.Sach"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Bán Sách</title>
        <link href="TrangChuStyle.css" rel="stylesheet"/>
        <style>
        .pagination {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 20px;
        }

        .pagination a,
        .pagination span {
            padding: 10px 16px;
            background: white;
            border: 1px solid #ccc;
            border-radius: 8px;
            color: #333;
            text-decoration: none;
            font-weight: 600;
        }

        .pagination a:hover:not(.disabled),
        .pagination span:hover:not(.active) {
            background: green;
            color: white;
        }

        .pagination .active {
            background: #28a745;
            color: white;
            border-color: #28a745;
        }

        .pagination .disabled {
            opacity: .5;
            cursor: not-allowed;
        }
        </style>
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
                           <div class="book-card" onclick="window.location.href='ChiTietSach?MaSach=<%= s.getMaSach() %>'">
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
            
        </section>
    </body>
</html>