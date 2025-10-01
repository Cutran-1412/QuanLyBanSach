/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;
import java.sql.Date;
/**
 *
 * @author Admin
 */
public class DonHang {
    private String MaDonHang;
    private String MaNguoiDung;
    private Date NgayDat;
    private String TrangThai;
    private double TongTien;

    public DonHang() {
    }

    public DonHang(String MaDonHang, String MaNguoiDung, Date NgayDat, String TrangThai, double TongTien) {
        this.MaDonHang = MaDonHang;
        this.MaNguoiDung = MaNguoiDung;
        this.NgayDat = NgayDat;
        this.TrangThai = TrangThai;
        this.TongTien = TongTien;
    }

    public String getMaDonHang() {
        return MaDonHang;
    }

    public String getMaNguoiDung() {
        return MaNguoiDung;
    }

    public Date getNgayDat() {
        return NgayDat;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public double getTongTien() {
        return TongTien;
    }

    public void setMaDonHang(String MaDonHang) {
        this.MaDonHang = MaDonHang;
    }

    public void setMaNguoiDung(String MaNguoiDung) {
        this.MaNguoiDung = MaNguoiDung;
    }

    public void setNgayDat(Date NgayDat) {
        this.NgayDat = NgayDat;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }

    public void setTongTien(double TongTien) {
        this.TongTien = TongTien;
    }
    
}
