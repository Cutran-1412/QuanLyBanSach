/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.SachDAO;
import DAO.TheLoaiDAO;
import Models.Sach;
import Models.TheLoai;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;

/**
 *
 * @author Osiris
 */
@WebServlet(name="AdminThemSach", urlPatterns={"/AdminThemSach"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 15    // 15 MB
)
public class AdminThemSachServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminThemSachServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminThemSachServlet at " + request.getContextPath () + "</h1>");
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
        TheLoaiDAO tldao = new TheLoaiDAO();
        List<TheLoai> list = tldao.getData();
        request.setAttribute("listtheloai", list);
        request.getRequestDispatcher("Admin/Pages/ThemSach.jsp").forward(request, response);
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
        String maSach = request.getParameter("MaSach");
        String tenSach = request.getParameter("TenSach");
        String tacGia = request.getParameter("TacGia");
        String nhaXuatBan = request.getParameter("NhaXuatBan");
        String NamXuatBan = request.getParameter("NamXuatBan");
        int namXuatBan =0;
        if(NamXuatBan!=null){
           namXuatBan = Integer.parseInt(NamXuatBan);
        }
        double gia = 0;
        String giastr = request.getParameter("Gia");
        if(giastr!= null){
            gia = Double.parseDouble(giastr);
        }
        String soluongstr = request.getParameter("SoLuong");
        int soLuong = 0;
        if(NamXuatBan!=null){
           soLuong = Integer.parseInt(soluongstr);
        }
        String moTa = request.getParameter("MoTa");
        String maTheLoai = request.getParameter("MaTheLoai");
        
        Part filePart = request.getPart("Anh");
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("Assets/Images");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        filePart.write(uploadPath + File.separator + fileName);
        String anhPath = "Assets/Images/"+fileName;
        
        Sach sach = new Sach(maSach, tenSach, tacGia, nhaXuatBan, namXuatBan, gia, soLuong, moTa, anhPath, maTheLoai);
        new SachDAO().Insert(sach);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('Thêm sách thành công!');");
        response.getWriter().println("window.par new SachDAO().Insert(sach);ent.closePopup();");  // Gọi hàm closePopup() ở trang cha
        response.getWriter().println("window.parent.location.reload();"); // Reload lại trang danh sách
        response.getWriter().println("</script>");
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
