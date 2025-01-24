<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="DAO.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");
	
	UserDAO dao = new UserDAO();
	
    if (dao.exists(uid)) {
        out.print("EX");
        return;
    }
    
    if (dao.insert("id",uid)) {
        //out.print("회원 가입이 완료되었습니다.");
        session.setAttribute("id", uid);
        response.sendRedirect("main.jsp");
        out.print("OK");
    }
    else {
        out.print("ER");
    }
%>