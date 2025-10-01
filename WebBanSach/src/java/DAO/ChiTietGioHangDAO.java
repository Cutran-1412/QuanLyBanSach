    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.ChiTietGioHang;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class ChiTietGioHangDAO {
    public List<ChiTietGioHang> getAll() {
        List<ChiTietGioHang> list = new ArrayList<>();
        String sql = "SELECT * FROM chitietgiohang";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                ChiTietGioHang ct = new ChiTietGioHang(
                        rs.getString("MaChiTiet"),
                        rs.getString("MaGioHang"),
                        rs.getString("MaSach"),
                        rs.getInt("SoLuong")
                );
                list.add(ct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void Insert(ChiTietGioHang ct) {
        String sql = "INSERT INTO chitietgiohang (MaChiTiet, MaGioHang, MaSach, SoLuong) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ct.getMaChiTiet());
            ps.setString(2, ct.getMaGioHang());
            ps.setString(3, ct.getMaSach());
            ps.setInt(4, ct.getSoLuong());
            ps.executeUpdate();
            System.out.println("Thêm chi tiết giỏ hàng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Sửa
    public void Update(ChiTietGioHang ct) {
        String sql = "UPDATE chitietgiohang SET MaGioHang=?, MaSach=?, SoLuong=? WHERE MaChiTiet=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ct.getMaGioHang());
            ps.setString(2, ct.getMaSach());
            ps.setInt(3, ct.getSoLuong());
            ps.setString(4, ct.getMaChiTiet());
            ps.executeUpdate();
            System.out.println("Cập nhật chi tiết giỏ hàng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa
    public void Delete(String maChiTiet) {
        String sql = "DELETE FROM chitietgiohang WHERE MaChiTiet=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maChiTiet);
            ps.executeUpdate();
            System.out.println("Xóa chi tiết giỏ hàng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
