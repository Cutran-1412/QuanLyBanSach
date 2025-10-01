/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.DonHang;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class DonHangDAO {
    public List<DonHang> getData() {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            
            while (rs.next()) {
                DonHang dh = new DonHang(
                        rs.getString("MaDonHang"),
                        rs.getString("MaNguoiDung"),
                        rs.getDate("NgayDat"),
                        rs.getString("TrangThai"),
                        rs.getDouble("TongTien")
                );
                list.add(dh);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public DonHang getById(String maDonHang) {
        String sql = "SELECT * FROM donhang WHERE MaDonHang=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, maDonHang);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new DonHang(
                        rs.getString("MaDonHang"),
                        rs.getString("MaNguoiDung"),
                        rs.getDate("NgayDat"),
                        rs.getString("TrangThai"),
                        rs.getDouble("TongTien")
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void Insert(DonHang dh) {
        String sql = "INSERT INTO donhang (MaDonHang, MaNguoiDung, NgayDat, TrangThai, TongTien) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, dh.getMaDonHang());
            ps.setString(2, dh.getMaNguoiDung());
            ps.setDate(3, dh.getNgayDat());
            ps.setString(4, dh.getTrangThai());
            ps.setDouble(5, dh.getTongTien());
            ps.executeUpdate();
            System.out.println("Thêm đơn hàng thành công!");
        } catch (Exception e) {
        }
    }
    public void Update(DonHang dh) {
        String sql = "UPDATE donhang SET MaNguoiDung=?, NgayDat=?, TrangThai=?, TongTien=? WHERE MaDonHang=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, dh.getMaNguoiDung());
            ps.setDate(2, dh.getNgayDat());
            ps.setString(3, dh.getTrangThai());
            ps.setDouble(4, dh.getTongTien());
            ps.setString(5, dh.getMaDonHang());
            ps.executeUpdate();
            System.out.println("Cập nhật đơn hàng thành công!");
        } catch (Exception e) {
        }
    }
    public void Delete(String maDonHang) {
        String sql = "DELETE FROM donhang WHERE MaDonHang=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, maDonHang);
            ps.executeUpdate();
            System.out.println("Xóa đơn hàng thành công!");
        } catch (Exception e) {
        }
    }
}
