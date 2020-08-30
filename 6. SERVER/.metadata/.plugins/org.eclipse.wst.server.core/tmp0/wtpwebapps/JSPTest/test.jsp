<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String name = "홍길동";
	int age = 20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	
	<div>안녕하세요. 저는 <%= name %>입니다.</div>
	<div>제 나이는 <%= age %>살입니다.</div>
	
	<% for (int i=0; i<=3; i++) { %>
		<div>숫자 : <%= i %></div>
	<% } %>
	
</body>
</html>
