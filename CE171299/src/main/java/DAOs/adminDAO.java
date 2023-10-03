/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.admin;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS PC
 */
public class adminDAO {
    private Connection conn = null;
    
    public adminDAO() {
        conn = DBs.DBConnection.getConnection();
    }
    
    public boolean login(admin a) throws SQLException {
        ResultSet rs = null;
        String sql = "SELECT * FROM admins WHERE Username=? AND Password=?";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, a.getUsername());
            ps.setString(2, getMd5(a.getPassword()));
            System.out.println(getMd5(a.getPassword()));
            
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(adminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return rs.next();
    }
    
    private String getMd5(String password) {
        try {
            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // input string converted to byte value array
            byte[] messageDigest = md.digest(password.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
