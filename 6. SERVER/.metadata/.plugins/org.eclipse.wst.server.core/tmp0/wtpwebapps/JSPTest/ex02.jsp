<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Random rnd = new Random();
		int dan = rnd.nextInt(8) + 2;
	%>
	
	<%@ include file="inc/header.jsp" %>
	
	<h1><%= dan %>단</h1>
	
	<!-- 스파게티 코드 -->
	<% for (int i=1; i<=9; i++) { %>
	<div><%= dan %> x <%= i %> = <%= dan * i %></div>
	<% } %>
	
	<%@ include file="inc/footer.jsp" %>

</body>
</html>