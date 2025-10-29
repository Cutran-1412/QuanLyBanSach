<%-- 
    Document   : DangKi
    Created on : Oct 19, 2025, 8:09:14 PM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .modal-content {
                background: white;
                border-radius: 15px;
                width: 100%;
                max-width: 500px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                animation: slideIn 0.5s ease;
            }

            @keyframes slideIn {
                from {
                    transform: translateY(-50px);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            .modal-header {
                background: linear-gradient(135deg, #4a7c0c 0%, #3d6609 100%);
                padding: 40px 30px;
                text-align: center;
                color: white;
                border-radius: 15px 15px 0 0;
            }

            .modal-logo {
                font-size: 32px;
                font-weight: bold;
                margin-bottom: 15px;
            }

            .modal-logo span:first-child {
                color: white;
            }

            .modal-logo span:nth-child(2) {
                color: #FF9800;
            }

            .modal-header h2 {
                font-size: 28px;
                margin: 0;
            }

            .modal-body {
                padding: 40px;
            }

            .input-group {
                margin-bottom: 20px;
            }

            .input-group label {
                display: block;
                margin-bottom: 8px;
                color: #333;
                font-weight: 500;
                font-size: 14px;
            }

            .input-group input {
                width: 100%;
                padding: 15px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                font-size: 15px;
                outline: none;
                transition: all 0.3s;
            }

            .input-group input:focus {
                border-color: #4a7c0c;
                box-shadow: 0 0 0 3px rgba(74, 124, 12, 0.1);
            }

            .password-group {
                position: relative;
            }

            .password-toggle {
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                color: #666;
                transition: color 0.3s;
            }

            .password-toggle:hover {
                color: #4a7c0c;
            }

            .form-options {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
            }

            .remember-me {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 14px;
                color: #666;
            }

            .remember-me input[type="checkbox"] {
                width: 18px;
                height: 18px;
                cursor: pointer;
            }

            .forgot-password {
                font-size: 14px;
            }

            .forgot-password a {
                color: #666;
                text-decoration: none;
                transition: color 0.3s;
            }

            .forgot-password a:hover {
                color: #4a7c0c;
                text-decoration: underline;
            }

            .login-btn {
                width: 100%;
                padding: 16px;
                background: #FF9800;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                text-transform: uppercase;
                margin-top: 10px;
            }

            .login-btn:hover {
                background: #F57C00;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 152, 0, 0.3);
            }

            .login-btn:active {
                transform: translateY(0);
            }

            .divider {
                text-align: center;
                margin: 30px 0;
                position: relative;
            }

            .divider::before {
                content: '';
                position: absolute;
                left: 0;
                top: 50%;
                width: 100%;
                height: 1px;
                background: #e0e0e0;
            }

            .divider span {
                background: white;
                padding: 0 15px;
                position: relative;
                color: #666;
                font-size: 14px;
            }

            .social-login {
                display: flex;
                gap: 15px;
                margin-bottom: 25px;
            }

            .social-btn {
                flex: 1;
                padding: 13px;
                border: none;
                border-radius: 8px;
                font-size: 14px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .social-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            }

            .google-btn {
                background: #DB4437;
            }

            .facebook-btn {
                background: #4267B2;
            }

            .register-link {
                text-align: center;
                color: #666;
                font-size: 14px;
            }

            .register-link a {
                color: #4a7c0c;
                text-decoration: none;
                font-weight: 600;
            }

            .register-link a:hover {
                text-decoration: underline;
            }

            @media (max-width: 600px) {
                .modal-content {
                    margin: 20px;
                }

                .modal-header {
                    padding: 30px 20px;
                }

                .modal-body {
                    padding: 30px 20px;
                }

                .modal-logo {
                    font-size: 28px;
                }

                .modal-header h2 {
                    font-size: 24px;
                }

                .form-options {
                    flex-direction: column;
                    gap: 10px;
                    align-items: flex-start;
                }
            }
        </style>

    </head>
    <body>
        <form action="${pageContext.request.contextPath}/DangKy" method="Post">
            <label>Tài khoản</label>
            <input type="text" id="Username" name="Username" required><br>
            <label>Mật khẩu</label>
            <input type="text" id="Password" name="Password" required><br>
            <label>Họ tên</label>
            <input type="text" id="Hoten" name="Hoten" required><br>
            <label>Email</label>
            <input type="text" id="Email" name="Email" required><br>
            <label>Số điện thoại</label>
            <input type="text" id="Sodienthoai" name="Sodienthoai" required><br>
            <label>Địa chỉ</label>
            <input type="text" id="Diachi" name="Diachi" required><br>
            <button type="submit">Đăng nhập</button>
        </form>
    </body>
</html>
