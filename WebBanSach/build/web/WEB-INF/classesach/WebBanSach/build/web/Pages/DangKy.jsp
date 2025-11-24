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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Font Awesome để hiển thị icon mắt -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body { font-family: 'Segoe UI', sans-serif; }
        .register-modal-wrapper {
            position: fixed; top: 0; left: 0; width: 100vw; height: 100vh;
            background: transparent; display: flex; align-items: center;
            justify-content: center; z-index: 9999; overflow-y: auto;
            padding: 20px; box-sizing: border-box;
        }
        .register-modal-content {
            background: #fff; border-radius: 10px; width: 100%;
            max-width: 500px; overflow: hidden; animation: popupFadeIn .3s ease;
            border: 2px solid #6B8E23;
        }
        @keyframes popupFadeIn {
            from { opacity: 0; transform: scale(.9); }
            to   { opacity: 1; transform: scale(1); }
        }
        .register-modal-header {
            background: #6B8E23; padding: 20px; text-align: center;
            color: white; position: relative;
        }
        .register-modal-logo { font-size: 26px; font-weight: bold; }
        .register-modal-logo span:nth-child(2) { color: #FFA500; }
        .register-close-btn {
            position: absolute; top: 10px; right: 12px; background: none;
            border: none; color: white; font-size: 28px; cursor: pointer;
        }
        .register-modal-body { padding: 25px; display: flex; flex-direction: column; gap: 18px; }
        .register-input-group {
            border: 1px solid #ccc; border-radius: 8px; padding: 6px 10px;
        }
        .register-input-group input {
            width: 100%; padding: 10px 6px; border: none; outline: none;
            background: transparent; font-size: 15px;
        }
        .register-password-group { position: relative; }
        .register-password-toggle {
            position: absolute; right: 14px; top: 50%; transform: translateY(-50%);
            cursor: pointer; color: #777;
        }
        .register-btn {
            width: 100%; background: #FFA500; color: #fff; font-weight: bold;
            padding: 12px; border: none; border-radius: 6px; cursor: pointer;
            margin-top: 10px; text-transform: uppercase;
        }
    </style>
</head>

<body>

<div id="registerError" style="color: red; font-size: 14px; margin-bottom: 5px; display: none;"></div>

<div class="register-modal-wrapper">
    <div class="register-modal-content">

        <div class="register-modal-header">
            <button class="register-close-btn"
                    onclick="window.location.href='${pageContext.request.contextPath}/Home'" type="button">×</button>
            <div class="register-modal-logo"><span>Web</span><span>Sach</span><span>.com</span></div>
            <h2>ĐĂNG KÝ</h2>
        </div>

        <div class="register-modal-body">

            <form id="registerForm">
                <div class="register-input-group"><input type="text" name="Username" placeholder="Tài khoản" required></div>
                <div class="register-input-group register-password-group">
                    <input type="password" id="Password" name="Password" placeholder="Mật khẩu" required>
                    <i class="fas fa-eye register-password-toggle" id="togglePassword"></i>
                </div>
                <div class="register-input-group"><input type="text" name="Hoten" placeholder="Họ tên" required></div>
                <div class="register-input-group"><input type="email" name="Email" placeholder="Email" required></div>
                <div class="register-input-group"><input type="tel" name="Sodienthoai" placeholder="Số điện thoại" required></div>
                <div class="register-input-group"><input type="text" name="Diachi" placeholder="Địa chỉ" required></div>

                <button type="submit" class="register-btn">Đăng ký</button>
            </form>

        </div>
    </div>
</div>

<script>
    const contextPath = "${pageContext.request.contextPath}";

    // Hiện/ẩn mật khẩu
    document.getElementById("togglePassword").onclick = function () {
        const pass = document.getElementById("Password");
        pass.type = pass.type === "password" ? "text" : "password";
        this.classList.toggle("fa-eye-slash");
    };

    // AJAX đăng ký
    $("#registerForm").submit(function (e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: contextPath + "/DangKy",
            data: $(this).serialize(),

            success: function (res) {
                res = res.trim();

                if (res === "EXISTS") {
                    $("#registerError").text("Tài khoản đã tồn tại!").slideDown();
                } else if (res === "SUCCESS") {
                    $("#registerError").hide();
                    window.location.href = contextPath + "/Home";
                } else {
                    $("#registerError").text("Lỗi không xác định: " + res).slideDown();
                }
            },

            error: function () {
                $("#registerError").text("Lỗi AJAX: Không gọi được servlet DangKy").slideDown();
            }
        });
    });
</script>

</body>
</html>
