<%-- 
    Document   : DangKi
    Created on : Oct 19, 2025, 8:09:14 PM
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/DangKy" method="Post">
            <label>Tài khoản</label>
            <input type="text" id="Username" name="Username" required><br>
            <label>Mật khẩu</label>
            <input type="text" id="Password" name="Password" required><br>
            <label>Họ tên</label>
            <input type="text" id="Hoten" name="Hoten" required><br>
            <label>Email</label>
            <input type="text" id="Email" name="Email" required><br>
            <label>Số điện thoại</label>
            <input type="text" id="Sodienthoai" name="Sodienthoai" required><br>
            <label>Địa chỉ</label>
            <input type="text" id="Diachi" name="Diachi" required><br>
            <button type="submit">Đăng nhập</button>
        </form>
    </body>
</html>
