<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
Connection conn = null;
String dburl = "jdbc:mysql://localhost:3306/FollowMeDB";
String dbuser = "root";
String dbpasswd = "admin";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(dburl,dbuser,dbpasswd);
%>