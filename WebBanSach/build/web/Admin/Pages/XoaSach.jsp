<%-- 
    Document   : XoaSach
    Created on : Oct 21, 2025, 11:02:11 PM
    Author     : Osiris
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
                width: 300px;
                height: 440px;
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
                color: #d9534f;
                font-size: 26px;
                font-weight: 700;
                margin-bottom: 20px;
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

            .btn-group {
                margin-top: 25px;
                display: flex;
                gap: 20px;
            }

            .btn {
                flex: 1;
                padding: 12px 0;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: 0.3s;
            }

            .btn-delete {
                background: #e74c3c;
                color: white;
            }

            .btn-delete:hover {
                background: #c0392b;
            }

            .btn-cancel {
                background: #7f8c8d;
                color: white;
            }

            .btn-cancel:hover {
                background: #636e72;
            }
        </style>
    </head>
    <body>
        <%
            Sach s = (Sach) request.getAttribute("sach");
        %>

        <div class="book-detail">
            <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">

            <div class="book-info">
                <h2>Bạn có chắc muốn xóa sách này?</h2>

                <p><span class="label">Mã sách:</span> <%= s.getMaSach() %></p>
                <p><span class="label">Tên sách:</span> <%= s.getTenSach() %></p>
                <p><span class="label">Tác giả:</span> <%= s.getTacGia() %></p>
                <p><span class="label">Nhà xuất bản:</span> <%= s.getNhaXuatBan() %></p>
                <p><span class="label">Năm xuất bản:</span> <%= s.getNamXuatBan() %></p>
                <p><span class="label">Giá:</span> <%= String.format("%,.0f", s.getGia()) %> VNĐ</p>
                <p><span class="label">Số lượng:</span> <%= s.getSoLuong() %></p>
                <p><span class="label">Thể loại:</span> <%= s.getMaTheLoai() %></p>

                <form action="${pageContext.request.contextPath}/AdminXoaSach" method="post">
                    <input type="hidden" name="MaSach" value="<%= s.getMaSach() %>">
                    <div class="btn-group">
                        <button type="submit" class="btn btn-delete">Xóa</button>
                        <button type="button" class="btn btn-cancel" onclick="window.parent.closePopup()">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
