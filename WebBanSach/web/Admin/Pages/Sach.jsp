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
        <link href="${pageContext.request.contextPath}/Assets/CSS/Button.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/Assets/CSS/Table.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/Assets/CSS/Image.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/Assets/CSS/Popup.css" rel="stylesheet" type="text/css"/>
        </style>
    </head>
    <body>
 
        <div style="text-align: center"> 
            <button class="btn-add" onclick="openPopup('InsertSach')">Thêm</button>
            <input type="text" placeholder="Nhập từ khóa..." style="width: 300px; height: 40px; font-size: 16px; padding: 5px;">
            <button class="btn-search">Tìm kiếm</button>
        </div>
        <div id="popup" class="popup">
            <div class="popup-content">
                <span class="close" onclick="closePopup()">&times;</span>
                <iframe id="popupFrame" src="" frameborder="0"></iframe>
            </div>
        </div>
    <table>
        <tr>
            <th>Mã sách</th>
            <th>Tên sách</th>
            <th>Giá</th>
            <th>Số lượng</th>   
            <th>Ảnh</th>
            <th>Hành động</th>
        </tr>

        <%
            List<Sach> dsSach = (List<Sach>) request.getAttribute("list");
            if (dsSach != null) {
                for (Sach s : dsSach) {
        %>
            <tr>
                <td><%= s.getMaSach() %></td>
                <td><%= s.getTenSach() %></td>
                <td><%= s.getGia() %></td>
                <td><%= s.getSoLuong() %></td>
                <td><img src="<%= s.getAnh() %>" alt="<%= s.getTenSach() %>"></td>
                <td class="action-buttons">
                    <div>
                        <button class="btn-edit">Sửa</button>
                        <button class="btn-delete">Xóa</button>
                        <button class="btn-detail"onclick="openPopup('AdminChiTietSach?ma=<%= s.getMaSach() %>')">Chi tiết</button>
                    </div>
                </td>
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
    <script>
        function openPopup(url) {
            const popup = document.getElementById("popup");
            const frame = document.getElementById("popupFrame");
            frame.src = url;
            popup.style.display = "flex";
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
            document.getElementById("popupFrame").src = "";
        }

        function confirmDelete(maSach) {
            if (confirm("Bạn có chắc muốn xóa sách này không?")) {
                // Gửi yêu cầu xóa đến servlet
                window.location.href = "SachServlet?action=delete&ma=" + maSach;
            }
        }
    </script>
    </body>
</html>
