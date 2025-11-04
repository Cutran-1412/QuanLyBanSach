<%-- 
    Document   : DangKy
    Created on : Nov 4, 2025, 12:50:06 PM
    Author     : Osiris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                font-family: 'Roboto', sans-serif;
                margin: 0;
            }

            /* Lớp nền mờ che toàn trang */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                background-color: rgba(0,0,0,0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999;
            }
            .register-container {
                background-color: #fff;
                padding: 30px 40px;
                border-radius: 12px;
                box-shadow: 0 8px 25px rgba(0,0,0,0.25);
                width: 360px;
                max-width: 90%;
                position: relative;
                animation: fadeIn 0.3s ease;
            }

            @keyframes fadeIn {
                from {opacity: 0; transform: scale(0.9);}
                to {opacity: 1; transform: scale(1);}
            }

            /* Nút đóng */
            .close-btn {
                position: absolute;
                right: 15px;
                top: 10px;
                font-size: 22px;
                color: #555;
                cursor: pointer;
                font-weight: bold;
            }
            .close-btn:hover {
                color: #000;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            label {
                display: block;
                margin-top: 10px;
                font-weight: 600;
                color: #333;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-top: 6px;
                border: 1px solid #ccc;
                border-radius: 6px;
                outline: none;
                font-size: 14px;
                transition: all 0.3s;
            }

            input:focus {
                border-color: #007bff;
                box-shadow: 0 0 4px rgba(0, 123, 255, 0.4);
            }

            button {
                width: 100%;
                background-color: #007bff;
                color: white;
                border: none;
                padding: 12px;
                border-radius: 6px;
                font-size: 16px;
                cursor: pointer;
                margin-top: 20px;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #0056b3;
            }

            .login-link {
                text-align: center;
                margin-top: 15px;
                font-size: 14px;
            }

            .login-link a {
                color: #007bff;
                text-decoration: none;
            }

            .login-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="overlay">
            <div class="register-container">
            <span class="close-btn" onclick="window.location.href='${pageContext.request.contextPath}/Home'">&times;</span>
            <h2>Đăng ký tài khoản</h2>

            <form action="${pageContext.request.contextPath}/DangKy" method="POST">
                <label for="Username">Tài khoản</label>
                <input type="text" id="Username" name="Username" placeholder="Nhập tên tài khoản" required>

                <label for="Password">Mật khẩu</label>
                <input type="password" id="Password" name="Password" placeholder="Nhập mật khẩu" required>

                <label for="Hoten">Họ và tên</label>
                <input type="text" id="Hoten" name="Hoten" placeholder="Nhập họ tên đầy đủ" required>

                <label for="Email">Email</label>
                <input type="email" id="Email" name="Email" placeholder="Nhập email hợp lệ" required>

                <label for="Sodienthoai">Số điện thoại</label>
                <input type="text" id="Sodienthoai" name="Sodienthoai" placeholder="Nhập số điện thoại" required>

                <label for="Diachi">Địa chỉ</label>
                <input type="text" id="Diachi" name="Diachi" placeholder="Nhập địa chỉ của bạn" required>

                <button type="submit">Đăng ký</button>

                <div class="login-link">
                    Đã có tài khoản? <a href="${pageContext.request.contextPath}/Pages/DangNhap.jsp">Đăng nhập</a>
                </div>
            </form>
        </div>
    </div>
    </body>
</html>
