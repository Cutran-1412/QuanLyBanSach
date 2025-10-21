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
        /* RESET & FONT */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f4f6f8;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* ===== HEADER ===== */
        header {
            position: sticky;
            top: 0;
            background: linear-gradient(135deg, #2e8b57, #4CAF50);
            color: white;
            text-align: center;
            padding: 18px;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
            z-index: 1000;
            letter-spacing: 0.5px;
        }

        /* ===== LAYOUT ===== */
        section {
            display: flex;
            flex: 1;
            height: calc(100vh - 70px);
/*            overflow: hidden;*/
        }

        /* ===== SIDEBAR ===== */
        nav {
            display: flex;
            flex-direction: column;
            justify-content: space-evenly; 
            width: 250px;
            background-color: #fff;
            border-right: 1px solid #ddd;
            box-shadow: 2px 0 8px rgba(0,0,0,0.05);
            padding: 20px 15px;
            
            overflow-x: hidden;   /* Ẩn thanh cuộn ngang */
        }

        nav h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #2e8b57;
            text-align: center;
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
            transition: all 0.3s ease;
            text-align: left;
            width: 100%;
            margin-bottom: 8px;
        }

        nav button:hover {
            background-color: #45a049;
            transform: translateX(5px);
        }

        /* Submenu */
        .submenu {
            display: none;
            margin-left: 10px;
            flex-direction: column;
            margin-top: 5px;
        }

        .submenu button {
            background-color: #66bb6a;
            font-size: 15px;
        }

        .submenu button:hover {
            background-color: #57a65e;
        }

        /* ===== CONTENT ===== */
        #content {
            flex: 1;
            width: 1200px;  /* Chiều rộng tối đa */
            height: 670px; /* Chiều cao tối đa */

            background-color: #fff;
            margin: 25px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow-y: auto;
            animation: fadeIn 0.4s ease;
        }

        #content h3 {
            color: #2e8b57;
            text-align: center;
            margin-top: 40px;
            font-size: 26px;
        }

        /* ===== ANIMATION ===== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            section {
                flex-direction: column;
            }
            nav {
                width: 100%;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
            }
            nav button {
                width: auto;
                text-align: center;
                padding: 10px 15px;
                margin: 5px;
            }
            .submenu {
                display: none;
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
                    <button onclick="loadPage('AdminTheLoai')">Quản lý thể loại</button>
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
