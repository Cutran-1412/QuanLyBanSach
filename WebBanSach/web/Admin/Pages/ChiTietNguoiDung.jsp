<%@page import="Models.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    NguoiDung nd = (NguoiDung) request.getAttribute("nd");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết người dùng</title>

    <style>
        .popup-container {
            padding: 20px 30px;
            font-family: Arial, sans-serif;
            background: #fff;
        }

        /* Tiêu đề lớn */
        .title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        /* Bố cục 2 cột avatar - thông tin */
        .content-box {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        /* Avatar */
        .avatar-box img {
            width: 200px;
            height: 200px;
            border-radius: 12px;
            object-fit: cover;
            border: 2px solid #ddd;
        }

        /* Khung thông tin */
        .info-box {
            flex: 1;
            background: #fafafa;
            padding: 20px 25px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .row {
            margin-bottom: 12px;
            font-size: 25px;
        }
        .label {
            font-weight: bold;
        }

        .close-btn {
            margin-top: 25px;
            padding: 10px 22px;
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 16px;
        }
        .close-btn:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>
    <div class="popup-container">

        <div class="title">Thông tin người dùng</div>

        <div class="content-box">
            <!-- Avatar -->
            <div class="avatar-box">
                <img src="Assets/Icon/avt.jpg" alt="Avatar">
                
            </div>

            <!-- Thông tin -->
            <div class="info-box">
                <div class="row"><span class="label">Mã người dùng:</span> <%= nd.getMaNguoiDung() %></div>
                <div class="row"><span class="label">Họ tên:</span> <%= nd.getHoTen() %></div>
                <div class="row"><span class="label">Email:</span> <%= nd.getEmail() %></div>
                <div class="row"><span class="label">Số điện thoại:</span> <%= nd.getSoDienThoai() %></div>
                <div class="row"><span class="label">Địa chỉ:</span> <%= nd.getDiaChi() %></div>
                <div class="row"><span class="label">Vai trò:</span> <%= nd.isVaiTro() ? "Quản trị viên" : "Người dùng" %></div>

                <button class="close-btn" onclick="window.parent.closePopup()">Đóng</button>
            </div>
        </div>
    </div>
</body>
</html>
