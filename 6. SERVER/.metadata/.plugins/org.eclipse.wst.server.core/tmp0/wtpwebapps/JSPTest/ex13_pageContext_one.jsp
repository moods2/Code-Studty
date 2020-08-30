<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	//response : 문맥이 끊긴다.
	//pageContext : 문맥이 연결된다. (request, response 전달 + 지속)

	//DB -> 데이터
	String name = "홍길동";
	int age = 20;
	
	request.setAttribute("num", 100); //request 변수
	request.setAttribute("name", name);
	request.setAttribute("age", age);
	
	pageContext.setAttribute("color", "yellow");
	
	//response.sendRedirect("ex13_pageContext_two.jsp");
	pageContext.forward("ex13_pageContext_two.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	
	<div class="container">
	
		<h1>첫번째 페이지</h1>
		
		<%= request.getAttribute("num") %>
		
	</div>
	
	<script>
	
	</script>
</body>
</html>















