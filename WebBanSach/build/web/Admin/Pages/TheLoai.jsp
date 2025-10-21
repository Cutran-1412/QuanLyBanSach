<%-- 
    Document   : TheLoai
    Created on : Oct 17, 2025, 8:49:58 AM
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
        <link href="${pageContext.request.contextPath}/Assets/CSS/Table.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/Assets/CSS/Button.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div style="text-align: center"> 
            <button class="btn-add" onclick="openPopup('InsertSach')">Thêm</button>
            <input type="text" placeholder="Nhập từ khóa..." style="width: 300px; height: 40px; font-size: 16px; padding: 5px;">
            <button class="btn-search">Tìm kiếm</button>
        </div>
        <table>
            <tr>
                <th>Mã thể loại</th>
                <th>Tên Thể loại</th>
                <th>Hành động</th>
            </tr>
            <%
                List<TheLoai> list = (List<TheLoai>) request.getAttribute("list");
                if(list!=null){
                    for(TheLoai tl : list){%>
                        <tr>
                            <td><%=tl.getMaTheLoai() %></td>
                            <td><%=tl.getTenTheLoai() %></td>
                            <td class="action-buttons">
                                <div>
                                    <button class="btn-edit">Sửa</button>
                                    <button class="btn-delete">Xóa</button>
                                    <button class="btn-detail"onclick="openPopup('AdminChiTietSach?ma=<%= tl.getMaTheLoai()%>')">Chi tiết</button>
                                </div>
                            </td>
                        </tr>
                    <%}
                }
            %>
        </table>
    </body>
</html>
