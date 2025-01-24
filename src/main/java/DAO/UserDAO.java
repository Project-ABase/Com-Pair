package DAO;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import util.*;

public class UserDAO {
	public boolean insert(String uid, String umail, String upass, uname) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO user(user_id, user_mail, password, user_name) VALUES(?, ?, ?, ?)";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, umail);
            stmt.setString(3, upass);
            stmt.setString(4, uname);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
	
	public int login(String uid, String upass) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
		try {
			String sql = "SELECT user_id, password FROM userTable WHERE user_id = ?"
		
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) return 1;
            
            String user_password = rs.getString("password");
            if(!upass.equals(user_password)) return 2;
            
            return 0;
		} finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
	}
	
	
	
}
