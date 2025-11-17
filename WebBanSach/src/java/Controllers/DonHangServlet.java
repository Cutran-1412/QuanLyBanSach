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
        String manguoidung = request.getParameter("MaNguoiDung");
        DonHangDAO dhDAO = new DonHangDAO();
        ChiTietDonHangDAO ctDAO = new ChiTietDonHangDAO();
        List<DonHang> listdonhang = dhDAO.GetByMaNguoiDung(manguoidung);
        Map<String, List<ChiTietDonHang>> mapCT = new HashMap<>();
        for (DonHang dh : listdonhang) {
            List<ChiTietDonHang> ctList = ctDAO.getChiTietByDon(dh.getMaDonHang());
            mapCT.put(dh.getMaDonHang(), ctList);
        }
        request.setAttribute("DonHang", listdonhang);
        request.setAttribute("ChiTietDon", mapCT);
        request.getRequestDispatcher("Pages/DonHang.jsp").forward(request, response);
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
        processRequest(request, response);
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
