<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FollowMe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- 관리자 페이지 버튼-->
    <div class="position-absolute top-5 start-5 m-3">
    	<a href="../process/logout_process.jsp" class="btn btn-outline-danger btn-sm me-2">로그아웃</a>
        <a href="../process/admin_process.jsp" class="btn btn-outline-secondary btn-sm">관리자 페이지</a>
    </div>

    <div class="container-fluid vh-100 d-flex align-items-center">
        <div class="row w-100 justify-content-center align-items-stretch">
            <!-- 왼쪽 게시판 -->
            <div class="col-md-5 bg-light p-4 shadow-sm rounded d-flex align-items-center" style="height: 50vh; margin-right: 1rem;">
                <iframe src="../process/main_process.jsp" class="w-100 h-100 border-0"></iframe>
            </div>
            
            <!-- 오른쪽 설문조사 -->
            <div class="col-md-5 d-flex justify-content-center align-items-center">
                <div class="card p-4 shadow-sm w-100" style="max-width: 400px;">
                    <h2 class="mb-4 text-center">설문조사</h2>
                    <form action="../process/recommend_process.jsp" method="POST">
					    <div class="mb-3">
					        <label for="question1" class="form-label">인스타그램에 올릴 사진을 찾고 계신가요?</label>
					        <div class="d-flex align-items-center">
					            <span class="me-2">0</span> 
					            <input type="range" class="form-range" id="question1" name="question1" min="0" max="10" value="5">
					            <span class="ms-2">10</span> 
					        </div>
					    </div>
					    <div class="mb-3">
					        <label for="question2" class="form-label">다양한 체험이 있으시길 원하신가요?</label>
					        <div class="d-flex align-items-center">
					            <span class="me-2">0</span>
					            <input type="range" class="form-range" id="question2" name="question2" min="0" max="10" value="5">
					            <span class="ms-2">10</span> 
					        </div>
					    </div>
					    <div class="mb-3">
					        <label for="question3" class="form-label">볼거리가 많았으면 좋겠나요?</label>
					        <div class="d-flex align-items-center">
					            <span class="me-2">0</span>
					            <input type="range" class="form-range" id="question3" name="question3" min="0" max="10" value="5">
					            <span class="ms-2">10</span> 
					        </div>
					    </div>
					    <button type="submit" class="btn btn-primary w-100">여행지 추천 받기</button>
					</form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
