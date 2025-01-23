<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");
    
    // Get parameters from the request
    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    String uname = request.getParameter("name");
    
    // Create SQL query
    String sql = "INSERT INTO user(id, password, name) VALUES ('" + uid + "', '" + upass + "', '" + uname + "')";
    
    // Database connection variables
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    Statement stmt = null;

    try {
        // Connect to the database
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "0000");
        stmt = conn.createStatement();
        
        // Execute the query
        int count = stmt.executeUpdate(sql);
        if (count == 1) {
            out.print("회원 가입이 완료되었습니다.");
        } else {
            out.print("회원 가입 중 오류가 발생하었습니다.");
        }
    } catch (Exception e) {
        out.print("데이터베이스 처리 중 오류가 발생했습니다: " + e.getMessage());
    } finally {
        // Close resources
        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
