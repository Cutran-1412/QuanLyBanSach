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
        <link href="${pageContext.request.contextPath}/Assets/CSS/Button.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/Assets/CSS/Table.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/Assets/CSS/Image.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/Assets/CSS/Popup.css" rel="stylesheet" type="text/css"/>
        <style>
            .radio-group {
                display: flex;
                align-items: center;
                gap: 15px;
                background: #f8f9fa;
                padding: 8px 15px;
                border-radius: 10px;
                border: 1px solid #d0d7de;
            }

            .custom-radio {
                position: relative;
                padding-left: 28px;
                cursor: pointer;
                font-size: 15px;
                color: #333;
                user-select: none;
                display: flex;
                align-items: center;
            }

            /* Ẩn radio mặc định */
            .custom-radio input {
                position: absolute;
                opacity: 0;
                cursor: pointer;
            }

            /* Tạo hình tròn custom */
            .radio-mark {
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                height: 18px;
                width: 18px;
                background-color: #fff;
                border: 2px solid #007bff;
                border-radius: 50%;
                transition: all 0.2s ease;
            }

            /* Hiệu ứng khi hover */
            .custom-radio:hover .radio-mark {
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            }

            /* Khi được chọn */
            .custom-radio input:checked ~ .radio-mark {
                background-color: #007bff;
                border-color: #007bff;
            }

            .custom-radio .radio-mark::after {
                content: "";
                position: absolute;
                display: none;
            }

            .custom-radio input:checked ~ .radio-mark::after {
                display: block;
            }

            /* Dấu chấm bên trong */
            .custom-radio .radio-mark::after {
                top: 4px;
                left: 4px;
                width: 6px;
                height: 6px;
                border-radius: 50%;
                background: white;
            }
            .search-bar {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 15px;
                margin: 20px 0;
                flex-wrap: wrap; /* giúp tự xuống dòng nếu nhỏ */
            }
        </style>
    </head>
    <body>
        <div style="text-align: center" class="search-bar"> 
            <button class="btn-add" onclick="openPopup('Admin/Pages/ThemTheLoai.jsp')">Thêm</button>

            <form id="searchForm" onsubmit="return false;" style="display:flex; align-items:center; gap:15px; justify-content:center;">
                <input type="text" name="keyword" id="keyword" placeholder="Nhập từ khóa..." 
                       style="width: 300px; height: 40px; font-size: 16px; padding: 5px;">

                <div class="radio-group">
                    <label class="custom-radio">
                        <input type="radio" name="searchType" value="ma" checked>
                        <span class="radio-mark"></span>
                        Tìm theo Mã
                    </label>
                    <label class="custom-radio">
                        <input type="radio" name="searchType" value="ten">
                        <span class="radio-mark"></span>
                        Tìm theo Tên
                    </label>
                </div>

                <button type="button" class="btn-search" onclick="searchTheLoai()">Tìm kiếm</button>
            </form>
        </div>
        <div id="popup" class="popup">
            <div class="popup-content">
                <span class="close" onclick="closePopup()">&times;</span>
                <iframe id="popupFrame" src="" frameborder="0"></iframe>
            </div>
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
                                    <button class="btn-edit" onclick="openPopup('AdminSuaTheLoai?MaTheLoai=<%= tl.getMaTheLoai() %>')">Sửa</button>
                                    <button class="btn-delete" onclick="openPopup('AdminXoaTheLoai?MaTheLoai=<%= tl.getMaTheLoai() %>')">Xóa</button>
                                </div>
                            </td>
                        </tr>
                    <%}
                }
            %>
        </table>
        <script>
            function openPopup(url) {
                const popup = document.getElementById("popup");
                const frame = document.getElementById("popupFrame");
                frame.src = url;
                popup.style.display = "flex";
            }

            function closePopup() {
                document.getElementById("popup").style.display = "none";
                document.getElementById("popupFrame").src = "";
            }
            function searchTheLoai() {
                const keyword = $("#keyword").val();
                const searchType = $("input[name='searchType']:checked").val();

                $.ajax({
                    url: "AdminTimKiem", // servlet xử lý tìm kiếm
                    method: "GET",
                    data: { keyword: keyword, searchType: searchType },
                    success: function (response) {
                        // Lấy lại phần table từ servlet trả về (chỉ phần nội dung bảng)
                        $("#content").html(response);
                    },
                    error: function () {
                        alert("Lỗi khi tìm kiếm thể loại!");
                    }
                });
            }
        </script>
    </body>
</html>
