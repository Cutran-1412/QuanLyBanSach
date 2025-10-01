/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.*;
import Models.Sach;
import java.math.BigDecimal;
import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author Admin
 */
public class SachDAO {
    public List<Sach> getData() {
        List<Sach> list = new ArrayList<>();
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "SELECT * FROM Sach";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    Sach s = new Sach(
                            rs.getString("MaSach"),
                            rs.getString("TenSach"),
                            rs.getString("TacGia"),
                            rs.getString("NhaXuatBan"),
                            rs.getInt("NamXuatBan"),
                            rs.getDouble("Gia"),
                            rs.getInt("SoLuong"),
                            rs.getString("MoTa"),
                            rs.getString("Anh"),
                            rs.getString("MaTheLoai")
                    );
                    list.add(s);
                }
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return list;
    }
    public void Insert(Sach s) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "INSERT INTO sach(MaSach, TenSach, TacGia, NhaXuatBan, NamXuatBan, Gia, SoLuong, MoTa, Anh, MaTheLoai) VALUES (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, s.getMaSach());
                ps.setString(2, s.getTenSach());
                ps.setString(3, s.getTacGia());
                ps.setString(4, s.getNhaXuatBan());
                ps.setInt(5, s.getNamXuatBan());
                ps.setBigDecimal(6, BigDecimal.valueOf(s.getGia()));
                ps.setInt(7, s.getSoLuong());
                ps.setString(8, s.getMoTa());
                ps.setString(9, s.getAnh());
                ps.setString(10, s.getMaTheLoai());
                ps.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    public void Update(Sach s) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "UPDATE Sach SET TenSach=?, TacGia=?, NhaXuatBan=?, NamXuatBan=?, Gia=?, SoLuong=?, MoTa=?, Anh=?, MaTheLoai=? "
                        + "WHERE MaSach=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, s.getTenSach());
                ps.setString(2, s.getTacGia());
                ps.setString(3, s.getNhaXuatBan());
                ps.setInt(4, s.getNamXuatBan());
                ps.setDouble(5, s.getGia());
                ps.setInt(6, s.getSoLuong());
                ps.setString(7, s.getMoTa());
                ps.setString(8, s.getAnh());
                ps.setString(9, s.getMaTheLoai());
                ps.setString(10, s.getMaSach());
                ps.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    // Xóa sách
    public void Delete(String maSach) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "DELETE FROM Sach WHERE MaSach=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, maSach);
                ps.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    public Sach getById(String maSach) {
        Sach s = null;
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "SELECT * FROM Sach WHERE MaSach = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, maSach);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    s = new Sach(
                            rs.getString("MaSach"),
                            rs.getString("TenSach"),
                            rs.getString("TacGia"),
                            rs.getString("NhaXuatBan"),
                            rs.getInt("NamXuatBan"),
                            rs.getDouble("Gia"),
                            rs.getInt("SoLuong"),
                            rs.getString("MoTa"),
                            rs.getString("Anh"),
                            rs.getString("MaTheLoai")
                    );
                }
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return s;
    }
}
