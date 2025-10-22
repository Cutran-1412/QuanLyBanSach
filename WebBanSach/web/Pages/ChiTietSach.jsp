<%-- 
    Document   : ChiTietSach
    Created on : 21 thg 10, 2025, 19:47:18
    Author     : THIS PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Models.Sach" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Sach s = (Sach) request.getAttribute("sach");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sách - <%= (s != null ? s.getTenSach() : "Không tìm thấy") %></title>
    <link href="TrangChuStyle.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fafafa;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            display: flex;
            gap: 40px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .book-image img {
            width: 250px;
            height: 350px;
            object-fit: cover;
            border-radius: 8px;
        }
        .book-info {
            flex: 1;
        }
        .book-info h1 {
            margin-top: 0;
            color: #222;
        }
        .book-info p {
            line-height: 1.6;
            font-size: 16px;
        }
        .price {
            color: #d40000;
            font-size: 22px;
            font-weight: bold;
        }
        .back-btn {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .back-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <% if (s != null) { %>
        <div class="container">
            <div class="book-image">
                <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">
            </div>
            <div class="book-info">
                <h1><%= s.getTenSach() %></h1>
                <p><strong>Tác giả:</strong> <%= s.getTacGia() %></p>
                <p><strong>Nhà xuất bản:</strong> <%= s.getNhaXuatBan() %></p>
                <p><strong>Năm xuất bản:</strong> <%= s.getNamXuatBan() %></p>
                <p><strong>Thể loại:</strong> <%= s.getMaTheLoai() %></p>
                <p class="price"><%= String.format("%,.0f", s.getGia()) %> VNĐ</p>
                <p><strong>Mô tả:</strong></p>
                <p><%= s.getMoTa() %></p>
                <form action="<%= request.getContextPath() %>/GioHang" method="post">
                <input type="hidden" name="maSach" value="<%= s.getMaSach() %>">
                <button type="submit" class="btn">🛒 Thêm vào giỏ hàng</button>
            </form>


                <a href="<%= request.getContextPath() %>/Home" class="back-btn">← Quay lại trang chủ</a>
            </div>
        </div>
    <% } else { %>
        <div style="text-align:center; margin-top:100px;">
            <h2>Không tìm thấy thông tin sách.</h2>
            <a href="<%= request.getContextPath() %>/Home" class="back-btn">Quay lại</a>
        </div>
    <% } %>
</body>
</html>
