/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.ChiTietDonHangDAO;
import DAO.ChiTietGioHangDAO;
import DAO.DonHangDAO;
import DAO.GioHangDAO;
import Models.ChiTietDonHang;
import Models.ChiTietGioHang;
import java.sql.Date;
import Models.DonHang;
import Models.GioHang;
import Models.NguoiDung;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Osiris
 */
@WebServlet(name="DatHang", urlPatterns={"/DatHang"})
public class DatHangServlet extends HttpServlet {

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
            out.println("<title>Servlet DatHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatHangServlet at " + request.getContextPath () + "</h1>");
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
       String magiohang = request.getParameter("MaGioHang");
       DonHangDAO dhDAO = new DonHangDAO();
       GioHangDAO ghDAO = new GioHangDAO();
       HttpSession sesion  = request.getSession();
       NguoiDung nd = (NguoiDung)sesion.getAttribute("nd");
       GioHang gh = ghDAO.getById(magiohang);
       DonHang dhnew = new DonHang();
       
       dhnew.setMaDonHang(dhDAO.generateMaDonHang());
       dhnew.setMaNguoiDung(gh.getMaNguoiDung());
       dhnew.setDiaChiNhanHang(nd.getDiaChi());
       dhnew.setNgayDat(Date.valueOf(LocalDate.now()));
       dhnew.setTrangThai("Đã đặt hàng");
       dhnew.setTongTien(ghDAO.tinhTongTien(magiohang).doubleValue());
       request.setAttribute("DonHang", dhnew);
       request.setAttribute("MaGioHang", magiohang);
       request.getRequestDispatcher("Pages/DatHang.jsp").forward(request, response);
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
        
        String magiohang = request.getParameter("MaGioHang");
        String maDonHang = request.getParameter("MaDonHang");
        String maNguoiDung = request.getParameter("MaNguoiDung");
        String diaChi = request.getParameter("DiaChiNhanHang");
        Date ngayDat = Date.valueOf(LocalDate.now());
        String trangThai = request.getParameter("TrangThai");
        String tongTienStr = request.getParameter("TongTien");
        double tongTien = 0;
        if (tongTienStr != null && !tongTienStr.isEmpty()) {
            tongTien = Double.parseDouble(tongTienStr);
        }
        DonHang dhnew = new DonHang(maDonHang, maNguoiDung, diaChi, ngayDat, trangThai, tongTien);
        DonHangDAO dhDAO = new DonHangDAO();
        GioHangDAO ghDAO = new GioHangDAO();
        ChiTietGioHangDAO ctghDAO = new ChiTietGioHangDAO();
        ChiTietDonHangDAO ctdhDAO = new ChiTietDonHangDAO();
        List<ChiTietGioHang> listCTGH = ctghDAO.getAllByMaGioHang(magiohang);
        for(ChiTietGioHang item : listCTGH){
            ChiTietDonHang ctdhnew = new ChiTietDonHang();
            ctdhnew.setMaChiTiet(ctdhDAO.getMaChiTietDonHang());
            ctdhnew.setMaDonHang(maDonHang);
            ctdhnew.setMaSach(item.getMaSach());
            ctdhnew.setSoLuong(item.getSoLuong());
            ctdhDAO.Insert(ctdhnew);
            ctghDAO.Delete(item.getMaChiTiet());
        }
        ghDAO.Delete(magiohang);
        dhDAO.Insert(dhnew);
        ghDAO.getById(magiohang);
        
        new HomeServlet().doGet(request, response);
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
