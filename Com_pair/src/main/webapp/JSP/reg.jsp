<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*;" %>
<%
	String id = request.getParameter("uid");
	String nick = request.getParameter("nick");
	String ps = request.getParameter("ps");
	String ps2 = request.getParameter("ps2");
	
	out.println(id +"','"+ ps+"','"+  ps2 +"','"+ nick);
	
	Class.forName("com.mysql.jdbc.Driver"); 
	
	String sql = "INSERT INTO user(id, password, name) VALUES";
	sql += "('" + id + "', '" + ps + "', '" + nick + "')"; // 1) Java Reflection API
	// 2) TCP/IP connection to the MySQL server
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "1111");
	Statement stmt = conn.createStatement(); // 3) Statement to store SQL
	int count = stmt.executeUpdate(sql); // 4) SQL Execution in the MYSQL server
	if (count == 1) {					// 5) result handing 
	out.print("회원 가입이 완료되었습니다.");
	}
	else {
	out.print("회원 가입 중 오류가 발생하었습니다.");
	}
	stmt.close(); conn.close(); //6) resource release
%>
