/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.util.List;
import java.util.ArrayList;
import Models.NguoiDung;
import java.sql.*;
/**
 *
 * @author Admin
 */
import java.util.logging.Level;
import java.util.logging.Logger;
public class NguoiDungDAO {
    public List<NguoiDung> getData(){
        List<NguoiDung> lnd = null;
        Connection conn = DBConnection.getConnection();
        if(conn != null){
            try {
                lnd = new ArrayList<>();
                String sql = "Select *From NguoiDung";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
                    NguoiDung nd = new NguoiDung(
                            rs.getString("MaNguoiDung"),
                            rs.getString("TaiKhoan"),
                            rs.getString("MatKhau"),
                            rs.getString("HoTen"),
                            rs.getString("Email"),
                            rs.getString("SoDienThoai"),
                            rs.getString("DiaChi"),
                            rs.getBoolean("VaiTro"));
                    lnd.add(nd);
                }
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lnd;
    }
    public void Insert(NguoiDung nd) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "INSERT INTO `nguoidung`(`MaNguoiDung`, `TaiKhoan`, `MatKhau`, `HoTen`, `Email`, `SoDienThoai`, `DiaChi`, `VaiTro`) VALUES (?,?,?,?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, nd.getMaNguoiDung());
                ps.setString(2, nd.getTaiKhoan());
                ps.setString(3, nd.getMatKhau());
                ps.setString(4, nd.getHoTen());
                ps.setString(5, nd.getEmail());
                ps.setString(6, nd.getSoDienThoai());
                ps.setString(7, nd.getDiaChi());
                ps.setBoolean(8, nd.isVaiTro());
                ps.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public void Update(NguoiDung nd) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "UPDATE NguoiDung SET TaiKhoan=?, MatKhau=?, HoTen=?, Email=?, SoDienThoai=?, DiaChi=?, VaiTro=? "
                           + "WHERE MaNguoiDung=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, nd.getTaiKhoan());
                ps.setString(2, nd.getMatKhau());
                ps.setString(3, nd.getHoTen());
                ps.setString(4, nd.getEmail());
                ps.setString(5, nd.getSoDienThoai());
                ps.setString(6, nd.getDiaChi());
                ps.setBoolean(7, nd.isVaiTro());
                ps.setString(8, nd.getMaNguoiDung());
                ps.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public void Delete(String maNguoiDung) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "DELETE FROM NguoiDung WHERE MaNguoiDung=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, maNguoiDung);
                ps.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public NguoiDung getById(String maNguoiDung) {
        NguoiDung nd = null;
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "SELECT * FROM NguoiDung WHERE MaNguoiDung = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, maNguoiDung);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    nd = new NguoiDung(
                            rs.getString("MaNguoiDung"),
                            rs.getString("TaiKhoan"),
                            rs.getString("MatKhau"),
                            rs.getString("HoTen"),
                            rs.getString("Email"),
                            rs.getString("SoDienThoai"),
                            rs.getString("DiaChi"),
                            rs.getBoolean("VaiTro")
                    );
                }
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return nd;
    }
    public NguoiDung SignIn(String taiKhoan, String matKhau) {
        NguoiDung nd = null;
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "SELECT * FROM NguoiDung WHERE TaiKhoan = ? AND MatKhau = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, taiKhoan);
                ps.setString(2, matKhau);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    nd = new NguoiDung(
                            rs.getString("MaNguoiDung"),
                            rs.getString("TaiKhoan"),
                            rs.getString("MatKhau"),
                            rs.getString("HoTen"),
                            rs.getString("Email"),
                            rs.getString("SoDienThoai"),
                            rs.getString("DiaChi"),
                            rs.getBoolean("VaiTro")
                    );
                }
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return nd;
    }
    public String getMa(){
        String newMaNguoiDung ="";
        String sql ="Select MaNguoiDung From NguoiDung Order By MaNguoiDung Desc Limit 1";
        Connection conn = DBConnection.getConnection();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            String prefix = "ND";
            newMaNguoiDung = prefix +"01";
            if(rs.next()){
                String lastMaNguoiDung = rs.getString("MaNguoiDung");
                String numberPart = lastMaNguoiDung.replaceAll("\\D", "");
                int number = Integer.parseInt(numberPart)+1;
                newMaNguoiDung = prefix + String.format("%02d", number);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return newMaNguoiDung;
    }
    public boolean CheckUser(String user) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "SELECT 1 FROM NguoiDung WHERE TaiKhoan = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user);

                ResultSet rs = ps.executeQuery();
                boolean exists = rs.next();

                conn.close();
                return exists;

            } catch (SQLException ex) {
                Logger.getLogger(NguoiDungDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
}
