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
	.item {
		margin: 10px;
		padding: 5px;
		text-align: right;
		border-left: 7px solid #CCC;
		padding-right: 10px;
		border-bottom-right-radius: 10px;
	}
</style>
</head>
<body>
	<!-- template.jsp > ex01.jsp -->
	<div class="container">
	
		<h1>설문조사(결과)</h1>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				Q. ${dto.question}
			</div>
			<div class="panel-body">
				<div class="item bg-info" id="item1">
					${dto.item1}
					<span class="badge">${dto.cnt1}</span>
				</div>
				<div class="item bg-success" id="item2">
					${dto.item2}
					<span class="badge">${dto.cnt2}</span>
				</div>
				<div class="item bg-warning" id="item3">
					${dto.item3}
					<span class="badge">${dto.cnt3}</span>
				</div>
				<div class="item bg-danger" id="item4">
					${dto.item4}
					<span class="badge">${dto.cnt4}</span>
				</div>
			</div>
		</div>
		
		
		<h1>또 다른 내용</h1>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				또 다른 내용
			</div>
			<div class="panel-body">
				<input type="text" class="form-control">
			</div>
		</div>
		
		
	</div>
	
	<script>
	
	$("#item1").css("width", "${dto.cnt1 * 40}px");
	$("#item2").css("width", "${dto.cnt2 * 40}px");
	$("#item3").css("width", "${dto.cnt3 * 40}px");
	$("#item4").css("width", "${dto.cnt4 * 40}px");
	
	/* setTimeout(function() {
		location.reload(); //F5
	}, 5000); */
	
	setInterval(function() {
		
		$.ajax({
			type: "POST",
			url: "/ajax/ex01ok.do",
			data: "seq=1", //가져올 설문조사 번호
			success: function(result) {
				//받고 싶은 데이터? 투표수x4개
				//7, 10, 2, 5 - CSV
				//alert(result);
				
				var item = result.split(",");
				
				item.forEach(function(item, index) {
					$("#item" + (index + 1)).css("width", (item * 40) + "px");
				});
			},
			error: function(a, b, c) {
				console.log(a, b, c);
			}
		});
		
	}, 5000);
	
	</script>
</body>
</html>















