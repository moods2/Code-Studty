<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	//내장 객체 : request, response, pageContext, session, out
	
	//response 객체
	// - 페이지 이동하기
	
	//페이지 이동 수단
	//1. HTML
	//	- <a>
	//	- 사람이 직접 링크 클릭
	//2. JavaScript
	//	- location.href
	//	- 자유도 높은 이동 > 프로그램 제어 가능
	//3. Servlet/JSP
	//	- response.sendRedirect()
	//	- 자유도 높은 이동 > 프로그램 제어 가능
	
	//A -> B -> C
	//A : 폼 페이지(글쓰기 페이지)
	//B : 업무 페이지(DB 작업)
	//C : 완료 페이지(결과 전달)
	
	//A -> B
	//A : 폼 페이지(글쓰기 페이지)
	//B : 업무 페이지(DB 작업) + 완료 페이지(결과 전달)
	
	//response.sendRedirect("ex12_response_two.jsp");		

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
		
	</div>
	
	<script>
		location.href = "ex12_response_two.jsp";
	</script>
</body>
</html>















