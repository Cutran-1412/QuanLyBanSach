<%-- 
    Document   : User
    Created on : Oct 15, 2025, 8:23:34 AM
    Author     : Windows
--%>

<%@page import="Models.NguoiDung"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            img {
                width: 60px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
            }

            a img:hover {
                transform: scale(1.2);
                transition: 0.3s;
            }

            h2 {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <Table>
            <tr>
                <th>Mã người dùng</th>
                <th>Họ và tên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Vai trò</th>
            </tr>
            <%
                List<NguoiDung> list = (List<NguoiDung>) request.getAttribute("list");;
                for(NguoiDung item : list){%>
                <tr>
                    <td><%=item.getMaNguoiDung() %></td>
                    <td><%=item.getHoTen() %></td>
                    <td><%=item.getEmail() %></td>
                    <td><%=item.getSoDienThoai() %></td>
                    <td><%=item.getDiaChi() %></td>
                    <td><%=item.isVaiTro()?"Quản trị viên":"Người dùng" %></td>
                </tr>
                <%}
            %>
        </Table>
    </body>
</html>
