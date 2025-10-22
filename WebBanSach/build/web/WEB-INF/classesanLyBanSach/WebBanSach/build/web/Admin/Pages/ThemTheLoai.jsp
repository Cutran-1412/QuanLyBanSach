<%-- 
    Document   : ThemTheLoai
    Created on : Oct 21, 2025, 9:01:33 PM
    Author     : Osiris
--%>

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

            input[type="text"]:focus {
                border-color: #007bff;
                outline: none;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            }

            button {
                width: 100%;
                background-color: #007bff;
                color: #fff;
                border: none;
                margin-top: 20px;
                padding: 12px 0;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.2s;
            }

            button:hover {
                background-color: #0056b3;
            }

            .message {
                margin-top: 15px;
                color: red;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2>Thêm Thể Loại</h2>
            <form action="${pageContext.request.contextPath}/AdminThemTheLoai" method="post">
                <label for="MaTheLoai">Mã thể loại:</label>
                <input type="text" id="MaTheLoai" name="MaTheLoai" required>

                <label for="TenTheLoai">Tên thể loại:</label>
                <input type="text" id="TenTheLoai" name="TenTheLoai" required>

                <button type="submit">Thêm mới</button>
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
