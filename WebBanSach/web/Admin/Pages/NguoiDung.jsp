<%-- 
    Document   : User
    Created on : Oct 15, 2025, 8:23:34 AM
    Author     : Windows
--%>

<%@page import="Models.NguoiDung"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý người dùng</title>

    <link href="${pageContext.request.contextPath}/Assets/CSS/Popup.css" rel="stylesheet" type="text/css"/>

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

        h2 {
            text-align: center;
        }

        .detail-btn {
            padding: 6px 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .detail-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<table>
    <tr>
        <th>Mã người dùng</th>
        <th>Họ và tên</th>
        <th>Email</th>
        <th>Số điện thoại</th>
        <th>Địa chỉ</th>
        <th>Vai trò</th>
        <th>Chi tiết</th>
    </tr>

    <%
        List<NguoiDung> list = (List<NguoiDung>) request.getAttribute("list");
        for (NguoiDung item : list) {
    %>

    <tr>
        <td><%= item.getMaNguoiDung() %></td>
        <td><%= item.getHoTen() %></td>
        <td><%= item.getEmail() %></td>
        <td><%= item.getSoDienThoai() %></td>
        <td><%= item.getDiaChi() %></td>
        <td><%= item.isVaiTro() ? "Quản trị viên" : "Người dùng" %></td>
        <td>
            <button class="detail-btn"
                onclick="openPopup('<%=request.getContextPath()%>/AdminChiTietNguoiDung?ma=<%=item.getMaNguoiDung()%>')">
                Chi tiết
            </button>
        </td>
    </tr>

    <% } %>

</table>

<!-- POPUP -->
<div id="popup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup()">&times;</span>
        <iframe id="popupFrame" src="" frameborder="0"></iframe>
    </div>
</div>

<script>
    function openPopup(url) {
        document.getElementById("popupFrame").src = url;
        document.getElementById("popup").style.display = "flex";
    }

    function closePopup() {
        document.getElementById("popup").style.display = "none";
        document.getElementById("popupFrame").src = "";
    }
</script>

</body>
</html>
