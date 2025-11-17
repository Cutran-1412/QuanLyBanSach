/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.ChiTietDonHang;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class ChiTietDonHangDAO {
    public List<ChiTietDonHang> getAll() {
        List<ChiTietDonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM chitietdonhang";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                ChiTietDonHang ct = new ChiTietDonHang(
                        rs.getString("MaChiTiet"),
                        rs.getString("MaDonHang"),
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
    public void Insert(ChiTietDonHang ct) {
        String sql = "INSERT INTO chitietdonhang (MaChiTiet, MaDonHang, MaSach, SoLuong) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ct.getMaChiTiet());
            ps.setString(2, ct.getMaDonHang());
            ps.setString(3, ct.getMaSach());
            ps.setInt(4, ct.getSoLuong());
            ps.executeUpdate();
            System.out.println("Thêm chi tiết đơn hàng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void Update(ChiTietDonHang ct) {
        String sql = "UPDATE chitietdonhang SET MaDonHang=?, MaSach=?, SoLuong=? WHERE MaChiTiet=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ct.getMaDonHang());
            ps.setString(2, ct.getMaSach());
            ps.setInt(3, ct.getSoLuong());
            ps.setString(5, ct.getMaChiTiet());
            ps.executeUpdate();
            System.out.println("Cập nhật chi tiết đơn hàng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void Delete(String maChiTiet) {
        String sql = "DELETE FROM chitietdonhang WHERE MaChiTiet=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maChiTiet);
            ps.executeUpdate();
            System.out.println("Xóa chi tiết đơn hàng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ChiTietDonHang getByMa(String maChiTiet) {
        String sql = "SELECT * FROM chitietdonhang WHERE MaChiTiet = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maChiTiet);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ChiTietDonHang(
                            rs.getString("MaChiTiet"),
                            rs.getString("MaDonHang"),
                            rs.getString("MaSach"),
                            rs.getInt("SoLuong")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Không tìm thấy
    }
    public String getMaChiTietDonHang() {
        String newId = "CTDH0001"; 
        String sql = "SELECT MaChiTiet FROM chitietdonhang ORDER BY MaChiTiet DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) {
                String lastId = rs.getString("MaChiTiet");
                int number = Integer.parseInt(lastId.substring(4)); // tách số
                number++; 
                newId = String.format("CTDH%04d", number);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return newId;
    }
    public List<ChiTietDonHang> getChiTietByDon(String maDonHang) {
        List<ChiTietDonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM chitietdonhang WHERE MaDonHang = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, maDonHang);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ChiTietDonHang ct = new ChiTietDonHang(
                    rs.getString("MaChiTiet"),
                    rs.getString("MaDonHang"),
                    rs.getString("MaSach"),
                    rs.getInt("SoLuong")
                );
                list.add(ct);
            }
        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }
}
