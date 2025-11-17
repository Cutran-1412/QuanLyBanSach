<%-- 
    Document   : DonHang
    Created on : Nov 17, 2025, 5:05:03 PM
    Author     : Osiris
--%>


<%@page import="Models.ChiTietGioHang"%>
<%@page import="java.util.List"%>
<%@page import="Models.GioHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <style>
        .cart-container {
            width: 1100px;
            margin: 40px auto;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.15);
        }
        table { width: 100%; border-collapse: collapse; }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: center;
        }
        td {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            vertical-align: middle;
        }
        tr:hover { background-color: #f9f9f9; }
        img {
            width: 80px;
            height: 100px;
            object-fit: cover;
            border-radius: 6px;
        }
        .qty-btn {
            padding: 4px 10px;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.2s;
        }
        .qty-btn:hover { background-color: #0056b3; }
        .qty-input {
            width: 40px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin: 0 5px;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .delete-btn:hover { background-color: #a71d2a; }
        .total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }
        .checkout-area {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 25px;
        }
        .btn-primary, .btn-outline {
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 15px;
            transition: 0.2s;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
            color: white;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
        .btn-outline {
            background: white;
            border: 2px solid #4a90e2;
            color: #4a90e2;
        }
        .btn-outline:hover {
            background: #4a90e2;
            color: white;
        }
    </style>
</head>
<body>

<%
    GioHang gh = (GioHang) request.getAttribute("GioHang");
    List<ChiTietGioHang> list = (List<ChiTietGioHang>) request.getAttribute("ListChiTietGioHang");
%>

<div class="cart-container">
    <h2>🛒 Giỏ hàng: <%= gh.getMaGioHang() %></h2>

    <table>
        <thead>
            <tr>
                <th>Ảnh</th>
                <th>Tên sách</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th>Hành động</th>
            </tr>
        </thead>

        <tbody>
        <%
            if (list == null || list.isEmpty()) {
        %>
            <tr>
                <td colspan="6" style="padding: 20px; font-size: 18px; color: #777;">
                    🛒 Giỏ hàng của bạn đang trống.
                </td>
            </tr>
        <%
            } else {
                double tongTien = 0;
                for (ChiTietGioHang ct : list) {
                    double thanhTien = ct.getSoLuong() * ct.getSach().getGia();
                    tongTien += thanhTien;
        %>
            <tr>
                <td><img src="<%= ct.getSach().getAnh() %>" alt=""></td>
                <td><%= ct.getSach().getTenSach() %></td>
                <td><%= String.format("%,.0f", ct.getSach().getGia()) %> VNĐ</td>

                <td>
                    <div style="display: flex; align-items: center; gap: 6px;">

                        <button class="btn-minus"
                                style="width: 32px; height: 32px; border-radius: 6px; border: 1px solid #ccc; background: #f3f3f3; cursor: pointer; font-size: 18px;"
                                data-mact="<%= ct.getMaChiTiet() %>"
                                data-magiohang="<%= ct.getMaGioHang() %>"
                                data-masach="<%= ct.getMaSach() %>">−</button>

                        <input type="text" class="sl"
                               id="sl-<%= ct.getMaSach() %>"
                               value="<%= ct.getSoLuong() %>"
                               readonly
                               style="width: 45px; height: 32px; text-align: center; border: 1px solid #ccc; border-radius: 6px; font-size: 15px; background: #fff;">

                        <button class="btn-plus"
                                style="width: 32px; height: 32px; border-radius: 6px; border: 1px solid #ccc; background: #f3f3f3; cursor: pointer; font-size: 18px;"
                                data-mact="<%= ct.getMaChiTiet() %>"
                                data-magiohang="<%= ct.getMaGioHang() %>"
                                data-masach="<%= ct.getMaSach() %>">+</button>

                    </div>
                </td>

                <td id="thanhTien-<%= ct.getMaChiTiet() %>">
                    <%= String.format("%,.0f", thanhTien) %> VNĐ
                </td>

                <td>
                    <form action="ThemGioHang" method="post">
                        <input type="hidden" name="maChiTiet" value="<%= ct.getMaChiTiet() %>">
                        <button type="submit" class="delete-btn">❌ Xóa</button>
                    </form>
                </td>
            </tr>
        <%
                } // end for
        %>
        </tbody>
    </table>

    <div class="total">
        Tổng cộng:
        <span id="tongCong">
            <%= String.format("%,.0f", tongTien) %> VNĐ
        </span>
    </div>

    <%
        } // end else
    %>

    <div class="checkout-area">
        <button type="button" class="btn-outline" onclick="location.href='Home'">
            ← Tiếp tục mua sách
        </button>

        <button type="button" class="btn-primary"
                onclick="openPopup('DatHang?MaGioHang=<%=gh.getMaGioHang() %>')"
                <%= (list == null || list.isEmpty()) ? "disabled" : "" %>>
            🛒 Đặt hàng
        </button>
    </div>

</div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).on('click', '.btn-plus, .btn-minus', function () {

            let maChiTiet = $(this).data("mact");
            let maGioHang = $(this).data("magiohang");
            let maSach = $(this).data("masach");

            let input = $("#sl-" + maSach);
            let sl = parseInt(input.val());

            if ($(this).hasClass("btn-plus")) sl++;
            if ($(this).hasClass("btn-minus") && sl > 1) sl--;

            input.val(sl);

            $.ajax({
                url: "CapNhatSoLuongChiTietGioHang",
                type: "POST",
                data: {
                    maChiTiet: maChiTiet,
                    maGioHang: maGioHang,
                    maSach: maSach,
                    soLuong: sl
                },
                success: function (res) {
                    $("#thanhTien-" + maChiTiet).html(formatCurrency(res.thanhTien) + " VNĐ");
                    $("#tongCong").html(formatCurrency(res.tongTien) + " VNĐ");
                }
            });
        });

        function formatCurrency(num) {
            return num.toLocaleString("vi-VN");
        }
    </script>
</body>
</html>
