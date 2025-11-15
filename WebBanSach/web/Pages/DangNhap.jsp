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
            body {
                font-family: Arial, sans-serif;
            }
            .login-container {
                width: 300px;
                margin: 100px auto;
                padding: 20px;
                border-radius: 8px;
                background: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.2);
                position: relative;
            }
            .close-btn {
                position: absolute;
                top: 8px;
                right: 12px;
                font-size: 22px;
                color: #666;
                cursor: pointer;
                transition: 0.2s;
            }
            label {
                font-weight: bold;
            }
/*            input.Username,intput.password{    
                width: 100%;
                padding: 8px;
                margin: 8px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
            }*/
            button.btnDangNhap {
                width: 100%;
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
     <div class="login-container">
        <span class="close-btn" onclick="closePopup()">×</span>
            <h3 style="text-align:center;">Đăng nhập</h3>
            <form action="DangNhap" method="Post">
                <label for="Username">Tài khoản</label>
                <input type="text" id="Username" name="Username" required>

                <label for="Password">Mật khẩu</label>
                <input type="password" id="Password" name="Password" required>

                <button type="submit" id="btnDangNhap">Đăng nhập</button>
            </form>
        </div>

<!--        <script>
            $("#btnDangNhap").click(function () {
                let username = $("#Username").val().trim();
                let password = $("#Password").val().trim();

                if (username === "" || password === "") {
                    alert("Vui lòng nhập đầy đủ thông tin!");
                    return;
                }

                $.ajax({
                    url: "${pageContext.request.contextPath}/DangNhap",
                    type: "POST",
                    data: {
                        Username: username,
                        Password: password
                    },
                    success: function (response) {
                        if (response.trim() === "success") {
                            alert("Đăng nhập thành công!");
                            window.location.href = "${pageContext.request.contextPath}/Home";
                        } else {
                            alert("Sai tài khoản hoặc mật khẩu!");
                        }
                    },
                    error: function () {
                        alert("Lỗi kết nối đến server!");
                    }
                });
            });
        </script>-->
    </body>
</html>
