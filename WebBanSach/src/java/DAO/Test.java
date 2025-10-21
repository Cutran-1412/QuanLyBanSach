/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.util.List;
import Models.*;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) {
        DonHangDAO dao = new DonHangDAO();
        DonHang dh1 = new DonHang("DH01", "ND01", Date.valueOf("2025-10-01"), "Chờ xử lý", 500000);
        DonHang dh2 = new DonHang("DH02", "ND02", Date.valueOf("2025-10-02"), "Đang giao", 300000);
        dao.Insert(dh1);
        dao.Insert(dh2);
    }
}
