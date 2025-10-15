<%-- 
    Document   : Sach
    Created on : Oct 14, 2025, 1:46:39 PM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Models.Sach" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            img {
                width: 60px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
            }

            a img:hover {
                transform: scale(1.2);
                transition: 0.3s;
            }

            h2 {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h2>DANH SÁCH SÁCH</h2>

    <table>
        <tr>
            <th>Mã sách</th>
            <th>Tên sách</th>
            <th>Tác giả</th>
            <th>Nhà xuất bản</th>
            <th>Năm xuất bản</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thể loại</th>
            <th>Mô tả</th>
            <th>Ảnh</th>
        </tr>

        <%
            List<Sach> dsSach = (List<Sach>) request.getAttribute("list");
            if (dsSach != null) {
                for (Sach s : dsSach) {
        %>
            <tr>
                <td><%= s.getMaSach() %></td>
                <td><%= s.getTenSach() %></td>
                <td><%= s.getTacGia() %></td>
                <td><%= s.getNhaXuatBan() %></td>
                <td><%= s.getNamXuatBan() %></td>
                <td><%= s.getGia() %></td>
                <td><%= s.getSoLuong() %></td>
                <td><%= s.getMaTheLoai() %></td>
                <td><%= s.getMoTa() %></td>
                <td><img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>"></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="10">Không có dữ liệu sách.</td>
            </tr>
        <%
            }
        %>
    </table>
    </body>
</html>
