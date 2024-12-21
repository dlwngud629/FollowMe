<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userID = (String) session.getAttribute("userID");
if (userID == null) {
%>
    <script>
    	alert("세션이 만료되었습니다. 로그인 페이지로 이동합니다.");
        if (window.top !== window.self) {
            window.top.location.href = "../jsp/index.jsp";
        } else {
            window.location.href = "../jsp/index.jsp";
        }
    </script>
<%
    return;
}
%>

