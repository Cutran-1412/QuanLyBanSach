    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.ChiTietGioHang;
import Models.GioHang;
import Models.Sach;
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
    public ChiTietGioHang getByMa(String maGioHang){
        String sql = "SELECT * FROM chitietgiohang WHERE MaGioHang=?";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maGioHang);
            ResultSet rs = ps.executeQuery();
             if (rs.next()) {
                return new ChiTietGioHang(
                    rs.getString("MaChiTiet"),
                    rs.getString("MaGioHang"),
                    rs.getString("MaSach"),
                    rs.getInt("SoLuong")
                );
            }
            System.out.println("Cập nhật chi tiết giỏ hàng thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<ChiTietGioHang> getByMaGioHang(String maGioHang) {
        List<ChiTietGioHang> list = new ArrayList<>();
        String sql = """
            SELECT ct.*, s.TenSach, s.Gia, s.Anh
            FROM chitietgiohang ct
            JOIN sach s ON ct.MaSach = s.MaSach
            WHERE ct.MaGioHang = ?
        """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maGioHang); 
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
   
                ChiTietGioHang ct = new ChiTietGioHang(
                    rs.getString("MaChiTiet"),
                    rs.getString("MaGioHang"),
                    rs.getString("MaSach"),
                    rs.getInt("SoLuong")
                );
                Sach s = new Sach();
                s.setTenSach(rs.getString("TenSach"));
                s.setGia(rs.getDouble("Gia"));
                s.setAnh(rs.getString("Anh"));
                ct.setSach(s); 
                list.add(ct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public String getMa() {
        String newId = "CTGH0001";
        String sql = "SELECT MaChiTiet FROM chitietgiohang ORDER BY MaChiTiet DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) {
                String lastId = rs.getString("MaChiTiet");
                int number = Integer.parseInt(lastId.substring(4));
                number++; // tăng lên 1
                newId = String.format("CTGH%04d", number);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return newId;
    }
    public List<ChiTietGioHang> getAllByMaGioHang(String maGioHang) {
        List<ChiTietGioHang> list = new ArrayList<>();
        String sql = "SELECT * FROM chitietgiohang WHERE MaGioHang = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, maGioHang);
            ResultSet rs = ps.executeQuery();

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
        if (list.isEmpty()) {
            return null;
        }
        return list;
    }
    public double getDonGia(String maSach) {
        String sql = "SELECT Gia FROM sach WHERE MaSach = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, maSach);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getDouble("Gia");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public double getTongTien(String maGioHang) {
        String sql = """
            SELECT SUM(ct.SoLuong * s.Gia) AS TongTien
            FROM chitietgiohang ct
            JOIN sach s ON ct.MaSach = s.MaSach
            WHERE ct.MaGioHang = ?
        """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, maGioHang);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getDouble("TongTien");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public void updateSoLuong(String maChiTiet, int soLuong) {
        String sql = "UPDATE chitietgiohang SET SoLuong = ? WHERE MaChiTiet = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, soLuong);
            ps.setString(2, maChiTiet);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
