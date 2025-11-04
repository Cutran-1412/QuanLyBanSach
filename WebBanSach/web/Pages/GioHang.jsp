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
        .back-btn {
            margin-top: 20px;
            display: inline-block;
            padding: 8px 18px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .back-btn:hover { background-color: #0056b3; }
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
                    <div class="quantity-control" data-id="<%= ct.getMaChiTiet() %>">
                        <button class="qty-btn minus">−</button>
                        <input type="text" value="<%= ct.getSoLuong() %>" class="qty-input" readonly>
                        <button class="qty-btn plus">+</button>
                    </div>
                </td>
                <td id="thanhTien-<%= ct.getMaChiTiet() %>"><%= String.format("%,.0f", thanhTien) %> VNĐ</td>
                <td>
                    <form action="XoaChiTietGioHang" method="post" style="display:inline;">
                        <input type="hidden" name="maChiTiet" value="<%= ct.getMaChiTiet() %>">
                        <button type="submit" class="delete-btn">❌ Xóa</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <div class="total">
        Tổng cộng: <span id="tongCong"><%= String.format("%,.0f", tongTien) %> VNĐ</span>
    </div>

    <a href="Home" class="back-btn">← Tiếp tục mua sách</a>
</div>

<script>
document.querySelectorAll('.qty-btn').forEach(btn => {
    btn.addEventListener('click', async (e) => {
        const parent = e.target.closest('.quantity-control');
        const maChiTiet = parent.dataset.id;
        const input = parent.querySelector('.qty-input');
        const action = e.target.classList.contains('plus') ? 'tang' : 'giam';

        try {
            const response = await fetch('<%= request.getContextPath() %>/CapNhatSoLuongChiTietGioHang', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: `maChiTiet=${maChiTiet}&action=${action}`
            });
            const result = await response.json();

            // Cập nhật lại trên giao diện
            input.value = result.soLuongMoi;
            document.querySelector(`#thanhTien-${maChiTiet}`).textContent = result.thanhTienMoi + " VNĐ";
            document.querySelector("#tongCong").textContent = result.tongCong + " VNĐ";
        } catch (err) {
//            console.error('Lỗi khi cập nhật số lượng:', err);
        }
    });
});
</script>
</body>
</html>
