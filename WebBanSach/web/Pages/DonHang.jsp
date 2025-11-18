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
        body { font-family: Arial, sans-serif; background: #f5f5f5; margin:0; padding:20px; }
        .page-order { margin-bottom: 20px; }
        .order-box { background: #fff; padding: 15px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .order-info { display: flex; justify-content: space-between; flex-wrap: wrap; align-items: center; }
        .order-info div { margin-bottom: 8px; }
        .detail-btn { padding: 6px 14px; background: #008cba; color: white; border:none; border-radius:5px; cursor:pointer; margin-left:5px; }
        .detail-btn:hover { background:#0073a3; }
        .detail-table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        .detail-table th, .detail-table td { border: 1px solid #ccc; padding: 6px; text-align:center; }
        .detail-table th { background: #eee; }
        .status-filter { padding: 5px 10px; margin-bottom: 15px; border-radius:5px; border:1px solid #ccc; }
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
<div class="page-order">
<h2 class="title-box">Danh sách đơn hàng</h2>
<label for="trangThai" style="font-weight:bold;">Lọc trạng thái:</label>
<select id="trangThai" class="status-filter" onchange="filterStatus()">
    <option value="all">Tất cả</option>
    <option value="Đã đặt hàng">Đã đặt hàng</option>
    <option value="Đang giao hàng">Đang giao hàng</option>
    <option value="Đã nhận hàng">Đã nhận hàng</option>
</select>
</div>
<% for (DonHang dh : donhang) { %>
<div class="page-order">

<!-- KHÔNG CÒN KHUNG NGOÀI - CHỈ GIỮ order-box -->
<div class="order-box">

    <div class="order-info">
        <div>
            <strong>Đơn hàng:</strong> <%= dh.getMaDonHang() %> <br>
            Ngày đặt: <%= dh.getNgayDat() %> <br>
            Trạng thái: <span class="status-text"><%= dh.getTrangThai() %></span><br>
            Địa chỉ nhận hàng :<%= dh.getDiaChiNhanHang() %>
        </div>

        <div>
            <strong>Tổng tiền:</strong> <%= dh.getTongTien() %> VNĐ
        </div>

        <button class="detail-btn" onclick="toggleDetail('<%= dh.getMaDonHang() %>')">
            Xem chi tiết
        </button>

        <% if ("Đang giao hàng".equals(dh.getTrangThai())) { %>
            <button class="detail-btn" onclick="nhanHang('<%= dh.getMaDonHang() %>', this)">
                Nhận Hàng
            </button>
        <% } %>
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
        function filterStatus(){
            var selected = document.getElementById("trangThai").value;
            var orders = document.querySelectorAll("#donHangContainer .page-order");
            orders.forEach(function(order){
                var status = order.getAttribute("data-trangthai");
                if(selected==="all" || status===selected){
                    order.style.display = "block";
                } else {
                    order.style.display = "none";
                }
            });
        }
        function nhanHang(maDonHang, btn) {
            if (!confirm("Bạn đã nhận hàng?")) return;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "DonHang", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    try {
                        var res = JSON.parse(xhr.responseText);
                        if (res.success) {
                            // 1. Cập nhật trạng thái trong span
                            var orderBox = btn.closest(".order-box");
                            var statusSpan = orderBox.querySelector(".status-text");
                            statusSpan.textContent = res.trangThai;

                            // 2. Ẩn nút Nhận Hàng
                            btn.style.display = "none";
                        } else {
                            alert("Cập nhật thất bại!");
                        }
                    } catch (e) {
                        console.error("Response:", xhr.responseText);
                        alert("Lỗi phản hồi từ server!");
                    }
                }
            };

            xhr.send("maDonHang=" + encodeURIComponent(maDonHang));
        }
    </script>
</body>
</html>