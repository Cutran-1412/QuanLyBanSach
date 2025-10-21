<%-- 
    Document   : Home
    Created on : Oct 11, 2025, 9:28:34 PM
    Author     : Windows
--%>

<%-- 
    Document   : dashboard
    Created on : Oct 14, 2025, 12:56:10 PM
    Author     : Windows
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bảng điều khiển</title>
    <style>
        .dashboard {
            padding: 20px;
            font-family: Arial, sans-serif;
        }
        .dashboard h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .stats {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 15px;
        }
        .card {
            width: 220px;
            height: 120px;
            background-color: #f1f1f1;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            text-align: center;
            padding: 15px;
            transition: 0.3s;
        }
        .card:hover {
            background-color: #d8eaff;
            transform: scale(1.05);
        }
        .card h3 {
            color: #007bff;
            margin: 0;
        }
        .card p {
            margin-top: 10px;
            font-size: 18px;
            color: #555;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <h2>BẢNG ĐIỀU KHIỂN</h2>

    <div class="stats">
        <div class="card">
            <h3>Tổng người dùng</h3>
            <p>120</p>
        </div>

        <div class="card">
            <h3>Sản phẩm hiện có</h3>
            <p>85</p>
        </div>

        <div class="card">
            <h3>Đơn hàng hôm nay</h3>
            <p>12</p>
        </div>

        <div class="card">
            <h3>Doanh thu</h3>
            <p>25.500.000₫</p>
        </div>
    </div>
</div>
</body>
</html>

