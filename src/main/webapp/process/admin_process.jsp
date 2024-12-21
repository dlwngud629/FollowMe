<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<%@ include file="sessionCheck_process.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%


    // 데이터베이스에서 관리자 권한 확인
    boolean isAdmin = false;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT role FROM user WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userID);
        rs = pstmt.executeQuery();

        if (rs.next() && "admin".equals(rs.getString("role"))) {
            isAdmin = true;
        }
    } catch (Exception e) {
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }

    if (!isAdmin) {
        out.println("<script>alert('관리자만 접근 가능합니다.'); location.href='../jsp/main.jsp';</script>");
        return;
    }

    // 권한 변경 처리
    String changeRoleID = request.getParameter("changeRoleID");
    if (changeRoleID != null) {
        try {
            pstmt = conn.prepareStatement("SELECT role FROM user WHERE id = ?");
            pstmt.setString(1, changeRoleID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String currentRole = rs.getString("role");
                String newRole = "admin".equals(currentRole) ? "user" : "admin";

                pstmt = conn.prepareStatement("UPDATE user SET role = ? WHERE id = ?");
                pstmt.setString(1, newRole);
                pstmt.setString(2, changeRoleID);
                pstmt.executeUpdate();

                out.println("<script>alert('권한이 성공적으로 변경되었습니다.'); location.href='admin_process.jsp';</script>");
            } else {
                out.println("<script>alert('유저를 찾을 수 없습니다.'); history.back();</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('권한 변경 오류: " + e.getMessage() + "'); history.back();</script>");
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        }
    }

    // 계정 삭제 처리
    String deleteUserID = request.getParameter("deleteUserID");
    if (deleteUserID != null) {
        try {
            pstmt = conn.prepareStatement("DELETE FROM user WHERE id = ?");
            pstmt.setString(1, deleteUserID);
            pstmt.executeUpdate();

            out.println("<script>alert('유저가 삭제되었습니다.'); location.href='admin_process.jsp';</script>");
        } catch (Exception e) {
            out.println("<script>alert('유저 삭제 오류: " + e.getMessage() + "'); history.back();</script>");
        } finally {
            if (pstmt != null) pstmt.close();
        }
    }

    // 게시글 삭제 처리
    String deletePostID = request.getParameter("deletePostID");
    if (deletePostID != null) {
        try {
            pstmt = conn.prepareStatement("DELETE FROM post WHERE id = ?");
            pstmt.setInt(1, Integer.parseInt(deletePostID));
            pstmt.executeUpdate();

            out.println("<script>alert('게시글이 삭제되었습니다.'); location.href='admin_process.jsp';</script>");
        } catch (Exception e) {
            out.println("<script>alert('게시글 삭제 오류: " + e.getMessage() + "'); history.back();</script>");
        } finally {
            if (pstmt != null) pstmt.close();
        }
    }

    // 페이지 설정
    int userPageSize = 5;
    int postPageSize = 5;
    int userPage = request.getParameter("userPage") == null ? 1 : Integer.parseInt(request.getParameter("userPage"));
    int postPage = request.getParameter("postPage") == null ? 1 : Integer.parseInt(request.getParameter("postPage"));

    int userOffset = (userPage - 1) * userPageSize;
    int postOffset = (postPage - 1) * postPageSize;

    // 유저 목록 총 수 계산
    int totalUserCount = 0;
    pstmt = conn.prepareStatement("SELECT COUNT(*) AS total FROM user");
    rs = pstmt.executeQuery();
    if (rs.next()) {
        totalUserCount = rs.getInt("total");
    }

    // 게시글 목록 총 수 계산
    int totalPostCount = 0;
    pstmt = conn.prepareStatement("SELECT COUNT(*) AS total FROM post");
    rs = pstmt.executeQuery();
    if (rs.next()) {
        totalPostCount = rs.getInt("total");
    }

    int maxUserPage = (int) Math.ceil((double) totalUserCount / userPageSize);
    int maxPostPage = (int) Math.ceil((double) totalPostCount / postPageSize);
%>

<div class="container mt-5">
    <div class="d-flex align-items-center gap-2">
        <h2 class="mb-0">관리자 페이지</h2>
        <button type="button" class="btn btn-primary" onclick="location.href='../jsp/main.jsp'">메인 페이지 이동</button>
    </div>
    <br>

    <!-- 유저 목록 표시 -->
    <h4>유저 목록</h4>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Role</th>
                <th>권한 변경</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <%
                pstmt = conn.prepareStatement("SELECT id, role FROM user LIMIT ? OFFSET ?");
                pstmt.setInt(1, userPageSize);
                pstmt.setInt(2, userOffset);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    String userRole = rs.getString("role");
            %>
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><%= userRole %></td>
                <td>
                    <form method="POST" action="admin_process.jsp" style="display:inline;">
                        <input type="hidden" name="changeRoleID" value="<%= rs.getString("id") %>">
                        <button type="submit" class="btn btn-primary btn-sm">
                            <%= "admin".equals(userRole) ? "관리자 해제" : "관리자 부여" %>
                        </button>
                    </form>
                </td>
                <td>
                    <form method="POST" action="admin_process.jsp" style="display:inline;">
                        <input type="hidden" name="deleteUserID" value="<%= rs.getString("id") %>">
                        <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <!-- 유저 페이징 -->
    <div class="d-flex justify-content-center mt-3">
        <nav>
            <ul class="pagination">
                <li class="page-item <%= userPage <= 1 ? "disabled" : "" %>">
                    <a class="page-link" href="admin_process.jsp?userPage=<%= userPage - 1 %>&postPage=<%= postPage %>">이전</a>
                </li>
                <li class="page-item disabled">
                    <span class="page-link"><%= userPage %></span>
                </li>
                <li class="page-item <%= userPage >= maxUserPage ? "disabled" : "" %>">
                    <a class="page-link" href="admin_process.jsp?userPage=<%= userPage + 1 %>&postPage=<%= postPage %>">다음</a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- 게시글 목록 표시 -->
    <h4 class="mt-5">게시글 목록</h4>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>제목</th>
                <th>작성자 ID</th>
                <th>장소</th>
                <th>날짜</th>
                <th>별점</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <%
                pstmt = conn.prepareStatement("SELECT id, title, user_id, name, date, rating FROM post ORDER BY date DESC LIMIT ? OFFSET ?");
                pstmt.setInt(1, postPageSize);
                pstmt.setInt(2, postOffset);
                rs = pstmt.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("user_id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getDate("date") %></td>
                <td><%= rs.getInt("rating") %></td>
                <td>
                    <form method="POST" action="admin_process.jsp" style="display:inline;">
                        <input type="hidden" name="deletePostID" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-warning btn-sm">삭제</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <!-- 게시글 페이징 -->
    <div class="d-flex justify-content-center mt-3">
        <nav>
            <ul class="pagination">
                <li class="page-item <%= postPage <= 1 ? "disabled" : "" %>">
                    <a class="page-link" href="admin_process.jsp?userPage=<%= userPage %>&postPage=<%= postPage - 1 %>">이전</a>
                </li>
                <li class="page-item disabled">
                    <span class="page-link"><%= postPage %></span>
                </li>
                <li class="page-item <%= postPage >= maxPostPage ? "disabled" : "" %>">
                    <a class="page-link" href="admin_process.jsp?userPage=<%= userPage %>&postPage=<%= postPage + 1 %>">다음</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
