    /*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
     */
    package DAO;
    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.SQLException;
    /**
     *
     * @author Admin
     */
    public class DBConnection {
        private static final String url = "jdbc:mysql://localhost:3306/QuanLyBanSach"; 
        private static final String user = "root";
        private static final String pass = "";
        public static Connection getConnection(){
            Connection conn = null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url,user,pass);
                System.out.println("Ket noi thanh cong");
            }
            catch(ClassNotFoundException e){
                System.out.println("Khong tim thay driver JDBC: " + e.getMessage());
            }
            catch (SQLException e) {
                System.out.println("Loi ket noi CSDL: " + e.getMessage());
            }
            return conn;
        }
    }
