<%-- 
    Document   : SuaTheLoai
    Created on : Oct 21, 2025, 10:01:36 PM
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
                color: #0f3b5f;
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
            }

            input[readonly] {
                background-color: #f5f5f5;
                color: #666;
            }

            .btn-group {
                display: flex;
                justify-content: space-between;
                margin-top: 25px;
            }

            button {
                flex: 1;
                margin: 0 5px;
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 12px 0;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                font-weight: bold;
                transition: all 0.25s ease;
            }

            button:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
            }

            .cancel-btn {
                background-color: #dc3545;
            }

            .cancel-btn:hover {
                background-color: #a71d2a;
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
            <h2>Sửa Thể Loại</h2>
            <form action="${pageContext.request.contextPath}/AdminSuaTheLoai" method="post">
                <label for="MaTheLoai">Mã thể loại:</label>
                <input type="text" id="MaTheLoai" name="MaTheLoai" value="<%= tl.getMaTheLoai() %>" readonly>

                <label for="TenTheLoai">Tên thể loại:</label>
                <input type="text" id="TenTheLoai" name="TenTheLoai" value="<%= tl.getTenTheLoai() %>" required>

                <div class="btn-group">
                    <button type="submit">Lưu</button>
                </div>
            </form>

            <% 
                String msg = request.getParameter("msg");
                if (msg != null && !msg.isEmpty()) {
            %>
                <div class="message"><%= msg %></div>
            <% } %>
        </div>
    </body>
</html>
