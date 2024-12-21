<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp" %>
<%@ include file="../process/sessionCheck_process.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <%

    	String[] places = {
            "전주 풍패지관", "풍남문", "전주경기전", "전주 한옥마을", "오목대", "자만벽화마을", "한벽당", 
            "전주향교", "전주덕진공원", "덕진체련공원", "중상보도시근린공원", "전북투어패스", "전주곤충캠퍼스", 
            "루이엘모자박물관", "전주전통술박물관", "전주난장", "세병공원", "전주동물원", "전북대학교 박물관", 
            "가련산공원", "전주드림랜드", "전주 일몽"
        };
            
    %>
            <h1>새 글 작성</h1>
            <form action="../process/write_process.jsp" method="POST">
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">장소</label>
                    <select class="form-select" id="name" name="name" required>
                        <option value="" disabled selected>장소를 선택하세요</option>
                        <% for (String place : places) { %>
                            <option value="<%= place %>"><%= place %></option>
                        <% } %>
                    </select>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="rating" class="form-label">별점</label>
                        <input type="number" class="form-control" id="rating" name="rating" min="1" max="5" required>
                    </div>
                    <div class="col-md-6">
                        <label for="date" class="form-label">날짜</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">작성 완료</button>
                <a href="../process/main_process.jsp" class="btn btn-secondary">취소</a>
            </form>

</div>
</body>
</html>
