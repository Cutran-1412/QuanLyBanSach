package Controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


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
@WebServlet(name="AdminDonHang", urlPatterns={"/AdminDonHang"})
public class AdminDonHangServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminDonHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDonHangServlet at " + request.getContextPath () + "</h1>");
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
        DonHangDAO dhDAO = new DonHangDAO();
        ChiTietDonHangDAO ctDAO = new ChiTietDonHangDAO();
        String trangThai = request.getParameter("trangThai");
        if (trangThai == null || trangThai.isEmpty()) {
            trangThai = "all";
        }
        List<DonHang> listDonHang;

        if ("all".equals(trangThai)) {
            listDonHang = dhDAO.getData();
        } else {
            listDonHang = dhDAO.getByTrangThai(trangThai);
        }

        Map<String, List<ChiTietDonHang>> mapCT = new HashMap<>();
        if (listDonHang != null) {
            for (DonHang dh : listDonHang) {
                List<ChiTietDonHang> ctList = ctDAO.getChiTietByDon(dh.getMaDonHang());
                mapCT.put(dh.getMaDonHang(), ctList);
            }
        }

        request.setAttribute("DonHangList", listDonHang);
        request.setAttribute("ChiTietMap", mapCT);
        request.setAttribute("SelectedTrangThai", trangThai);

        request.getRequestDispatcher("Admin/Pages/DonHang.jsp")
               .forward(request, response);
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
        String maDon = request.getParameter("maDonHang");
        DonHangDAO dhDAO = new DonHangDAO();
        DonHang dh = dhDAO.getById(maDon);
        dh.setTrangThai("Đang giao hàng");
        dhDAO.Update(dh);
        boolean success = true;

        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"success\":" + success + ", \"trangThai\":\"" + "Đang giao hàng" + "\"}");
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
