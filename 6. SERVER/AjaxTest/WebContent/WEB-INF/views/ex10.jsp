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
	
	.result td:nth-child(1) { width: 170px; }
	.result td:nth-child(2) { width: auto; }
	.result td:nth-child(3) { width: 130px; }
	.result td:nth-child(4) { width: 140px; }
	.result td:nth-child(5) { width: 150px; }
	
</style>
</head>
<body>
	<!-- ex10.jsp -->
	<div class="container">
	
		<h1>네이버 도서 검색</h1>
		
		<div class="well">
			<input type="text" name="word" id="word" class="form-control" placeholder="검색어를 입력하세요.">
		</div>
		
		<hr>
		
		<table class="result table table-bordered">
			<thead>
				<tr>
					<th>표지</th>
					<th>제목</th>
					<th>저자</th>
					<th>가격</th>
					<th>출판사</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
		<hr>
		<input type="button" value="다음 10권 보기" id="btnNext">
		
	</div>
	
	<script>
	
		var start = 1;
	
		$("#btnNext").click(function() {
			start += 10;
			search(1);
		});
	
		$("#word").keyup(search);
		
		function search(n) {
			
			var word = $("#word").val();
			
			if (n == 1 || event.keyCode == 13) {
				if (word.trim().length > 0) {
					
					//기존 검색 결과를 초기화
					$(".result tbody").html("");	
					
					$.ajax({
						type: "GET",
						url: "/ajax/ex10ok.do",
						data: "query=" + word + "&start=" + start,
						dataType: "json",
						success: function(result) {
							//alert(result.total);
							
							$(result.items).each(function(index, item) {
								
								//책 1권
								//console.log(item.title);
								var temp = "";
								
								temp += "<tr>";
								
								temp += "<td><img src='" + item.image + "' style='width: 80px; display: block; margin: 5px auto;'></td>";
								temp += "<td>" + item.title + "</td>";
								temp += "<td>" + item.author + "</td>";
								
								if (item.discount != "") {
									temp += "<td><s>" + item.price + "원</s><br>" + item.discount + "원</td>";
								} else {
									temp += "<td>" + item.price + "원</td>";
								}
								
								temp += "<td>" + item.publisher + "</td>";
								
								temp += "</tr>";
								
								$(".result tbody").append(temp);
								
							});
							
						},
						error: function(a, b, c) {
							console.log(a, b, c);
						}
						
					});
					
				}
			}
		};
	
	</script>
</body>
</html>















