<%@ page contentType="text/html;charset=UTF-8" %>
<style>
/* ----- LỚP NỀN MỜ TOÀN MÀN HÌNH ----- */
.register-modal-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    overflow-y: auto;
    padding: 20px;
    box-sizing: border-box;
}

/* ----- KHUNG CHÍNH CỦA POPUP ----- */
.register-modal-content {
    background: #fff;
    border-radius: 10px;
    width: 100%;
    max-width: 500px;
    overflow: hidden;
    animation: popupFadeIn 0.3s ease;
    display: flex;
    flex-direction: column;
    border: 2px solid #6B8E23; 
}

/* Hiệu ứng mượt khi mở */
@keyframes popupFadeIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

/* ----- PHẦN HEADER ----- */
.register-modal-header {
    background: #6B8E23;
    padding: 20px;
    text-align: center;
    color: white;
    position: relative;
}

.register-modal-logo {
    font-size: 26px;
    font-weight: bold;
}

.register-modal-logo span:nth-child(2) {
    color: #FFA500;
}

.register-modal-header h2 {
    font-size: 22px;
    margin: 8px 0 0 0;
}

/* Nút đóng */
.register-close-btn {
    position: absolute;
    top: 10px;
    right: 12px;
    background: none;
    border: none;
    color: white;
    font-size: 28px;
    cursor: pointer;
    transition: transform 0.2s;
}
.register-close-btn:hover {
    transform: scale(1.2);
}

/* ----- PHẦN NỘI DUNG ----- */
.register-modal-body {
    padding: 25px;
    display: flex;
    flex-direction: column;
    gap: 18px;
}

/* ✅ ĐÓNG KHUNG RÕ CHO INPUT */
.register-input-group {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 6px 10px;
    transition: border-color 0.3s, box-shadow 0.3s;
}
.register-input-group:hover {
    border-color: #6B8E23;
}
.register-input-group:focus-within {
    border-color: #6B8E23;
    box-shadow: 0 0 4px rgba(107,142,35,0.5);
}

.register-input-group input {
    width: 100%;
    padding: 10px 6px;
    border: none;
    font-size: 15px;
    outline: none;
    background: transparent;
}

/* Nhóm mật khẩu + icon */
.register-password-group {
    position: relative;
}
.register-password-toggle {
    position: absolute;
    right: 14px;
    top: 50%;
    transform: translateY(-50%);
    color: #777;
    cursor: pointer;
}
.register-password-toggle:hover {
    color: #6B8E23;
}

/* ----- NÚT ĐĂNG KÝ ----- */
.register-btn {
    width: 100%;
    background: #FFA500;
    color: #fff;
    font-weight: bold;
    padding: 12px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    text-transform: uppercase;
    transition: 0.3s;
    margin-top: 10px; 
}
.register-btn:hover {
    background: #FF8C00;
}

/* ----- NGĂN CÁCH / SOCIAL LOGIN ----- */
.register-divider {
    text-align: center;
    position: relative;
    margin: 10px 0;
}
.register-divider::before {
    content: "";
    position: absolute;
    top: 50%;
    width: 100%;
    height: 1px;
    background: #ddd;
    left: 0;
}
.register-divider span {
    background: #fff;
    padding: 0 10px;
    color: #666;
    font-size: 14px;
    position: relative;
}

/* Social button */
.register-social-login {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}
.register-social-btn {
    flex: 1;
    padding: 10px;
    border: none;
    border-radius: 6px;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}
.register-google-btn {
    background: #DB4437;
}
.register-facebook-btn {
    background: #4267B2;
}
.register-social-btn:hover {
    opacity: 0.9;
}

/* ----- LINK ĐĂNG NHẬP ----- */
.register-login-link {
    text-align: center;
    font-size: 14px;
    color: #555;
}
.register-login-link a {
    color: #6B8E23;
    text-decoration: none;
    font-weight: 600;
}
.register-login-link a:hover {
    text-decoration: underline;
}

@media (max-width: 480px) {
    .register-modal-content {
        max-width: 95%;
    }
}
</style>


<div class="register-modal-wrapper">
  <div class="register-modal-content">
    <div class="register-modal-header">
      <button class="register-close-btn" onclick="closePopup()" type="button">×</button>
      <div class="register-modal-logo"><span>Web</span><span>Sach</span><span>.com</span></div>
      <h2>ĐĂNG KÝ</h2>
    </div>

    <div class="register-modal-body">
      <form id="registerFormPopup">
        <div class="register-input-group">
          <input type="text" id="UsernameRegister" name="Username" placeholder="Tài khoản" required>
        </div>

        <div class="register-input-group register-password-group">
          <input type="password" id="PasswordRegister" name="Password" placeholder="Mật khẩu" required>
          <i class="fas fa-eye register-password-toggle" id="togglePasswordRegister"></i>
        </div>

        <div class="register-input-group">
          <input type="text" id="HotenRegister" name="Hoten" placeholder="Họ tên" required>
        </div>

        <div class="register-input-group">
          <input type="email" id="EmailRegister" name="Email" placeholder="Email" required>
        </div>

        <div class="register-input-group">
          <input type="tel" id="SodienthoaiRegister" name="Sodienthoai" placeholder="Số điện thoại" required>
        </div>

        <div class="register-input-group">
          <input type="text" id="DiachiRegister" name="Diachi" placeholder="Địa chỉ" required>
        </div>

        <button type="button" class="register-btn" id="btnDangKyPopup">Đăng ký</button>

        <div class="register-divider"><span>Hoặc đăng ký với</span></div>

        <div class="register-social-login">
          <button type="button" class="register-social-btn register-google-btn" onclick="alert('Đang phát triển!')">
            <i class="fab fa-google"></i> Google
          </button>
          <button type="button" class="register-social-btn register-facebook-btn" onclick="alert('Đang phát triển!')">
            <i class="fab fa-facebook-f"></i> Facebook
          </button>
        </div>

        <div class="register-login-link">
          Đã có tài khoản?
          <a href="#" onclick="event.preventDefault(); openPopup('Pages/DangNhap.jsp');">Đăng nhập ngay</a>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
$('#togglePasswordRegister').click(function () {
  const input = $('#PasswordRegister');
  const type = input.attr('type') === 'password' ? 'text' : 'password';
  input.attr('type', type);
  $(this).toggleClass('fa-eye fa-eye-slash');
});

$('#btnDangKyPopup').click(function () {
  const data = {
    Username: $('#UsernameRegister').val(),
    Password: $('#PasswordRegister').val(),
    Hoten: $('#HotenRegister').val(),
    Email: $('#EmailRegister').val(),
    Sodienthoai: $('#SodienthoaiRegister').val(),
    Diachi: $('#DiachiRegister').val()
  };

  for (const key in data)
    if (!data[key]) return showPopup("Vui lòng nhập đầy đủ thông tin!", "error");

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(data.Email))
    return showPopup("Email không hợp lệ!", "error");

  if (!/^[0-9]{10}$/.test(data.Sodienthoai))
    return showPopup("Số điện thoại phải có 10 chữ số!", "error");

  if (data.Password.length < 6)
    return showPopup("Mật khẩu phải có ít nhất 6 ký tự!", "error");

  $.ajax({
    url: "DangKy",
    method: "POST",
    data,
    success: function (res) {
      if (res.status === "success") {
        showPopup(res.message, "success");
        closePopup();
        setTimeout(() => openPopup("Pages/DangNhap.jsp"), 1500);
      } else showPopup(res.message, "error");
    },
    error: function () {
      showPopup("Lỗi kết nối tới server!", "error");
    }
  });
});

$('#registerFormPopup input').keypress(function (e) {
  if (e.which === 13) $('#btnDangKyPopup').click();
});
</script>
