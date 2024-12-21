<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.net.*, java.io.*, java.util.*" %>
<%@ page import="com.google.gson.JsonObject, com.google.gson.JsonParser" %>

<%@ include file="sessionCheck_process.jsp" %>
<%@ include file="../db/dbconn.jsp" %>
<%@ include file="../db/dynamoconn.jsp" %>
<%
    int question1 = Integer.parseInt(request.getParameter("question1"));
    int question2 = Integer.parseInt(request.getParameter("question2"));
    int question3 = Integer.parseInt(request.getParameter("question3"));

    PreparedStatement stmt = null;
    ResultSet rs = null;

    String bestPlaceName = null;
    String bestPlaceCoordinate = null;
    String gptResponse = "정보를 가져오지 못했습니다.";
    String[] topFeatures = new String[3]; // 상위 3개 특징

    try {
        // 최적 장소를 조회하는 쿼리
        String sql = 
            "    SELECT p.id, p.name, p.coordinate, " +
            "           (p.latent1 * ? + p.latent2 * ? + p.latent3 * ?) AS score " +
            "    FROM place p " +
            "    ORDER BY score DESC " +
            "    LIMIT 1 ";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, question1);
        stmt.setInt(2, question2);
        stmt.setInt(3, question3);
        rs = stmt.executeQuery();

        int idx = 0;
        while (rs.next()) {
            if (idx == 0) { // 첫 번째 행에서 장소 정보 가져오기
                bestPlaceName = rs.getString("name");
                bestPlaceCoordinate = rs.getString("coordinate");
            }
			
        }
        rs.close();
        stmt.close();
        
        //DynamoDB feature 테이블에서 상위 3개의 특성 조회
        String tableName = "feature";
        String primaryKey = "name"; 

        
        Map<String, AttributeValue> keyToGet = new HashMap<>();
        keyToGet.put(primaryKey, AttributeValue.builder().s(bestPlaceName).build());

        GetItemRequest req = GetItemRequest.builder()
            .tableName(tableName)
            .key(keyToGet)
            .build();

        GetItemResponse res = dynamoDbClient.getItem(req);
        if (res.hasItem()) {
            Map<String, AttributeValue> item = res.item();

            
            List<Map.Entry<String, AttributeValue>> sortedEntries = new ArrayList<>(item.entrySet());
            sortedEntries.removeIf(entry -> entry.getKey().equals(primaryKey)); // name 필드 제외

            sortedEntries.sort((e1, e2) -> {
                String v1 = e1.getValue().s() != null ? e1.getValue().s() : e1.getValue().n();
                String v2 = e2.getValue().s() != null ? e2.getValue().s() : e2.getValue().n();
                return v2.compareTo(v1); 
            });

            // 상위 3개의 특징을 배열에 저장
            for (int i = 0; i < Math.min(3, sortedEntries.size()); i++) {
                topFeatures[i] = sortedEntries.get(i).getKey();
            }
        } else {
            for (int i = 0; i < topFeatures.length; i++) {
                topFeatures[i] = "데이터 없음";
            }
        }

        // GPT API 호출
        if (bestPlaceName != null) {
            String apiKey = "GPTAPI KEY";
            String apiUrl = "https://api.openai.com/v1/chat/completions";
            String requestBody = 
                "{ \"model\": \"gpt-3.5-turbo\", " +
                "  \"messages\": [" +
                "    { \"role\": \"system\", " +
                "      \"content\": \"여행지에 대한 정보를 알려줘야해. 사용자가 제공하는 여행지에 대해 간결하고 매력적으로 소개하는 역할이야. 주어진 여행지의 주요 즐길거리를 두 문장으로 소개해줘.\" }," +
                "    { \"role\": \"user\", " +
                "      \"content\": \"" + bestPlaceName + "에 대해 간결하고 흥미롭게 소개해줘. 주요 명소나 즐길만한 활동을 2문장으로 작성해줘.\" }" +
                "  ], " +
                "  \"max_tokens\": 200" +
                "}";

            URL url = new URL(apiUrl);
            HttpURLConnection connApi = (HttpURLConnection) url.openConnection();
            connApi.setRequestMethod("POST");
            connApi.setRequestProperty("Content-Type", "application/json");
            connApi.setRequestProperty("Authorization", "Bearer " + apiKey);
            connApi.setDoOutput(true);

            try (OutputStream os = connApi.getOutputStream()) {
                os.write(requestBody.getBytes("utf-8"));
            }

            try (BufferedReader br = new BufferedReader(new InputStreamReader(connApi.getInputStream(), "utf-8"))) {
                JsonObject jsonResponse = JsonParser.parseReader(br).getAsJsonObject();
                gptResponse = jsonResponse.getAsJsonArray("choices")
                                          .get(0).getAsJsonObject()
                                          .getAsJsonObject("message")
                                          .get("content").getAsString();
            }
        }

        
        response.sendRedirect("../jsp/recommend.jsp?place=" + URLEncoder.encode(bestPlaceName, "UTF-8") +
                              "&coordinate=" + URLEncoder.encode(bestPlaceCoordinate, "UTF-8") +
                              "&gptResponse=" + URLEncoder.encode(gptResponse, "UTF-8") +
                              "&feature1=" + URLEncoder.encode(topFeatures[0], "UTF-8") +
                              "&feature2=" + URLEncoder.encode(topFeatures[1], "UTF-8") +
                              "&feature3=" + URLEncoder.encode(topFeatures[2], "UTF-8"));

    } catch (Exception e) {
        response.sendRedirect("../jsp/recommend.jsp?error=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
