<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký - Vinabook</title>
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

        .register-btn {
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

        .register-btn:hover {
            background: #F57C00;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 152, 0, 0.3);
        }

        .register-btn:active {
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

        .login-link {
            text-align: center;
            color: #666;
            font-size: 14px;
        }

        .login-link a {
            color: #4a7c0c;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
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
        }
    </style>
</head>
<body>
    <div class="modal-content">
        <div class="modal-header">
            <div class="modal-logo">
                <span>vina</span><span>book</span><span style="color: white;">.com</span>
            </div>
            <h2>ĐĂNG KÝ TÀI KHOẢN</h2>
        </div>
        
        <div class="modal-body">
            <form id="registerForm">
                <div class="input-group">
                    <label for="firstName">Họ *</label>
                    <input type="text" id="firstName" placeholder="Nhập họ của bạn" required>
                </div>

                <div class="input-group">
                    <label for="lastName">Tên *</label>
                    <input type="text" id="lastName" placeholder="Nhập tên của bạn" required>
                </div>
                
                <div class="input-group">
                    <label for="email">Email *</label>
                    <input type="email" id="email" placeholder="example@email.com" required>
                </div>
                
                <div class="input-group">
                    <label for="password">Mật khẩu *</label>
                    <input type="password" id="password" placeholder="Tối thiểu 8 ký tự" required>
                </div>
                
                <button type="submit" class="register-btn">Đăng ký ngay</button>
            </form>
            
            <div class="divider">
                <span>Hoặc đăng ký với</span>
            </div>
            
            <div class="social-login">
                <button class="social-btn google-btn">
                    <i class="fab fa-google"></i> Google
                </button>
                <button class="social-btn facebook-btn">
                    <i class="fab fa-facebook-f"></i> Facebook
                </button>
            </div>

            <div class="login-link">
                Đã có tài khoản? <a href="#">Đăng nhập ngay</a>
            </div>
        </div>
    </div>

    <script>
        // Xử lý form đăng ký
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            if (password.length < 6) {
                alert('Mật khẩu phải có ít nhất 6 ký tự!');
                return;
            }
            
            alert(`Đăng ký thành công!\nHọ tên: ${firstName} ${lastName}\nEmail: ${email}`);
            
            // Reset form
            this.reset();
        });

        // Xử lý đăng ký bằng Google
        document.querySelector('.google-btn').addEventListener('click', function() {
            alert('Chức năng đăng ký bằng Google đang được phát triển!');
        });

        // Xử lý đăng ký bằng Facebook
        document.querySelector('.facebook-btn').addEventListener('click', function() {
            alert('Chức năng đăng ký bằng Facebook đang được phát triển!');
        });
    </script>
</body>
</html>