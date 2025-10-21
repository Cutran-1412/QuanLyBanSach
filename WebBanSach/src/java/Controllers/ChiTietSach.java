/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.Sach;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.SachDAO;

/**
 *
 * @author THIS PC
 */
@WebServlet( urlPatterns = {"/chitietsach"})
public class ChiTietSach extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SachDAO sachDAO;

    @Override
    public void init() {
        sachDAO = new SachDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet ChiTietSach</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChiTietSach at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String maSach = request.getParameter("MaSach");

        // Kiểm tra có mã sách không
        if (maSach == null || maSach.trim().isEmpty()) {
    // Nếu không nhập mã
    request.setAttribute("thongbao", "Vui lòng nhập mã sách.");
    request.getRequestDispatcher("Pages/chitietsach.jsp").forward(request, response);
    return;
        }

        // Gọi DAO để lấy thông tin sách
        SachDAO sachDAO = new SachDAO();
        Sach sach = sachDAO.getById(maSach);

        // Nếu không tìm thấy sách
        if (sach == null) {
    // Không chuyển qua error.jsp, chỉ gửi thông báo sang JSP hiện tại
    request.setAttribute("thongbao", "Sách đã hết hoặc không tồn tại.");
    request.getRequestDispatcher("Pages/chitietsach.jsp").forward(request, response);
    return;
        }

        // Gửi dữ liệu sang JSP
        request.setAttribute("sach", sach);

        // Chuyển đến ChiTietSach.jsp trong thư mục /web
        RequestDispatcher rd = request.getRequestDispatcher("Pages/chitietsach.jsp");
        rd.forward(request, response);
        processRequest(request, response);
    }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
