    <%-- 
        Document   : DangNhap
        Created on : Oct 19, 2025, 8:08:55 PM
        Author     : Windows
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body>
            <form action="${pageContext.request.contextPath}/DangNhap" method="Post">
                <label>Tài khoản</label>
                <input type="text" id="Username" name="Username" required><br>
                <label>Mật khẩu</label>
                <input type="text" id="Password" name="Password" required><br>
                <button type="submit">Đăng nhập</button>
            </form>
            <script>
            $("#btnDangNhap").click(function () {
                $.ajax({
                    url: "../DangNhap",
                    method: "POST",
                    data: {
                        taikhoan: $("#taikhoan").val(),
                        matkhau: $("#matkhau").val()
                    },
                    success: function (response) {
                        if (response.status === "success") {
                            showPopup(response.message, "success");
                            setTimeout(() => {
                                window.location.href = "../Home";
                            }, 1000);
                        } else {
                            showPopup(response.message, "error");
                        }
                    },
                    error: function () {
                        showPopup("Lỗi kết nối tới server!", "error");
                    }
                });
            });
            </script>
        </body>

    </html>
