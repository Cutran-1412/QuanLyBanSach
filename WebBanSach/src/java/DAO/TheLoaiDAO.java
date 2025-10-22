/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.TheLoai;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class TheLoaiDAO {
    public List<TheLoai> getData() {
        List<TheLoai> list = new ArrayList<>();
        String sql = "SELECT * FROM theloai";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            
            while (rs.next()) {
                TheLoai tl = new TheLoai(
                        rs.getString("MaTheLoai"),
                        rs.getString("TenTheLoai")
                );
                list.add(tl);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }
    public TheLoai getById(String maTheLoai) {
        TheLoai tl = null;
        String sql = "SELECT * FROM theloai WHERE MaTheLoai=?";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, maTheLoai);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tl = new TheLoai(rs.getString("MaTheLoai"), rs.getString("TenTheLoai"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tl;
    }
    public void Insert(TheLoai theLoai) {
        String sql = "INSERT INTO theloai (MaTheLoai, TenTheLoai) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, theLoai.getMaTheLoai());
            ps.setString(2, theLoai.getTenTheLoai());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật thể loại
    public void Update(TheLoai theLoai) {
        String sql = "UPDATE theloai SET TenTheLoai=? WHERE MaTheLoai=?";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, theLoai.getTenTheLoai());
            ps.setString(2, theLoai.getMaTheLoai());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // Xóa thể loại
    public void Delete(String maTheLoai) {
        String sql = "DELETE FROM theloai WHERE MaTheLoai=?";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maTheLoai);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public List<TheLoai> searchByMa(String ma) {
        List<TheLoai> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM TheLoai WHERE MaTheLoai LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + ma + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TheLoai(rs.getString("MaTheLoai"), rs.getString("TenTheLoai")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<TheLoai> searchByTen(String ten) {
        List<TheLoai> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM TheLoai WHERE TenTheLoai LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + ten + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TheLoai(rs.getString("MaTheLoai"), rs.getString("TenTheLoai")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
