<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid vh-100 d-flex align-items-center">
        <div class="row w-100">
            <!-- 왼쪽 설명 -->
            <div class="col-md-6 d-flex justify-content-center align-items-center bg-light">
                <div class="text-center">
                    <h1>Follow Me 방문을 환영합니다!</h1>
                    <p class="lead">Follow Me는 여행지 추천 커뮤니티입니다.<br>회원가입 후 로그인 해주세요.</p>
                </div>
            </div>

            <!-- 오른쪽 로그인 폼 -->
            <div class="col-md-6 d-flex justify-content-center align-items-center">
                <div class="card p-4 shadow-sm" style="width: 100%; max-width: 400px;">
                    <h2 class="mb-4 text-center">로그인</h2>
                    <form action="../process/index_process.jsp" method="POST">
                        <div class="mb-3">
                            <label for="id" class="form-label">아이디</label>
                            <input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요" required>
                        </div>
                        <div class="mb-3">
                            <label for="passwd" class="form-label">비밀번호</label>
                            <input type="passwd" class="form-control" name="passwd" placeholder="비밀번호를 입력하세요" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">로그인</button>
                    </form>
                    <div class="mt-1 text-center">
                        <p>회원이 아니신가요? <a href="signup.jsp">회원가입</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
