<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../db/dbconn.jsp" %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	//out.print(id+passwd);
	
	
	String sql = "SELECT id, passwd FROM user WHERE id=? AND passwd=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		out.print("로그인 성공");
		session.setAttribute("userID", id);
		session.setMaxInactiveInterval(30*60);
		response.sendRedirect("../jsp/main.jsp");
	}
	else{
		String message = "아이디 또는 비밀번호가 일치하지 않습니다.";
		out.println("<script>alert('" + message + "'); history.back();</script>");
	}
		
	%>
