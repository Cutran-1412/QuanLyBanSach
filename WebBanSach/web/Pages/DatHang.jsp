<%-- 
    Document   : DatDonHang
    Created on : Nov 17, 2025, 5:51:58 PM
    Author     : Osiris
--%>

<%@page import="Models.DonHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác Nhận Đơn Hàng</title>

    <style>
        /* Lớp phủ mờ */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            font-family: Arial, sans-serif;
        }

        /* Khung popup */
        .popup-box {
            width: 550px;
            background: #fff;
            padding: 25px 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            animation: showPopup 0.25s ease-out;
        }

        @keyframes showPopup {
            from { opacity: 0; transform: scale(0.7); }
            to { opacity: 1; transform: scale(1); }
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
            display: block;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background: #f5f5f5;
        }

        .btn {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border-radius: 6px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .btn-confirm {
            background: #4CAF50;
            color: white;
        }

        .btn-cancel {
            background: #d9534f;
            color: white;
        }
    </style>

    <script>
        function closePopup() {
            window.history.back();
        }
    </script>
</head>

<body>

<%
    DonHang dh = (DonHang) request.getAttribute("DonHang");
    String magiohang = (String)request.getAttribute("MaGioHang");
%>

<div class="overlay">
    <div class="popup-box">
        <h2>Thông Tin Đơn Hàng</h2>
        <label>Mã Đơn Hàng:</label>
        <input type="text" value="<%= dh.getMaDonHang() %>" readonly>
        <label>Mã Người Dùng:</label>
        <input type="text" value="<%= dh.getMaNguoiDung() %>" readonly>
        <label>Ngày Đặt:</label>
        <input type="text" value="<%= dh.getNgayDat() %>" readonly>
        <label>Trạng Thái:</label>
        <input type="text" value="<%= dh.getTrangThai() %>" readonly>
        <label>Tổng Tiền:</label>
        <input type="text" value="<%= dh.getTongTien() %> VNĐ" readonly>
        <form action="DatHang" method="post">
            <input type="hidden" name="MaGioHang" value="<%= magiohang %>">    
            <input type="hidden" name="MaDonHang" value="<%= dh.getMaDonHang() %>">
            <input type="hidden" name="MaNguoiDung" value="<%= dh.getMaNguoiDung() %>">
            <input type="hidden" name="TrangThai" value="<%= dh.getTrangThai() %>">
            <input type="hidden" name="TongTien" value="<%= dh.getTongTien() %>">

            <label>Địa Chỉ Nhận Hàng:</label>
            <input type="text" name="DiaChiNhanHang"
                   value="<%= dh.getDiaChiNhanHang() == null ? "" : dh.getDiaChiNhanHang() %>"
                   placeholder="Nhập địa chỉ nhận hàng..."
                   required>

            <button type="submit" class="btn btn-confirm">XÁC NHẬN ĐẶT HÀNG</button>
            <button type="button" class="btn btn-cancel" onclick="closePopup()">HỦY</button>

        </form>

    </div>
</div>

</body>
</html>
