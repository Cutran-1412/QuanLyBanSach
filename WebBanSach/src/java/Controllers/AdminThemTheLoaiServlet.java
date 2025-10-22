/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.TheLoaiDAO;
import Models.TheLoai;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Osiris
 */
@WebServlet(name="AdminThemTheLoai", urlPatterns={"/AdminThemTheLoai"})
public class AdminThemTheLoaiServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminThemTheLoaiServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminThemTheLoaiServlet at " + request.getContextPath () + "</h1>");
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
        TheLoaiDAO tlDAO = new TheLoaiDAO();
        String matheloai = request.getParameter("MaTheLoai");
        String tenthelaoi = request.getParameter("TenTheLoai");
        TheLoai tl = new TheLoai(matheloai, tenthelaoi);
        TheLoai tlCheck = tlDAO.getById(matheloai);
        PrintWriter out = response.getWriter();
        if(tlCheck != null){
            out.println("<script>");
            out.println("alert('Mã thể loại đã tồn tại! Vui lòng nhập mã khác.');");
            out.println("history.back();");
            out.println("</script>");
            return;
        }
        tlDAO.Insert(tl);
        response.setContentType("text/html;charset=UTF-8");
        out.println("<script>");
        out.println("alert('Thêm thể loại thành công!');");
        out.println("window.parent.closePopup();");
        out.println("window.parent.location.reload();");
        out.println("</script>");
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
