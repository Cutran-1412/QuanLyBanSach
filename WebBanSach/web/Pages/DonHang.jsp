<%-- 
    Document   : DonHang
    Created on : Nov 17, 2025, 5:05:03 PM
    Author     : Osiris
--%>

<%@page import="java.util.Map"%>
<%@page import="Models.ChiTietDonHang"%>
<%@page import="Models.DonHang"%>
<%@page import="java.util.List"%>
<%@page import="Models.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đơn hàng</title>

    <style>
        .page-order {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px 30px;
        }

        .page-order h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 26px;
        }

        .page-order .order-box {
            background: white;
            padding: 18px 20px;
            border-radius: 10px;
            margin-bottom: 18px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .page-order .order-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-bottom: 10px;
            font-size: 15px;
        }

        .page-order .detail-btn {
            padding: 7px 18px;
            background: #008cba;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .page-order .detail-btn:hover {
            background: #0073a3;
        }

        .page-order .detail-table {
            margin-top: 12px;
            width: 100%;
            border-collapse: collapse;
        }

        .page-order .detail-table th,
        .page-order .detail-table td {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .page-order .detail-table th {
            background: #eee;
        }
    </style>
    </style>
</head>

<body>

<%
    List<DonHang> donhang = (List<DonHang>) request.getAttribute("DonHang");
    Map<String, List<ChiTietDonHang>> chitiet =
        (Map<String, List<ChiTietDonHang>>) request.getAttribute("ChiTietDon");
%>

<h2>Danh sách đơn hàng</h2>

<% for (DonHang dh : donhang) { %>
<div class="page-order">

<!-- KHÔNG CÒN KHUNG NGOÀI - CHỈ GIỮ order-box -->
<div class="order-box">

    <div class="order-info">
        <div>
            <strong>Đơn hàng:</strong> <%= dh.getMaDonHang() %> <br>
            Ngày đặt: <%= dh.getNgayDat() %> <br>
            Trạng thái: <%= dh.getTrangThai() %>
        </div>

        <div>
            <strong>Tổng tiền:</strong> <%= dh.getTongTien() %> VNĐ
        </div>

        <button class="detail-btn" onclick="toggleDetail('<%= dh.getMaDonHang() %>')">
            Xem chi tiết
        </button>
    </div>

    <div id="ct-<%= dh.getMaDonHang() %>" style="display:none;">
        <table class="detail-table">
            <tr>
                <th>Mã sách</th>
                <th>Số lượng</th>
            </tr>

            <% for (ChiTietDonHang ct : chitiet.get(dh.getMaDonHang())) { %>
            <tr>
                <td><%= ct.getMaSach() %></td>
                <td><%= ct.getSoLuong() %></td>
            </tr>
            <% } %>
        </table>
    </div>

</div>
</div>
<% } %>

<script>
function toggleDetail(id) {
    var box = document.getElementById("ct-" + id);
    box.style.display = (box.style.display === "none" ? "block" : "none");
}
</script>

</body>
</html>