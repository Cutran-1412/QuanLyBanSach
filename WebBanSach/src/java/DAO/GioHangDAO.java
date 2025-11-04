/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.ChiTietGioHang;
import Models.DonHang;
import Models.GioHang;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class GioHangDAO {
    public List<GioHang> getData() {
        List<GioHang> list = new ArrayList<>();
        String sql = "SELECT * FROM GioHang";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            
            while (rs.next()) {
                GioHang gh = new GioHang(
                        rs.getString("MaGioHang"),
                        rs.getString("MaNguoiDung"),
                        rs.getDate("NgayTao")
                );
                list.add(gh);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // Lấy đơn hàng theo mã
    public GioHang getById(String maGioHang) {
        String sql = "SELECT * FROM GioHang WHERE MaGioHang=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, maGioHang);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new GioHang(
                        rs.getString("MaGioHang"),
                        rs.getString("MaNguoiDung"),
                        rs.getDate("NgayTao")
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void Insert(GioHang gh) {
        String sql = "INSERT INTO GioHang (`MaGioHang`, `MaNguoiDung`, `NgayTao`) VALUES (?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, gh.getMaGioHang());
            ps.setString(2, gh.getMaNguoiDung());
            ps.setDate(3,gh.getNgayTao());
            ps.executeUpdate();
            System.out.println("Thêm đơn hàng thành công!");
        } catch (Exception e) {
        }
    }

    // Cập nhật đơn hàng
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

    // Xóa đơn hàng
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
     public GioHang getGioHangByNguoiDung(String maNguoiDung) {
        String sql = "SELECT * FROM GioHang WHERE MaNguoiDung = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, maNguoiDung);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                GioHang gh = new GioHang();
                gh.setMaGioHang(rs.getString("MaGioHang"));
                gh.setMaNguoiDung(rs.getString("MaNguoiDung"));
                gh.setNgayTao(rs.getDate("NgayTao"));
                return gh;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public String getMa() {
        String prefix = "GH";
        String sql = "SELECT MaGioHang FROM GioHang ORDER BY MaGioHang DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                String lastId = rs.getString("MaGioHang"); // VD: GH005
                int number = Integer.parseInt(lastId.substring(2)); // lấy 5
                return prefix + String.format("%02d", number + 1); // GH006
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Nếu chưa có bản ghi nào thì trả về mã đầu tiên
        return prefix + "01";
    }
    public BigDecimal tinhTongTien(String maGioHang) {
        BigDecimal tong = BigDecimal.ZERO;
        ChiTietGioHangDAO ctDAO = new ChiTietGioHangDAO();
        List<ChiTietGioHang> list = ctDAO.getByMaGioHang(maGioHang);
        if (list != null) {
            for (ChiTietGioHang ct : list) {
                BigDecimal thanhTien = BigDecimal.valueOf(ct.getSach().getGia())
                                            .multiply(BigDecimal.valueOf(ct.getSoLuong()));
                tong = tong.add(thanhTien);
            }
        }
        return tong;
    }
}
