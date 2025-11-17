/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.DonHang;
import java.sql.Date;

/**
 *
 * @author Osiris
 */
public class Test {
    public static void main(String[] args) {
         DonHangDAO dao = new DonHangDAO();

        // Tạo đơn hàng mẫu để test
        DonHang dh = new DonHang();
        dh.setMaDonHang("DH001");
        dh.setMaNguoiDung("ND001");
        dh.setDiaChiNhanHang("123 Nguyễn Trãi, Hà Nội");
        dh.setNgayDat(new Date(System.currentTimeMillis())); // Lấy ngày hiện tại
        dh.setTrangThai("Chờ Xác Nhận");
        dh.setTongTien(1500000);
        dao.Insert(dh);
        System.out.println("Test Insert hoàn tất!");
    }
}
