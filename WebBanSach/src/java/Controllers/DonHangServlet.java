/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.ChiTietDonHangDAO;
import DAO.DonHangDAO;
import Models.ChiTietDonHang;
import Models.DonHang;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Osiris
 */
@WebServlet(name="DonHang", urlPatterns={"/DonHang"})
public class DonHangServlet extends HttpServlet {

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
            out.println("<title>Servlet DonHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DonHangServlet at 1" + request.getContextPath () + "</h1>");
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
         String trangThai = request.getParameter("trangThai");
        String maNguoiDung = request.getParameter("MaNguoiDung");
        if(trangThai == null || trangThai.isEmpty()) trangThai = "all";
        DonHangDAO dhDAO = new DonHangDAO();
        ChiTietDonHangDAO ctDAO = new ChiTietDonHangDAO();
        List<DonHang> listDonHang;
        if("all".equals(trangThai)){
            if(maNguoiDung != null && !maNguoiDung.isEmpty()){
                listDonHang = dhDAO.GetByMaNguoiDung(maNguoiDung);
            } else {
                listDonHang = dhDAO.getData();
            }
        } else {
            listDonHang = dhDAO.getByTrangThaiAndNguoiDung(trangThai, maNguoiDung);
        }

        Map<String, List<ChiTietDonHang>> mapCT = new HashMap<>();
        for(DonHang dh : listDonHang){
            mapCT.put(dh.getMaDonHang(), ctDAO.getChiTietByDon(dh.getMaDonHang()));
        }

        // Trả JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Map<String,Object> result = new HashMap<>();
        result.put("orders", listDonHang);
        result.put("details", mapCT);

//        String json = new Gson().toJson(result);
//        response.getWriter().write(json);
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
        String maDonHang = request.getParameter("maDonHang");
        DonHangDAO dhDAO = new DonHangDAO();
        DonHang dh = dhDAO.getById(maDonHang);
        boolean success = false;
        if (dh != null && "Đang giao hàng".equals(dh.getTrangThai())) {
            dh.setTrangThai("Đã nhận hàng");
            dhDAO.Update(dh);
            success = true;
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String json = "{\"success\":" + success + ", \"trangThai\":\"Đã nhận hàng\"}";
        response.getWriter().write(json);
        response.getWriter().flush();
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
