<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>여행지 추천 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        .result-section { margin-top: 50px; text-align: center; }
        #map { height: 400px; width: 66%; margin: 20px auto; border: 1px solid #ddd; border-radius: 8px; }
        iframe { width: 100%; height: 150px; border: none; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4 text-center">여행지 추천 결과</h2>

        <%
            String place = request.getParameter("place");
            String coordinate = request.getParameter("coordinate");
            String gptResponse = request.getParameter("gptResponse");
            String feature1 = request.getParameter("feature1");
            String feature2 = request.getParameter("feature2");
            String feature3 = request.getParameter("feature3");
            String error = request.getParameter("error");

            if (error != null) {
        %>
            <div class="result-section">
                <h4>오류가 발생했습니다: <%= error %></h4>
                <a href="main.jsp" class="btn btn-primary mt-4">다시 시도하기</a>
            </div>
        <%
            } else if (place != null && coordinate != null) {
        %>
            <div class="result-section">
                <h3>추천 여행지: <strong><%= place %></strong></h3>
                <p>여행자들이 뽑은 상위 3개 특징!</p>
                <p><strong>1.</strong> <%= feature1 %></p>
                <p><strong>2.</strong> <%= feature2 %></p>
                <p><strong>3.</strong> <%= feature3 %></p>

                <div id="map"></div>
                <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
                <script>
                    const [latitude, longitude] = "<%= coordinate %>".split(",").map(Number);
                    const map = L.map('map').setView([latitude, longitude], 14);
                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; OpenStreetMap contributors'
                    }).addTo(map);

                    L.marker([latitude, longitude]).addTo(map)
                        .bindPopup("<strong><%= place %></strong>")
                        .openPopup();
                </script>
                <div class="text-center mt-4">
                    <p><strong>GPT가 설명하는 <%= place %></strong></p>
                    <p><%= gptResponse.replaceAll("\\.\\s*", ".<br>") %></p>
                </div>

                <!-- 번역 요청 -->
                <div class="text-center mt-4">
                    <form target="translationFrame" action="../process/translate_process.jsp" method="post">
                        <input type="hidden" name="gptResponse" value="<%= gptResponse %>" />
                        <label for="language" class="form-label"><strong>번역할 언어를 선택하세요:</strong></label>
                        <select name="language" id="language" class="form-select w-50 mx-auto">
                            <option value="en">영어</option>
                            <option value="ja">일본어</option>
                            <option value="zh">중국어</option>
                            <option value="fr">프랑스어</option>
                            <option value="de">독일어</option>
                        </select>
                        <button type="submit" class="btn btn-primary mt-3">번역 요청하기</button>
                    </form>
                </div>
           		
           		<iframe name="translationFrame"></iframe>
                <a href="main.jsp" class="btn btn-secondary mt-4">다시 추천 받기</a>
                
            </div>
        <%
            } else {
        %>
            <div class="result-section">
                <h4>추천할 여행지를 찾을 수 없습니다.</h4>
                <a href="main.jsp" class="btn btn-primary mt-4">다시 시도하기</a>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
