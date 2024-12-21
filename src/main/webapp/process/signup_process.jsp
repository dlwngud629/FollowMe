<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../db/dbconn.jsp" %>
<%
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");

    if (id == null || id.trim().isEmpty() || passwd == null || passwd.trim().isEmpty()) {
        out.println("<script>alert('아이디와 비밀번호는 공백일 수 없습니다.'); history.back();</script>");
        return;
    }
    
    if (id.contains(" ") || passwd.contains(" ")) {
        out.println("<script>alert('아이디와 비밀번호는 공백 문자를 포함할 수 없습니다.'); history.back();</script>");
        return;
    }
    
    if (id.length() < 5 || id.length() > 20) {
        out.println("<script>alert('아이디는 5자 이상, 20자 이하로 입력해주세요.'); history.back();</script>");
        return;
    }

    if (passwd.length() < 8 || passwd.length() > 20) {
        out.println("<script>alert('비밀번호는 8자 이상, 20자 이하로 입력해주세요.'); history.back();</script>");
        return;
    }

    try {
        String sql = "INSERT INTO user (id, passwd) VALUES (?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, passwd);
        pstmt.executeUpdate();

        response.sendRedirect("../jsp/index.jsp");
    } catch (SQLException e) {
        if ("23000".equals(e.getSQLState())) {
            out.println("<script>alert('아이디는 중복될 수 없습니다! 다른 아이디를 입력해주세요.'); history.back();</script>");
        } else {
            out.print(e.getErrorCode() + " 에러가 발생했습니다.");
        }
    }
%>
