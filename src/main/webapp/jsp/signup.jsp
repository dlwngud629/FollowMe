<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid vh-100 d-flex align-items-center">
        <div class="row w-100">
            <div class="col-md-6 offset-md-3">
                <div class="card p-4 shadow-sm">
                    <h2 class="mb-4 text-center">회원가입</h2>
                    <form action="../process/signup_process.jsp" method="POST">
                        <div class="mb-3">
                            <label for="id" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
                        </div>
                        <div class="mb-3">
                            <label for="passwd" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">회원가입</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
