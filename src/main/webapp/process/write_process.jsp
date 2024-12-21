<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<jsp:include page="sessionCheck_process.jsp" />
<%

    String userID = (String) session.getAttribute("userID");
	
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String name = request.getParameter("name");
    String date = request.getParameter("date");
    int rating = Integer.parseInt(request.getParameter("rating"));

    PreparedStatement pstmt = null;
	
    //게시글 DB Update
    try {
        String sql = "INSERT INTO post (title, content, user_id, name, date, rating) VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, userID);
        pstmt.setString(4, name);
        pstmt.setString(5, date);
        pstmt.setInt(6, rating);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            response.sendRedirect("main_process.jsp");
        } else {
            out.println("<script>alert('글 작성에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
