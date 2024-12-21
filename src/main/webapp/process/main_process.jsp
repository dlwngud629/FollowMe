<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="sessionCheck_process.jsp" %>
    <div class="container">
        <h2 class="mt-4 text-center">게시판</h2>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">날짜</th>
                    <th scope="col">장소</th>
                    <th scope="col">제목</th>
                    <th scope="col">별점</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int currentPage = 1; 
                    int pageSize = 8;    
                    int totalPostCount = 0;  

                    if (request.getParameter("page") != null) {
                        currentPage = Integer.parseInt(request.getParameter("page"));
                    }
                    int offset = (currentPage - 1) * pageSize; // OFFSET 계산

                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        String countQuery = "SELECT COUNT(*) AS total FROM post";
                        stmt = conn.prepareStatement(countQuery);
                        rs = stmt.executeQuery();
                        if (rs.next()) {
                            totalPostCount = rs.getInt("total");
                        }

                        int maxPage = (int) Math.ceil((double) totalPostCount / pageSize); 

                        // 게시물 가져오기
                        String sql = "SELECT date, name, title, rating FROM post ORDER BY date DESC LIMIT ? OFFSET ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, pageSize);
                        stmt.setInt(2, offset);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getDate("date") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td>
                            <a href="../jsp/post.jsp?title=<%= java.net.URLEncoder.encode(rs.getString("title"), "UTF-8") %>">
                                <%= rs.getString("title") %>
                            </a>
                        </td>
                        <td><%= rs.getInt("rating") %></td>
                    </tr>
                <%
                        }
                %>
            </tbody>
        </table>

        <!-- 페이징 -->
        <div class="d-flex justify-content-center mt-3">
		    <nav>
		        <ul class="pagination">
		            <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
		                <a class="page-link" href="main_process.jsp?page=<%= currentPage - 1 %>">이전</a>
		            </li>
		            <li class="page-item disabled">
		                <span class="page-link"><%= currentPage %></span>
		            </li>
		            <li class="page-item <%= currentPage >= maxPage ? "disabled" : "" %>">
		                <a class="page-link" href="main_process.jsp?page=<%= currentPage + 1 %>">다음</a>
		            </li>
		            <li class="page-item ms-2">
		                <a href="../jsp/write.jsp" class="btn btn-outline-dark">글쓰기</a>
		            </li>
		        </ul>
		    </nav>
		</div>
        <%
                    } catch (Exception e) {
                        out.println("<tr><td colspan='4'>데이터를 불러오는 중 오류 발생: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                    }
                %>
    </div>
</body>
</html>
