/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

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
public class vegetableDAO {

    private Connection conn = null;

    public vegetableDAO() {
        conn = DBs.DBConnection.getConnection();
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        String sql = "SELECT * FROM vegetables";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(vegetableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }
    
    public int getTotal() {
        int total = 0;
        String sql = "SELECT * FROM vegetables";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                ++total;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(vegetableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return total;
    }
}
