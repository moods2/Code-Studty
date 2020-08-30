<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		width: 900px;
	}
</style>
</head>
<body>
	<!-- ex06.jsp -->
	<div class="container">
	
		<h1>우편 번호 검색</h1>
		
		<table class="table table-bordered">
			<tr>
				<th>주소 검색</th>
				<td>
					<input type="text" name="search" id="search" class="form-control">
					<button type="button" id="btnSearch" class="btn btn-default">검색</button>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<select name="address1" id="address1" class="form-control"></select>
				</td>
			</tr>
			<tr>
				<th>상세 주소</th>
				<td>
					<input type="text" name="address2" id="address2" class="form-control">
				</td>
			</tr>
		</table>
		
	</div>
	
	<script>
	
		//click이벤트가 생기면 search함수를 찾아가세요.(괄호를 붙이지 않음)
		$("#btnSearch").click(search);
		
		$("#search").keyup(function(evt) {
			if (evt.keyCode == 13) {
				search();
			}			
		});
		
		function search() {
			//alert();
			
			//검색어 -> 서버 전송 -> DB 작업 -> 목록 반환
			// -> <select> 출력
			$.ajax({
				type: "GET",
				url: "/ajax/ex06ok.do",
				data: "search=" + $("#search").val(),
				dataType: "json",
				success: function(result) {
					//목록 수신 + 처리
					
					//result -> 객체 배열
					$("#address1").html("");//초기화
					
					$(result).each(function(index, item) {
						$("#address1").append("<option>[" + item.zipcode + "] " + item.sido + " " + item.gugun + " " + item.dong + " " + item.bunji + "</option>");
					});
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
			
		};
		
		
		$("#address1").change(function() {
			$("#address2").focus();
		});
	
	</script>
</body>
</html>















