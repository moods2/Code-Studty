<%@page import="java.util.Calendar"%>
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
	
		<h1>세션 정보 확인</h1>
		
		<div>Session ID : <%= session.getId() %></div>
		<div>Session Max Inactive Interval(세션 만료 시간) : <%= session.getMaxInactiveInterval() %></div>
		
		<div>Session Creation Time : 
			<%
				long tick = session.getCreationTime();
				Calendar c = Calendar.getInstance();
				c.setTimeInMillis(tick);
				
				out.write(String.format("%tF %tT", c, c));	
				
				long gap = System.currentTimeMillis() - tick;
				out.write("<div>" + (gap / 1000) + "초</div>");
			%>
		</div>
		
		<div>Session isNew : <%= session.isNew() %></div>
		
		<% if (session.getAttribute("color") != null) { %>
		<div>color: <%= session.getAttribute("color") %></div>
		<div>data: <%= session.getAttribute("data") %></div>
		<% } else { %>
		<div>데이터 없음</div>
		<% } %>
		
		<hr>
		
		<div><a href="ex17_set.jsp">세션값 저장하기</a></div>
		<div><a href="ex17_del.jsp">세션값 삭제하기</a></div>
		<div><a href="ex17_reset.jsp">세션 초기화</a></div>
		<div><a href="ex17_interval.jsp">세션 만료시간 지정</a></div>
	
	</div>
	
	<script>
	
	</script>
	
</body>
</html>