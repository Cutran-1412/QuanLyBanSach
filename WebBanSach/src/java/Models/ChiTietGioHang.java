/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class ChiTietGioHang {
    private String MaChiTiet;
    private String MaGioHang;
    private String MaSach;
    private int SoLuong;

    public ChiTietGioHang() {
    }

    public ChiTietGioHang(String MaChiTiet, String MaGioHang, String MaSach, int SoLuong) {
        this.MaChiTiet = MaChiTiet;
        this.MaGioHang = MaGioHang;
        this.MaSach = MaSach;
        this.SoLuong = SoLuong;
    }

    public String getMaChiTiet() {
        return MaChiTiet;
    }

    public String getMaGioHang() {
        return MaGioHang;
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

    public void setMaGioHang(String MaGioHang) {
        this.MaGioHang = MaGioHang;
    }

    public void setMaSach(String MaSach) {
        this.MaSach = MaSach;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }
    
}
