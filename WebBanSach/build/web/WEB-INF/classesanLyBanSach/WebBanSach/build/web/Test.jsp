<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, Models.Sach" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sách</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .book-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .book-card {
            background: white;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }

        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .book-card img {
            width: 120px;
            height: 160px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .book-title {
            font-weight: bold;
            color: #007bff;
        }

        .book-author {
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>

<h1>📚 Danh Sách Sách</h1>

<div class="book-container">
<%
    List<Sach> list = (List<Sach>) request.getAttribute("Sach");
    if (list != null && !list.isEmpty()) {
        for (Sach s : list) {
%>
            <div class="book-card">
                <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">
                <div class="book-title"><%= s.getTenSach() %></div>
                <div class="book-author">Tác giả: <%= s.getTacGia() %></div>
                <div class="book-price">Giá: <%= s.getGia() %> VNĐ</div>
            </div>
<%
        }
    } else {
%>
        <p>Không có sách nào trong cơ sở dữ liệu.</p>
<%
    }
%>
</div>

</body>
</html>
