/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class NguoiDung {
    private String MaNguoiDung;
    private String TaiKhoan;
    private String MatKhau;
    private String HoTen;
    private String Email;
    private String SoDienThoai;
    private String DiaChi;
    private boolean VaiTro;

    public NguoiDung() {
    }

    public NguoiDung(String MaNguoiDung, String TaiKhoan, String MatKhau, String HoTen, String Email, String SoDienThoai, String DiaChi, boolean VaiTro) {
        this.MaNguoiDung = MaNguoiDung;
        this.TaiKhoan = TaiKhoan;
        this.MatKhau = MatKhau;
        this.HoTen = HoTen;
        this.Email = Email;
        this.SoDienThoai = SoDienThoai;
        this.DiaChi = DiaChi;
        this.VaiTro = VaiTro;
    }

    public String getMaNguoiDung() {
        return MaNguoiDung;
    }

    public String getTaiKhoan() {
        return TaiKhoan;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public String getHoTen() {
        return HoTen;
    }

    public String getEmail() {
        return Email;
    }

    public String getSoDienThoai() {
        return SoDienThoai;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public boolean isVaiTro() {
        return VaiTro;
    }

    public void setMaNguoiDung(String MaNguoiDung) {
        this.MaNguoiDung = MaNguoiDung;
    }

    public void setTaiKhoan(String TaiKhoan) {
        this.TaiKhoan = TaiKhoan;
    }

    public void setMatKhau(String MatKhau) {
        this.MatKhau = MatKhau;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setSoDienThoai(String SoDienThoai) {
        this.SoDienThoai = SoDienThoai;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public void setVaiTro(boolean VaiTro) {
        this.VaiTro = VaiTro;
    }
    
}
