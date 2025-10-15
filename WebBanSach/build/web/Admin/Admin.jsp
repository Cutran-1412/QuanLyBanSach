<%-- 
    Document   : Admin
    Created on : Oct 11, 2025, 9:08:10 PM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>Admin</title>
        <style>
            /* Reset mặc định */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: "Segoe UI", Arial, sans-serif;
                background-color: #f5f6fa;
                color: #333;
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            /* Header cố định */
            header {
                position: sticky;
                top: 0;
                background: linear-gradient(135deg, #4CAF50, #2e8b57);
                color: white;
                padding: 15px;
                text-align: center;
                font-size: 22px;
                font-weight: bold;
                box-shadow: 0 2px 8px rgba(0,0,0,0.2);
                z-index: 10;
            }

            section {
                display: flex;
                flex: 1;
                width: 100%;
                overflow: hidden;
            }

            /* Menu bên trái */
            nav {
                display: flex;
                flex-direction: column;
                width: 220px;
                background-color: #fff;
                border-right: 1px solid #ddd;
                padding: 20px 15px;
                gap: 12px;
                box-shadow: 2px 0 8px rgba(0,0,0,0.05);
                transition: all 0.3s ease;
            }

            nav button {
                padding: 12px;
                border: none;
                background-color: #4CAF50;
                color: white;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 500;
                transition: background-color 0.3s, transform 0.2s;
                width: 100%;
                text-align: left;
            }

            nav button:hover {
                background-color: #45a049;
                transform: translateX(5px);
            }

            /* Nội dung bên phải */
            #content {
                flex: 1;
                background-color: #fdfdfd;
                padding: 30px;
                overflow-y: auto;
                border-radius: 12px;
                margin: 20px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                animation: fadeIn 0.4s ease;
            }

            #content h3 {
                text-align: center;
                color: #4CAF50;
                font-size: 24px;
                font-weight: 600;
                margin-top: 40px;
            }

            /* Hiệu ứng mượt */
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }

            /* Responsive (ẩn menu trên màn nhỏ) */
            @media (max-width: 768px) {
                section {
                    flex-direction: column;
                }
                nav {
                    flex-direction: row;
                    justify-content: space-around;
                    width: 100%;
                    box-shadow: none;
                    border-right: none;
                    border-bottom: 1px solid #ddd;
                }
                nav button {
                    font-size: 14px;
                    text-align: center;
                    padding: 10px;
                }
                #content {
                    margin: 10px;
                    padding: 20px;
                }
            }
        </style>
    </head>
    <body>
        <header>
            <div >
                <h1>Quyền admin</h1>
            </div>
        </header>
        <section>
            <div>
                <nav>
                    <button onclick="loadPage('Admin/Pages/Home.jsp')">Home</button>
                    <button onclick="loadPage('AdminNguoiDung')">Quản lý người dùng</button>
                    <button onclick="loadPage('AdminSach')">Quản lý sách</button>
                </nav>
            </div>
            <div>
                <div id="content">
                    <h3>Chào mừng bạn đến trang chính!</h3>
                </div>
            </div>
        </section>
        <script>
            function loadPage(url) {
                // Gọi servlet bằng AJAX
                $.ajax({
                    url: url,           // servlet mapping name
                    method: "GET",
                    success: function (response) {
                        $("#content").html(response);
                    },
                    error: function () {
                        $("#content").html("<p style='color:red;'>Lỗi khi tải dữ liệu!</p>");
                    }
                });
            }
        </script>
    </body>
</html>
