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
                        rs.getString("DiaChiNhanHang"),
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
                        rs.getString("DiaChiNhanHang"),
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
        String sql = "INSERT INTO donhang (MaDonHang, MaNguoiDung, DiaChiNhanHang , NgayDat, TrangThai, TongTien) VALUES (?,?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, dh.getMaDonHang());
            ps.setString(2, dh.getMaNguoiDung());
            ps.setString(3,dh.getDiaChiNhanHang());
            ps.setDate(4, dh.getNgayDat());
            ps.setString(5, dh.getTrangThai());
            ps.setDouble(6, dh.getTongTien());
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
    public List<DonHang> GetByMaNguoiDung(String ma){
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang WHERE MaNguoiDung = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ma);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DonHang dh = new DonHang(
                        rs.getString("MaDonHang"),
                        rs.getString("MaNguoiDung"),
                        rs.getString("DiaChiNhanHang"),
                        rs.getDate("NgayDat"),
                        rs.getString("TrangThai"),
                        rs.getDouble("TongTien")
                );
                list.add(dh);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(list.isEmpty()){
            return  null;
        }
        return list;
    }
    public String generateMaDonHang() {
        String sql = "SELECT MaDonHang FROM donhang ORDER BY MaDonHang DESC LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) {
                String lastMa = rs.getString(1);
                int num = Integer.parseInt(lastMa.substring(2));
                num++;
                return String.format("DH%04d", num);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "DH0001";
    }
}
