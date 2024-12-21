<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="mt-4 text-center">게시글 상세보기</h2>
        <%
            String titleParam = request.getParameter("title");

            if (titleParam == null || titleParam.trim().isEmpty()) {
                out.println("<p class='text-danger'>잘못된 접근입니다.</p>");
            } else {
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    String sql = "SELECT title, content, user_id, name, date, rating FROM post WHERE title = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, titleParam);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
        %>
        <div class="card mt-4">
            <div class="card-body">
                <h4 class="card-title"><%= rs.getString("title") %></h4>
                <h6 class="card-subtitle mb-2 text-muted">
                    여행지: <%= rs.getString("name") %> | 작성자: <%= rs.getString("user_id") %> | 
                    날짜: <%= rs.getDate("date") %> | 별점: <%= rs.getInt("rating") %>
                </h6>
                <p class="card-text mt-3"><%= rs.getString("content") %></p>
            </div>
        </div>
        <%
                    } else {
                        out.println("<p class='text-danger'>해당 게시글을 찾을 수 없습니다.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p class='text-danger'>오류 발생: " + e.getMessage() + "</p>");
                } finally {
                    // 자원 해제
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                }
            }
        %>
        <div class="mt-3">
            <a href="../process/main_process.jsp" class="btn btn-primary">목록으로 돌아가기</a>
        </div>
    </div>
</body>
</html>
