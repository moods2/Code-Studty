<%@page import="java.util.Enumeration"%>
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
	
		<h1>request 정보</h1>
	
		<table class="table table-bordered">
			<tr>
				<th>헤더명</th>
				<td>헤더값</td>
			</tr>
			<%
			
				//request - 헤더 정보
				// -> 페이지 요청 시 전달되는 여러가지 정보
				
				Enumeration<String> e = request.getHeaderNames();
				
				while (e.hasMoreElements()) {
					String name = e.nextElement();
					//System.out.println(name);
					//System.out.println(request.getHeader(name));
					//System.out.println();
			
			%>
			<tr>
				<td><%= name %></td>
				<td><%= request.getHeader(name) %></td>
			</tr>
			<% } %>			
			
		</table>
		
		<hr>
		
		<p>서버 도메인명: <%= request.getServerName() %></p>
		<p>서버 포트번호: <%= request.getServerPort() %></p>
		<p>요청 URL: <%= request.getRequestURL() %></p>
		
		http://211.63.89.31:8090/jsp/ex11_request.jsp?name=hong
		
		<p>요청 쿼리: <%= request.getQueryString() %></p>
		<p>클라이언트 호스트: <%= request.getRemoteHost() %></p>
		<p>클라이언트 IP: <%= request.getRemoteAddr() %></p>
		<p>프로토콜: <%= request.getProtocol() %></p>
		<p>요청 방식: <%= request.getMethod() %></p>
		<p>컨텍스트 경로: <%= request.getContextPath() %></p>
	
	</div>
	
	<script>
	
	</script>
	
</body>
</html>