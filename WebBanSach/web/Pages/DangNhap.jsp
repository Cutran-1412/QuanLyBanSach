<%-- 
    Document   : DangNhap
    Created on : Nov 4, 2025, 12:50:41 PM
    Author     : Osiris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
        /* ===== POPUP ĐĂNG NHẬP ===== */

        .login-modal-content {
            width: 420px;
            background: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            margin: 60px auto;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.25);
            font-family: "Segoe UI", sans-serif;
        }

        /* ===== HEADER ===== */
        .login-modal-header {
            background: #6B8E23;
            padding: 40px 0 32px 0;
            text-align: center;
            position: relative;
        }

        .login-close-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 22px;
            border: none;
            background: none;
            color: white;
            cursor: pointer;
        }

        .login-modal-logo span:nth-child(1) {
            color: white;
            font-size: 30px;
            font-weight: bold;
        }

        .login-modal-logo span:nth-child(2) {
            color: #f7c236;
            font-size: 30px;
            font-weight: bold;
        }

        .login-modal-logo span:nth-child(3) {
            color: white;
            font-size: 30px;
            font-weight: bold;
        }

        .login-modal-header h2 {
            color: white;
            margin-top: 10px;
            font-size: 26px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        /* ===== BODY ===== */
        .login-modal-body {
            padding: 35px 35px 28px 35px;
        }

        /* Input */
        .login-input-group input {
            width: 100%;
            padding: 13px 15px;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 15px;
            outline: none;
            margin-bottom: 18px;
            transition: 0.2s;
            box-sizing: border-box; /* 🌟 quan trọng: tránh bị tràn khung */
        }

        .login-input-group input:focus {
            border-color: #6B8E23;
            box-shadow: 0 0 6px rgba(107, 142, 35, 0.4);
        }

        /* Mật khẩu + icon */
        .login-password-group {
            position: relative;
        }

        .login-password-toggle {
            position: absolute;
            right: 15px;
            top: 14px;
            cursor: pointer;
            color: #666;
        }

        /* Quên mật khẩu */
        .login-forgot-password {
            text-align: right;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 20px;
        }

        .login-forgot-password a {
            color: #333;
        }

        .login-forgot-password span {
            color: #6B8E23;
            font-weight: bold;
        }

        /* Nút đăng nhập */
        .login-btn {
            width: 100%;  /* 🌟 bằng đúng ô input */
            background: #F9A825;
            border: none;
            padding: 13px;
            font-size: 17px;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            letter-spacing: 0.5px;
            margin-top: 5px;
            transition: 0.2s;
            box-sizing: border-box;  /* tránh tràn */
        }

        .login-btn:hover {
            background: #e4971e;
        }

        /* Divider */
        .login-divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 25px 0;
            font-size: 15px;
            color: #777;
        }

        .login-divider::before,
        .login-divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #ddd;
        }

        .login-divider:not(:empty)::before {
            margin-right: .75em;
        }

        .login-divider:not(:empty)::after {
            margin-left: .75em;
        }

        /* Social Login */
        .login-social-login {
            display: flex;
            justify-content: space-between;
            gap: 12px;
        }

        .login-social-btn {
            flex: 1;
            padding: 11px;
            border-radius: 6px;
            border: none;
            font-size: 15px;
            cursor: pointer;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-weight: bold;
        }

        .login-google-btn {
            background: #DB4437;
        }

        .login-facebook-btn {
            background: #1877F2;
        }

        /* Link đăng ký */
        .login-register-link {
            margin-top: 28px;
            text-align: center;
            font-size: 15px;
            color: #333;
        }

        .login-register-link a {
            color: #6B8E23;
            font-weight: bold;
            text-decoration: none;
        }

        .login-register-link a:hover {
            text-decoration: underline;
        }
        </style>

    </head>
    <body>
     <div class="login-modal-content">
            <!-- HEADER -->
            <div class="login-modal-header">
                <button class="login-close-btn" onclick="closePopup()" type="button">×</button>

                <div class="login-modal-logo">
                    <span>Web</span><span>Sach</span><span>.com</span>
                </div>
                <h2>ĐĂNG NHẬP</h2>
            </div>

            <!-- BODY -->
            <div class="login-modal-body">
                <form action="DangNhap" method="Post">

                    <!-- Tài khoản -->
                    <div class="login-input-group">
                        <input type="text" id="Username" name="Username" placeholder="Email" required>
                    </div>

                    <!-- Mật khẩu -->
                    <div class="login-input-group">
                        <div class="login-password-group">
                            <input type="password" id="Password" name="Password" placeholder="Mật khẩu" required>
                            <i class="fas fa-eye login-password-toggle" id="togglePasswordPopup"></i>
                        </div>
                    </div>

                    <!-- Quên mật khẩu -->
                    <div class="login-forgot-password">
                        <a href="#" onclick="event.preventDefault(); alert('Chức năng đang phát triển');">
                            Quên mật khẩu?
                        </a>
                    </div>

                    <!-- Nút đăng nhập -->
                    <button type="submit" class="login-btn" id="btnDangNhap">Đăng nhập</button>

                </form>

                <!-- Divider -->
                <div class="login-divider">
                    <span>Hoặc đăng nhập với</span>
                </div>

                <!-- Social login -->
                <div class="login-social-login">
                    <button class="login-social-btn login-google-btn" type="button"
                        onclick="alert('Google login đang phát triển!');">
                        <i class="fab fa-google"></i> Google
                    </button>

                    <button class="login-social-btn login-facebook-btn" type="button"
                        onclick="alert('Facebook login đang phát triển!');">
                        <i class="fab fa-facebook-f"></i> Facebook
                    </button>
                </div>

                <!-- Link đăng ký -->
                <div class="login-register-link">
                    Bạn chưa có tài khoản? 
                    <a href="#" onclick="event.preventDefault(); openPopup('Pages/DangKy.jsp');">Đăng ký ngay</a>
                </div>

            </div>
        </div>
        
        <script>
            const toggle = document.getElementById("togglePasswordPopup");
            const password = document.getElementById("Password");

            toggle.addEventListener("click", function () {
                // Đổi type
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);

                // Đổi icon (nếu có dùng FontAwesome)
                this.classList.toggle("fa-eye-slash");
            });
        </script>   
    </body>
</html>
