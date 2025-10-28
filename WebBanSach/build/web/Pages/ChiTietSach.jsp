<%-- 
    Document   : ChiTietSach
    Created on : Oct 19, 2025, 8:09:24 PM
    Author     : Windows
--%>

<%@page import="Models.Sach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  Sach s = (Sach) request.getAttribute("sach");%>
        <img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>">
        <p><span class="label">Tác giả:</span> <%= s.getTacGia() %></p>
        <p><span class="label">Nhà xuất bản:</span> <%= s.getNhaXuatBan() %></p>
        <p><span class="label">Năm xuất bản:</span> <%= s.getNamXuatBan() %></p>
        <p><span class="label">Giá:</span> <%= String.format("%,.0f", s.getGia()) %> VNĐ</p>
        <p><span class="label">Số lượng:</span> <%= s.getSoLuong() %></p>
        <p><span class="label">Thể loại:</span> <%= s.getMaTheLoai() %></p>
        <p><span class="label">Mô tả:</span></p>
        <p><%= s.getMoTa() %></p>
        <button onclick="window.location.href='Home'">Quay lại</button>
    </body>
</html>
