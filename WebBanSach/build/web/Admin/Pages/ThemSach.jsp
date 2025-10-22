<%-- 
    Document   : ThemSach
    Created on : Oct 15, 2025, 10:42:31 AM
    Author     : Windows
--%>

<%@page import="Models.TheLoai"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f3f7ff;
            }
            form {
                width: 90%;
                max-width: 800px;
                margin: 20px auto;
                background: #eef4ff;
                border-radius: 12px;
                padding: 25px 40px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            }
            h2 {
                text-align: center;
                color: #003366;
                margin-bottom: 20px;
            }
            .form-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 15px 25px;
            }
            label {
                display: block;
                font-weight: 600;
                color: #333;
                margin-bottom: 4px;
            }
            input, textarea, select {
                width: 100%;
                padding: 8px 10px;
                border-radius: 6px;
                border: 1px solid #ccc;
                background-color: white;
                box-sizing: border-box;
            }
            textarea {
                resize: none;
                height: 80px;
            }
            .full-width {
                grid-column: span 2;
            }
            button {
                display: block;
                width: 100%;
                margin-top: 20px;
                background: #007bff;
                color: white;
                font-weight: bold;
                border: none;
                padding: 10px 0;
                border-radius: 6px;
                cursor: pointer;
                transition: 0.3s;
            }
            button:hover {
                background: #0056b3;
            }


            .preview {
                text-align: center;
                margin-bottom: 15px;
            }

            .preview img {
                max-width: 200px;
                border-radius: 10px;
                border: 1px solid #ddd;
            }
        </style>
        <script>
            // Hiển thị ảnh xem trước
            function previewImage(event) {
                const imgPreview = document.getElementById('preview');
                imgPreview.src = URL.createObjectURL(event.target.files[0]);
                imgPreview.style.display = 'block';
            }
        </script>
    </head>
    <body>
        <%
            List<TheLoai> listTheLoai = (List<TheLoai>) request.getAttribute("listtheloai");
        %>
        <h2>Thêm Sách Mới</h2>
        <form action="AdminThemSach" method="post" enctype="multipart/form-data">
            <label>Mã sách:</label>
            <input type="text" name="MaSach" required>

            <label>Tên sách:</label>
            <input type="text" name="TenSach" required>

            <label>Tác giả:</label>
            <input type="text" name="TacGia" required>

            <label>Nhà xuất bản:</label>
            <input type="text" name="NhaXuatBan" required>

            <label>Năm xuất bản:</label>
            <input type="number" name="NamXuatBan" required>

            <label>Giá (VNĐ):</label>
            <input type="number" step="0.01" name="Gia" required>

            <label>Số lượng:</label>
            <input type="number" name="SoLuong" required>

            <label>Thể loại:</label>
                <select name="MaTheLoai" required>
                    <option value="">-- Chọn thể loại --</option>
                    <%
                        
                        if (listTheLoai != null) {
                            for (TheLoai tl : listTheLoai) {
                    %>
                        <option value="<%=tl.getMaTheLoai()%>"><%=tl.getTenTheLoai()%></option>
                    <%
                            }
                        }
                    %>
                </select>
            <label>Mô tả:</label>
            <textarea name="MoTa" rows="4" placeholder="Nhập mô tả ngắn..."></textarea>

            <label>Ảnh bìa:</label>
            <div class="preview">
                <img id="preview" style="display:none;" alt="Xem trước ảnh">
            </div>
            <input type="file" name="Anh" accept="image/*" onchange="previewImage(event)" required>
            <button type="submit">Lưu Sách</button>
        </form>
    </body>
</html>
