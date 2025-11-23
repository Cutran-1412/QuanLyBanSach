<%-- 
    Document   : ThongTinCaNhan
    Created on : Nov 19, 2025, 9:08:43 AM
    Author     : Osiris
--%>

<%@page import="Models.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            NguoiDung nd = (NguoiDung)request.getAttribute("NguoiDung");
        %>
    </body>
</html>
