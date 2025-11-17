/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class ChiTietDonHang {
    private String MaChiTiet;
    private String MaDonHang;
    private String MaSach;
    private int SoLuong;

    public ChiTietDonHang() {
    }

    public ChiTietDonHang(String MaChiTiet, String MaDonHang, String MaSach, int SoLuong) {
        this.MaChiTiet = MaChiTiet;
        this.MaDonHang = MaDonHang;
        this.MaSach = MaSach;
        this.SoLuong = SoLuong;
    }

    public String getMaChiTiet() {
        return MaChiTiet;
    }

    public String getMaDonHang() {
        return MaDonHang;
    }

    public String getMaSach() {
        return MaSach;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setMaChiTiet(String MaChiTiet) {
        this.MaChiTiet = MaChiTiet;
    }

    public void setMaDonHang(String MaDonHang) {
        this.MaDonHang = MaDonHang;
    }

    public void setMaSach(String MaSach) {
        this.MaSach = MaSach;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }
    
}
