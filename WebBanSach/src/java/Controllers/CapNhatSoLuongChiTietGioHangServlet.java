/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.ChiTietGioHangDAO;
import DAO.GioHangDAO;
import Models.ChiTietGioHang;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Osiris
 */
@WebServlet(name="CapNhatSoLuongChiTietGioHang", urlPatterns={"/CapNhatSoLuongChiTietGioHang"})

public class CapNhatSoLuongChiTietGioHangServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CapNhatSoLuongChiTietGioHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CapNhatSoLuongChiTietGioHangServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            String maChiTiet = request.getParameter("maChiTiet");
            String action = request.getParameter("action");

            if (maChiTiet == null || maChiTiet.isEmpty() || 
                (!"tang".equals(action) && !"giam".equals(action))) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"error\":\"Dữ liệu không hợp lệ\"}");
                return;
            }

            ChiTietGioHangDAO ctDAO = new ChiTietGioHangDAO();
            GioHangDAO ghDAO = new GioHangDAO();

            ChiTietGioHang ct = ctDAO.getByMa(maChiTiet);

            if (ct == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"error\":\"Chi tiết giỏ hàng không tồn tại\"}");
                return;
            }

            int soLuongMoi = ct.getSoLuong();
            if ("tang".equals(action)) {
                soLuongMoi++;
            } else if ("giam".equals(action) && soLuongMoi > 1) {
                soLuongMoi--;
            }

            ct.setSoLuong(soLuongMoi);
            ctDAO.Update(ct);

            double thanhTienMoi = soLuongMoi * ct.getSach().getGia();
            BigDecimal tongCong = ghDAO.tinhTongTien(ct.getMaGioHang());

            // Tạo JSON thủ công
            String json = String.format(
                "{\"soLuongMoi\":%d,\"thanhTienMoi\":\"%,.0f\",\"tongCong\":\"%,.0f\"}",
                soLuongMoi, thanhTienMoi, tongCong
            );

            out.write(json);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"error\":\"Lỗi server khi cập nhật giỏ hàng\"}");
        } finally {
            out.close();
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
