<%-- 
    Document   : DonHang
    Created on : Nov 18, 2025, 11:21:36 AM
    Author     : Osiris
--%>

<%@page import="Models.ChiTietDonHang"%>
<%@page import="Models.DonHang"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>

    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        button { padding: 6px 14px; background: #007bff; color: white; border: none;
                 border-radius: 5px; cursor: pointer; }
        button:hover { background: #0056b3; }
        .detail-box table { background: #fff; border: 1px solid #aaa; width: 60%; margin-top: 5px; }
        .header-title { font-size: 26px; margin-top: 10px; margin-bottom: 20px; text-align: center; }
        .status-filter {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            background-color: #fff;
            transition: all 0.3s ease;
            cursor: pointer;
            min-width: 160px;
        }
        .status-filter:hover {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.5);
        }

        .status-filter:focus {
            outline: none;
            border-color: #0056b3;
            box-shadow: 0 0 8px rgba(0,86,179,0.5);
        }
        label {
            font-size: 16px;
            color: #333;
        }

        select.status-filter {
            margin-bottom: 15px;
        }
    </style>

</head>
<body>

<h2 class="header-title">Danh sách đơn hàng</h2>

<!-- Bộ lọc -->
<label for="trangThai" style="font-weight: bold; margin-right: 10px;">Lọc trạng thái:</label>
<select id="trangThai" onchange="filterStatus()" class="status-filter">
    <option value="all" <%= "all".equals(request.getAttribute("SelectedTrangThai")) ? "selected" : "" %>>Tất cả</option>
    <option value="Đã đặt hàng" <%= "Đã đặt hàng".equals(request.getAttribute("SelectedTrangThai")) ? "selected" : "" %>>Đã đặt hàng</option>
    <option value="Đang giao hàng" <%= "Đang giao hàng".equals(request.getAttribute("SelectedTrangThai")) ? "selected" : "" %>>Đang giao hàng</option>
    <option value="Đã nhận hàng" <%= "Đã nhận hàng".equals(request.getAttribute("SelectedTrangThai")) ? "selected" : "" %>>Đã nhận hàng</option>
</select>

<!-- Khu chứa bảng – AJAX sẽ thay đổi phần này -->
<div id="donHangContainer">

<%
    List<DonHang> list = (List<DonHang>) request.getAttribute("DonHangList");
    Map<String, List<ChiTietDonHang>> chitiet =
        (Map<String, List<ChiTietDonHang>>) request.getAttribute("ChiTietMap");

    if (list == null || list.isEmpty()) {
    
%>
        <h3 style="color:red; text-align:center;">Không có đơn hàng nào!</h3>
<% } else { %>

<table>
    <tr>
        <th>Mã đơn</th>
        <th>Ngày đặt</th>
        <th>Trạng thái</th>
        <th>Tổng tiền</th>
        <th>Người đặt</th>
        <th>Thao tác</th>
    </tr>

    <% for (DonHang dh : list) { %>

    <tr>
        <td><%= dh.getMaDonHang() %></td>
        <td><%= dh.getNgayDat() %></td>
        <td><%= dh.getTrangThai() %></td>
        <td><%= dh.getTongTien() %> VNĐ</td>
        <td><%= dh.getMaNguoiDung() %></td>
        <td>
            <button onclick="toggleDetail('<%= dh.getMaDonHang() %>')">Chi tiết</button>
            <% if("Đã đặt hàng".equals(dh.getTrangThai())) { %>
                <button onclick="giaoHang('<%= dh.getMaDonHang() %>', this)">Giao Hàng</button>
            <% } %>
        </td>
    </tr>

    <tr id="detail-<%= dh.getMaDonHang() %>" style="display:none;">
        <td colspan="6">
            <div class="detail-box">
                <table>
                    <tr>
                        <th>Mã sách</th>
                        <th>Số lượng</th>
                    </tr>

                    <%
                        List<ChiTietDonHang> ctList = chitiet.get(dh.getMaDonHang());
                        if (ctList != null && !ctList.isEmpty()) {
                            for (ChiTietDonHang ct : ctList) {
                    %>

                    <tr>
                        <td><%= ct.getMaSach() %></td>
                        <td><%= ct.getSoLuong() %></td>
                    </tr>

                    <%   }
                        } else { %>

                    <tr>
                        <td colspan="2" style="color:red;">Không có chi tiết</td>
                    </tr>

                    <% } %>
                </table>
            </div>
        </td>
    </tr>

    <% } %>
</table>

<% } %>

</div>

<!-- SCRIPT -->
    <script>
        function toggleDetail(id) {
            var r = document.getElementById("detail-" + id);
            r.style.display = (r.style.display === "none") ? "table-row" : "none";
        }

        function filterStatus() {
            var status = encodeURIComponent(document.getElementById("trangThai").value);

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "AdminDonHang?ajax=true&trangThai=" + status, true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {

                    // Tạo DOM ảo từ response
                    var tempDiv = document.createElement("div");
                    tempDiv.innerHTML = xhr.responseText;

                    // Lấy đúng phần donHangContainer
                    var newContent = tempDiv.querySelector("#donHangContainer").innerHTML;

                    // Cập nhật nội dung bảng
                    document.getElementById("donHangContainer").innerHTML = newContent;
                }
            };
            xhr.send();
        }
        function giaoHang(maDonHang, btn) {
            if(!confirm("Bạn có chắc muốn giao đơn hàng này?")) return;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "AdminDonHang", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if(xhr.readyState === 4 && xhr.status === 200){
                    var res = JSON.parse(xhr.responseText);
                    if(res.success){
                        alert("Cập nhật trạng thái thành công!");

                        // Cập nhật trạng thái trên bảng ngay lập tức
                        var row = btn.closest("tr");
                        row.querySelector("td:nth-child(3)").textContent = res.trangThai;

                        // Ẩn nút hoặc thay đổi tên nút nếu muốn
                        btn.style.display = "none"; // hoặc btn.textContent = "Đã giao";
                    } else {
                        alert("Cập nhật thất bại!");
                    }
                }
            };

            xhr.send("maDonHang=" + encodeURIComponent(maDonHang) + "&trangThai=Đang giao hàng");
        }
        </script>

</body>
</html>
