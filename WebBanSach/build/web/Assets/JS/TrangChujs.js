/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function loadPage(url) {
$.ajax({    
    url: url,
    method: "GET",
    success: function (response) {
        $("#content").html(response);
    },
    error: function () {
        $("#content").html("<p style='color:red;'>Lỗi khi tải dữ liệu!</p>");
           }
        });
}
function openPopup(url) {
    $.ajax({
    url: url,
    method: "GET",
    success: function (response) {
        $("#popup-content").html(response);
        $("#popup").show();
    },
    error: function () {
        alert("Không thể tải trang!");
        }
    });
}
function closePopup() {
    $("#popup").hide();
}