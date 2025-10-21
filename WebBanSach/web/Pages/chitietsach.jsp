<%-- 
    Document   : ChiTietSach
    Created on : 21 thg 10, 2025, 12:56:20
    Author     : THIS PC
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Models.Sach" %>
<%@ page import="DAO.SachDAO" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sách</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 12px 0;
            font-size: 22px;
        }
        .container {
            width: 85%;
            margin: 40px auto;
            display: flex;
            gap: 30px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .book-img img {
            width: 320px;
            height: 420px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #ddd;
        }
        .book-info {
            flex: 1;
        }
        .book-info h2 {
            margin-top: 0;
            color: #333;
            font-size: 26px;
        }
        .book-info p {
            font-size: 16px;
            line-height: 1.6;
            margin: 5px 0;
            color: #555;
        }
        .price {
            font-size: 22px;
            color: #d9534f;
            font-weight: bold;
            margin: 10px 0;
        }
        .actions {
            margin-top: 20px;
        }
        .actions input[type="number"] {
            width: 70px;
            padding: 6px;
            font-size: 16px;
            margin-right: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .btn {
            background: #28a745;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }
        .btn:hover {
            background: #218838;
        }
        .back-link {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>Chi tiết sản phẩm</header>

<%
    // Lấy đối tượng sách từ servlet gửi sang
    Sach s = (Sach) request.getAttribute("sach");
    if (s == null) {
%>
    <p style="text-align:center; color:red;">Không tìm thấy thông tin sách!</p>
<%
    } else {
%>

<div class="container">
    <div class="book-img">
        <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">
    </div>
    <div class="book-info">
        <h2><%= s.getTenSach() %></h2>
        <p><b>Tác giả:</b> <%= s.getTacGia() %></p>
        <p><b>Nhà xuất bản:</b> <%= s.getNhaXuatBan() %></p>
        <p><b>Năm xuất bản:</b> <%= s.getNamXuatBan() %></p>
        <p><b>Giá:</b> <%= s.getGia()  %> VNĐ</p>

        <!-- 
        <form action="GioHangServlet" method="post" class="actions">
            <input type="hidden" name="maSach" value="<%= s.getMaSach() %>">
            <input type="hidden" name="tenSach" value="<%= s.getTenSach() %>">
            <input type="hidden" name="gia" value="<%= s.getGia() %>">
            <label><b>Số lượng:</b></label>
            <input type="number" name="soLuong" value="1" min="1">
            <input type="hidden" name="action" value="add">
            <button type="submit" class="btn">Thêm vào giỏ hàng</button>
        </form> -->

        <a href="DanhSachSachServlet" class="back-link">← Quay lại danh sách sách</a>
    </div>
</div>
</body>
</html>
