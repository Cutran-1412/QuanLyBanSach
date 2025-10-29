<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    .login-modal-content {
        background: white;
        border-radius: 8px;
        width: 100%;
        max-width: 520px;
        margin: 0 auto;
        position: relative;
        overflow: hidden;
        padding: 0;
    }
    
    .login-modal-header {
        background: #6B8E23;
        padding: 40px 30px;
        text-align: center;
        color: white;
        position: relative;
    }
    
    .login-close-btn {
        position: absolute;
        top: 15px;
        right: 15px;
        background: none;
        border: none;
        color: white;
        font-size: 28px;
        cursor: pointer;
        width: 35px;
        height: 35px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: transform 0.2s;
    }
    
    .login-close-btn:hover {
        transform: scale(1.1);
    }
    
    .login-modal-logo {
        font-size: 32px;
        font-weight: bold;
        margin-bottom: 15px;
    }
    
    .login-modal-logo span:first-child {
        color: white;
    }
    
    .login-modal-logo span:nth-child(2) {
        color: #FFA500;
    }
    
    .login-modal-logo span:nth-child(3) {
        color: white;
    }
    
    .login-modal-header h2 {
        font-size: 28px;
        margin: 0;
        font-weight: bold;
        letter-spacing: 1px;
    }
    
    .login-modal-body {
        padding: 40px 35px;
    }
    
    .login-input-group {
        margin-bottom: 20px;
    }
    
    .login-input-group input {
        width: 100%;
        padding: 15px 20px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 15px;
        outline: none;
        transition: all 0.3s;
        box-sizing: border-box;
        color: #333;
    }
    
    .login-input-group input::placeholder {
        color: #999;
    }
    
    .login-input-group input:focus {
        border-color: #6B8E23;
    }
    
    .login-password-group {
        position: relative;
    }
    
    .login-password-toggle {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #666;
        transition: color 0.3s;
    }
    
    .login-password-toggle:hover {
        color: #6B8E23;
    }
    
    .login-forgot-password {
        text-align: right;
        margin-bottom: 25px;
    }
    
    .login-forgot-password a {
        color: #666;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s;
    }
    
    .login-forgot-password a:hover {
        color: #6B8E23;
    }
    
    .login-forgot-password a span {
        color: #6B8E23;
        font-weight: 600;
    }
    
    .login-btn {
        width: 100%;
        padding: 15px;
        background: #FFA500;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    
    .login-btn:hover {
        background: #FF8C00;
    }
    
    .login-divider {
        text-align: center;
        margin: 35px 0 25px 0; 
        position: relative;
    }
    
    .login-divider::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        width: 100%;
        height: 1px;
        background: #ddd;
    }
    
    .login-divider span {
        background: white;
        padding: 0 15px;
        position: relative;
        color: #666;
        font-size: 14px;
    }
    
    .login-social-login {
        display: flex;
        gap: 15px;
        margin-bottom: 40px; 
    }
    
    .login-social-btn {
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 4px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }
    
    .login-social-btn:hover {
        opacity: 0.9;
        transform: translateY(-1px);
    }
    
    .login-google-btn {
        background: #DB4437;
    }
    
    .login-facebook-btn {
        background: #4267B2;
    }
    
    .login-register-link {
        text-align: center;
        color: #666;
        font-size: 14px;
    }
    
    .login-register-link a {
        color: #6B8E23;
        text-decoration: none;
        font-weight: 600;
    }
    
    .login-register-link a:hover {
        text-decoration: underline;
    }
    
    @media (max-width: 600px) {
        .login-modal-content {
            max-width: 95%;
        }
        .login-modal-header {
            padding: 25px 20px;
        }
        .login-modal-body {
            padding: 25px 20px;
        }
        .login-modal-logo {
            font-size: 26px;
        }
        .login-modal-header h2 {
            font-size: 24px;
        }
    }
</style>

<div class="login-modal-content">
    <div class="login-modal-header">
        <button class="login-close-btn" onclick="closePopup()" type="button">×</button>
        <div class="login-modal-logo">
            <span>Web</span><span>Sach</span><span>.com</span>
        </div>
        <h2>ĐĂNG NHẬP</h2>
    </div>
    
    <div class="login-modal-body">
        <form id="loginFormPopup">
            <div class="login-input-group">
                <input type="text" id="UsernamePopup" name="Username" placeholder="Email" required>
            </div>
            
            <div class="login-input-group">
                <div class="login-password-group">
                    <input type="password" id="PasswordPopup" name="Password" placeholder="Mật khẩu" required>
                    <i class="fas fa-eye login-password-toggle" id="togglePasswordPopup"></i>
                </div>
            </div>
            
            <div class="login-forgot-password">
                <a href="#" onclick="event.preventDefault(); alert('Chức năng khôi phục mật khẩu đang được phát triển!');">
                    Quên mật khẩu? <span>hoặc Đăng ký</span>
                </a>
            </div>
            
            <button type="button" class="login-btn" id="btnDangNhapPopup">Đăng nhập</button>
        </form>
        
        <div class="login-divider">
            <span>Hoặc đăng nhập với</span>
        </div>
        
        <div class="login-social-login">
            <button class="login-social-btn login-google-btn" type="button"
                onclick="alert('Chức năng đăng nhập bằng Google đang được phát triển!');">
                <i class="fab fa-google"></i> Google
            </button>
            <button class="login-social-btn login-facebook-btn" type="button"
                onclick="alert('Chức năng đăng nhập bằng Facebook đang được phát triển!');">
                <i class="fab fa-facebook-f"></i> Facebook
            </button>
        </div>
        
        <div class="login-register-link">
            Chưa có tài khoản? <a href="#" onclick="event.preventDefault(); openPopup('Pages/DangKy.jsp');">Đăng ký ngay</a>
        </div>
    </div>
</div>

<script>
    // Hiện/ẩn mật khẩu
    $('#togglePasswordPopup').click(function() {
        const passwordInput = $('#PasswordPopup');
        const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
        passwordInput.attr('type', type);
        $(this).toggleClass('fa-eye fa-eye-slash');
    });

    // Xử lý đăng nhập AJAX
    $("#btnDangNhapPopup").click(function () {
        const username = $("#UsernamePopup").val();
        const password = $("#PasswordPopup").val();

        if (!username || !password) {
            showPopup("Vui lòng nhập đầy đủ thông tin!", "error");
            return;
        }

        $.ajax({
            url: "DangNhap",
            method: "POST",
            data: { Username: username, Password: password },
            success: function (response) {
                if (response.status === "success") {
                    showPopup(response.message, "success");
                    closePopup();
                    setTimeout(() => location.reload(), 1000);
                } else {
                    showPopup(response.message, "error");
                }
            },
            error: function () {
                showPopup("Lỗi kết nối tới server!", "error");
            }
        });
    });

    // Enter để đăng nhập
    $('#UsernamePopup, #PasswordPopup').keypress(function(e) {
        if (e.which === 13) $('#btnDangNhapPopup').click();
    });
</script>
