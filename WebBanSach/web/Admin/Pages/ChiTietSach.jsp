<%-- 
    Document   : ChiTietSach
    Created on : Oct 16, 2025, 11:05:10 PM
    Author     : Windows
--%>

<%@page import="Models.Sach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                margin: 30px;
                background-color: #fff;
            }

            .book-detail {
                display: flex;
                align-items: flex-start;
                gap: 40px;
            }

            .book-detail img {
                width: 320px;              /* tăng kích thước ảnh */
                height: 460px;             /* tăng chiều cao */
                object-fit: cover;
                border-radius: 12px;
                box-shadow: 0 6px 15px rgba(0,0,0,0.25);
            }

            .book-info {
                flex: 1;
                background: #f9f9f9;
                padding: 25px 35px;
                border-radius: 14px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .book-info h2 {
                margin-top: 0;
                color: #222;
                font-size: 28px;          /* chữ to hơn */
                font-weight: 700;
                margin-bottom: 20px;
                line-height: 1.3;
            }

            .book-info p {
                font-size: 17px;
                margin: 10px 0;
                line-height: 1.6;
            }

            .label {
                font-weight: 600;
                color: #555;
                width: 150px;
                display: inline-block;
            }

            .btn-close {
                display: inline-block;
                margin-top: 25px;
                padding: 10px 22px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
            }

            .btn-close:hover {
                background: #0056b3;
            }
        </style>
    </head>
    <body>
        <%
            Sach s = (Sach) request.getAttribute("sach");
        %>
        <h1><%=s.getMaSach() %></h1>
        <br><br>
        <div class="book-detail">
            <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">

            <div class="book-info">
                <h2><%= s.getTenSach() %></h2>
                <p><span class="label">Tác giả:</span> <%= s.getTacGia() %></p>
                <p><span class="label">Nhà xuất bản:</span> <%= s.getNhaXuatBan() %></p>
                <p><span class="label">Năm xuất bản:</span> <%= s.getNamXuatBan() %></p>
                <p><span class="label">Giá:</span> <%= String.format("%,.0f", s.getGia()) %> VNĐ</p>
                <p><span class="label">Số lượng:</span> <%= s.getSoLuong() %></p>
                <p><span class="label">Thể loại:</span> <%= s.getMaTheLoai() %></p>
                <p><span class="label">Mô tả:</span></p>
                <p><%= s.getMoTa() %></p>

                <button class="btn-close" onclick="window.parent.closePopup()">Đóng</button>
            </div>
        </div>
    </body>
</html>
