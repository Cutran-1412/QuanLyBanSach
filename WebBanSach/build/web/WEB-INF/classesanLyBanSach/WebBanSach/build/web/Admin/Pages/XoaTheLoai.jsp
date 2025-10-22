<%-- 
    Document   : XoaTheLoai
    Created on : Oct 21, 2025, 10:13:53 PM
    Author     : Osiris
--%>

<%@page import="Models.TheLoai"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: "Segoe UI", sans-serif;
            }

            body {
                margin: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #eef3fa;
            }

            .form-container {
                background: #ffffff;
                padding: 40px 50px;
                border-radius: 16px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
                width: 420px;
                text-align: center;
                transition: all 0.3s ease;
            }

            .form-container:hover {
                transform: translateY(-3px);
            }

            h2 {
                color: #b30000;
                margin-bottom: 25px;
            }

            label {
                display: block;
                text-align: left;
                color: #333;
                font-weight: 500;
                margin-top: 10px;
            }

            input[type="text"] {
                width: 100%;
                padding: 10px 12px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 15px;
                transition: 0.3s;
                background-color: #f5f5f5;
                color: #555;
            }

            .btn-group {
                display: flex;
                justify-content: center;
                margin-top: 25px;
            }

            button {
                width: 50%;
                background-color: #e74c3c;
                color: #fff;
                border: none;
                padding: 12px 0;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.2s;
            }

            button:hover {
                background-color: #c0392b;
            }

            .message {
                margin-top: 15px;
                color: red;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <%
            TheLoai tl = (TheLoai) request.getAttribute("theloai");
        %>
        <div class="form-container">
            <h2>Xóa Thể Loại</h2>
            <form action="${pageContext.request.contextPath}/AdminXoaTheLoai" method="post">
                <label for="MaTheLoai">Mã thể loại:</label>
                <input type="text" id="MaTheLoai" name="MaTheLoai" value="<%= tl.getMaTheLoai() %>" readonly>

                <label for="TenTheLoai">Tên thể loại:</label>
                <input type="text" id="TenTheLoai" name="TenTheLoai" value="<%= tl.getTenTheLoai() %>" readonly>

                <div class="btn-group">
                    <button type="submit">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</html>
