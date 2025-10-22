<%-- 
    Document   : SuaSach
    Created on : Oct 21, 2025, 1:56:55 PM
    Author     : Osiris
--%>

<%@page import="Models.TheLoai"%>
<%@page import="java.util.List"%>
<%@page import="Models.Sach"%>
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
            function previewImage(event) {
                const imgPreview = document.getElementById('preview');
                imgPreview.src = URL.createObjectURL(event.target.files[0]);
                imgPreview.style.display = 'block';
            }
        </script>
    </head>
    <body>
        <%
            Sach sach = (Sach) request.getAttribute("sach");
            List<TheLoai> listTheLoai = (List<TheLoai>) request.getAttribute("list");
        %>
        <h2>Sửa Thông Tin Sách</h2>
        <form action="AdminSuaSach" method="post" enctype="multipart/form-data">
            <input type="hidden" name="MaSach" value="<%=sach.getMaSach()%>">

            <label>Tên sách:</label>
            <input type="text" name="TenSach" value="<%=sach.getTenSach()%>" required>

            <label>Tác giả:</label>
            <input type="text" name="TacGia" value="<%=sach.getTacGia()%>" required>

            <label>Nhà xuất bản:</label>
            <input type="text" name="NhaXuatBan" value="<%=sach.getNhaXuatBan()%>" required>

            <label>Năm xuất bản:</label>
            <input type="number" name="NamXuatBan" value="<%=sach.getNamXuatBan()%>" required>

            <label>Giá (VNĐ):</label>
            <input type="number" step="0.01" name="Gia" value="<%=sach.getGia()%>" required>

            <label>Số lượng:</label>
            <input type="number" name="SoLuong" value="<%=sach.getSoLuong()%>" required>

            <label>Thể loại:</label>
            <select name="MaTheLoai" required>
                <option value="">-- Chọn thể loại --</option>
                <%
                    if (listTheLoai != null) {
                        for (TheLoai tl : listTheLoai) {
                            String selected = tl.getMaTheLoai().equals(sach.getMaTheLoai()) ? "selected" : "";
                %>
                    <option value="<%=tl.getMaTheLoai()%>" <%=selected%>><%=tl.getTenTheLoai()%></option>
                <%
                        }
                    }
                %>
            </select>

            <label>Mô tả:</label>
            <textarea name="MoTa" rows="4"><%=sach.getMoTa()%></textarea>

            <label>Ảnh bìa hiện tại:</label>
            <div class="preview">
                <img id="preview" src="<%=sach.getAnh()%>" alt="Ảnh bìa hiện tại">
            </div>
            <label>Chọn ảnh mới (nếu muốn thay):</label>
            <input type="file" name="Anh" accept="image/*" onchange="previewImage(event)">
            <button type="submit">Cập nhật</button>
        </form>
    </body>
</html>
