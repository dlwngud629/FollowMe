<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="software.amazon.awssdk.services.translate.*" %>
<%@ page import="software.amazon.awssdk.services.translate.model.*" %>
<%@ page import="software.amazon.awssdk.auth.credentials.*" %>
<%@ page import="software.amazon.awssdk.regions.Region" %>

<%
    String gptResponse = request.getParameter("gptResponse");
    String targetLanguage = request.getParameter("language");

    AwsBasicCredentials awsCreds = AwsBasicCredentials.create(
        "AWS ACCESS KEY",  
        "AWS SECRET KEY"   
    );

    TranslateClient translateClient = TranslateClient.builder()
        .region(Region.US_EAST_1)
        .credentialsProvider(StaticCredentialsProvider.create(awsCreds))
        .build();

    String translatedText = "번역에 실패했습니다.";

    try {
        TranslateTextRequest translateRequest = TranslateTextRequest.builder()
            .sourceLanguageCode("auto")
            .targetLanguageCode(targetLanguage)
            .text(gptResponse)
            .build();

        TranslateTextResponse translateResponse = translateClient.translateText(translateRequest);
        translatedText = translateResponse.translatedText();

    } catch (Exception e) {
        e.printStackTrace();
        translatedText = "번역 중 오류가 발생했습니다.";
    } finally {
        translateClient.close();
    }
%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<div class="text-center mt-4">
    <p><%= translatedText.replaceAll("\\.\\s*", ".<br>") %></p>
</div>
