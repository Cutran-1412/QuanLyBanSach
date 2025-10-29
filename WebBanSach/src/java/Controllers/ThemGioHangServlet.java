/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.ChiTietGioHangDAO;
import DAO.GioHangDAO;
import Models.ChiTietGioHang;
import Models.GioHang;
import Models.NguoiDung;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author Osiris
 */
@WebServlet(name="ThemGioHang", urlPatterns={"/ThemGioHang"})
public class ThemGioHangServlet extends HttpServlet {

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
            out.println("<title>Servlet ThemGioHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ThemGioHangServlet at123 " + request.getContextPath () + "</h1>");
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
        String masach = request.getParameter("MaSach");
        HomeServlet home = new HomeServlet();
        NguoiDung nd = home.nd;
        if(nd!=null){
            GioHangDAO ghDAO = new GioHangDAO();
            GioHang gh = ghDAO.getGioHangByNguoiDung(nd.getMaNguoiDung());
            if(gh == null){
                GioHang ghnew;
                ghnew = new GioHang(ghDAO.getMa(), nd.getMaNguoiDung(), Date.valueOf(LocalDate.now()));
                ghDAO.Insert(ghnew);
            }
            GioHang ghnew = ghDAO.getGioHangByNguoiDung(nd.getMaNguoiDung());
            ChiTietGioHangDAO ctghDAO = new ChiTietGioHangDAO();
            ChiTietGioHang ctgh = new ChiTietGioHang(ctghDAO.getMa(),ghnew.getMaGioHang() , masach, 1);
            ctghDAO.Insert(ctgh);
            new HomeServlet().doGet(request, response);
        }
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
