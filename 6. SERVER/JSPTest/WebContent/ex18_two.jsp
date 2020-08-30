<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
		<h1>두번째 페이지</h1>
		
		<%-- <div>지역변수 a : <%= a %></div> --%>
		<%-- <div>멤버변수 b : <%= b %></div> --%>
		<div>pageContext : <%= pageContext.getAttribute("c") %></div>
		<div>request : <%= request.getAttribute("d") %></div>
		<div>session : <%= session.getAttribute("e") %></div>
		<div>application : <%= application.getAttribute("f") %></div>
		<div>request : <%= request.getAttribute("name") %></div>
	
	</div>
	
	<script>
	
	</script>
	
</body>
</html>