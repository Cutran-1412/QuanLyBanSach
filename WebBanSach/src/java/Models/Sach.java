/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Sach {
    private String MaSach;
    private String TenSach;
    private String TacGia;
    private String NhaXuatBan;
    private int NamXuatBan;
    private double Gia;
    private int SoLuong;
    private String MoTa;
    private String Anh;
    private String MaTheLoai;

    public Sach() {
    }

    public Sach(String MaSach, String TenSach, String TacGia, String NhaXuatBan, int NamXuatBan, double Gia, int SoLuong, String MoTa, String Anh, String MaTheLoai) {
        this.MaSach = MaSach;
        this.TenSach = TenSach;
        this.TacGia = TacGia;
        this.NhaXuatBan = NhaXuatBan;
        this.NamXuatBan = NamXuatBan;
        this.Gia = Gia;
        this.SoLuong = SoLuong;
        this.MoTa = MoTa;
        this.Anh = Anh;
        this.MaTheLoai = MaTheLoai;
    }

    public String getMaSach() {
        return MaSach;
    }

    public String getTenSach() {
        return TenSach;
    }

    public String getTacGia() {
        return TacGia;
    }

    public String getNhaXuatBan() {
        return NhaXuatBan;
    }

    public int getNamXuatBan() {
        return NamXuatBan;
    }

    public double getGia() {
        return Gia;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public String getMoTa() {
        return MoTa;
    }

    public String getAnh() {
        return Anh;
    }

    public String getMaTheLoai() {
        return MaTheLoai;
    }

    public void setMaSach(String MaSach) {
        this.MaSach = MaSach;
    }

    public void setTenSach(String TenSach) {
        this.TenSach = TenSach;
    }

    public void setTacGia(String TacGia) {
        this.TacGia = TacGia;
    }

    public void setNhaXuatBan(String NhaXuatBan) {
        this.NhaXuatBan = NhaXuatBan;
    }

    public void setNamXuatBan(int NamXuatBan) {
        this.NamXuatBan = NamXuatBan;
    }

    public void setGia(double Gia) {
        this.Gia = Gia;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

    public void setAnh(String Anh) {
        this.Anh = Anh;
    }

    public void setMaTheLoai(String MaTheLoai) {
        this.MaTheLoai = MaTheLoai;
    }
    
}
