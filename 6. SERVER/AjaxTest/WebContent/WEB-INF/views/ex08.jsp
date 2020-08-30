<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/ajax/css/bootstrap.css">
<script src="/ajax/js/jquery-1.12.4.js"></script>
<script src="/ajax/js/bootstrap.js"></script>
<style>
	.container {
		width: 600px;
	}
</style>
</head>
<body>
	<!-- ex08.jsp -->
	<div class="container">
	
		<h1>게시판</h1>
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.seq}</td>
					<td>${dto.subject}</td>
					<td>${dto.name}</td>
					<td>${dto.regdate}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div>
			<button type="button" id="btnMore">더보기</button>
		</div>
		
	</div>
	
	<script>
		
		var begin = ${map.begin+10};
		var end = ${map.end+10};
	
		$("#btnMore").click(function() {
			
			//서버에게 그 다음 10개 게시물을 주세요~ 요청
			$.ajax({
				type: "GET",
				url: "/ajax/ex08ok.do",
				data: "begin=" + begin + "&end=" + end,
				dataType: "json",
				success: function(result) {
					
					document.title = result.length;
					
					//alert(result.length);
					$(result).each(function(index, item) {
						//게시물 1개
						var temp = "";
						temp += "<tr>";
						temp += "<td>" + item.seq + "</td>";
						temp += "<td>" + item.subject + "</td>";
						temp += "<td>" + item.name + "</td>";
						temp += "<td>" + item.regdate + "</td>";
						temp += "</tr>";
						
						$("table > tbody").append(temp);
					});
					
				},
				error: function(a,b,c) {
					alert("더 이상 가져올 게시물이 없습니다.");
					$("#btnMore").attr("disabled", true);
					console.log(a,b,c);
				}
				
				
			}); //ajax
			
			begin += 10;
			end += 10;
			
		});
	</script>
</body>
</html>















