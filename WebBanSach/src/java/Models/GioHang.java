/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;
import java.util.Date;
/**
 *
 * @author Admin
 */
public class GioHang {
    private String MaGioHang;
    private String MaNguoiDung;
    private Date NgayTao;

    public GioHang() {
    }

    public GioHang(String MaGioHang, String MaNguoiDung, Date NgayTao) {
        this.MaGioHang = MaGioHang;
        this.MaNguoiDung = MaNguoiDung;
        this.NgayTao = NgayTao;
    }

    public String getMaGioHang() {
        return MaGioHang;
    }

    public String getMaNguoiDung() {
        return MaNguoiDung;
    }

    public Date getNgayTao() {
        return NgayTao;
    }

    public void setMaGioHang(String MaGioHang) {
        this.MaGioHang = MaGioHang;
    }

    public void setMaNguoiDung(String MaNguoiDung) {
        this.MaNguoiDung = MaNguoiDung;
    }

    public void setNgayTao(Date NgayTao) {
        this.NgayTao = NgayTao;
    }
    
}
