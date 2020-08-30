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
		width: 500px;
		position: relative;
	}
	#list {
		border: 1px solid #DDD;
		width: 333px;
		position: absolute;
		left: 24px;
		top: 112px;
		background-color: white;
		border-radius: 3px;
		display: none;
	}
	#list footer {
		font-size: 12px;
		background-color: #CCC;
		text-align: right;
		padding: 5px 5px 3px 3px;
	}
	#list .item {
		padding: 5px;
		padding-left: 10px;
		cursor: pointer;
	}
	/* 
	#list .item:hover {
		background-color: #DDD;
	}
	*/
</style>
</head>
<body>
	<!-- ex09.jsp -->
	<div class="container">
	
		<h1>추천 검색어</h1>
		
		<table class="table table-bordered">
			<tr>
				<td><input type="text" name="search" id="search" class="form-control" autocomplete="off"></td>
				<td><button type="button" class="btn btn-default">검색</button></td>
			</tr>
		</table>
		
		<div id="list">
			<section>
			</section>
			<footer>추천 검색어</footer>
		</div>
		
	</div>
	
	<script>
	
		var index = -1;
	
		$("#search").keyup(function() {
			
			if (event.keyCode == 38) { //위
				
				index--;
				if (index < 0) { index = 0; }
				
				$("#list .item").css("background-color", "#FFF");				
				$("#list .item").eq(index).css("background-color", "#DDD");
				
				$("#search").val($("#list .item").eq(index).text());
				return;			
			} else if (event.keyCode == 40) { //아래
				
				index++;
			
				if (index > $("#list .item").length-1) { index--; }
				
				$("#list .item").css("background-color", "#FFF");
				$("#list .item").eq(index).css("background-color", "#DDD");
						
				$("#search").val($("#list .item").eq(index).text());
				return;
			} else if (event.keyCode == 13) {
				
				$("#search").val($("#list .item").eq(index).text());
				$("#list").hide();
				
				index = -1; //초기화
				
				return;
			}
						
			//검색어
			var word = $("#search").val();
			
			//서버로 전송
			//GET -> 서버로 전송하는 데이터의 양이 적을 때
			//POST -> 서버로 전송하는 데이터의 양이 많을 때 
			
			//검색어가 존재할때만 전송
			if (word.trim().length > 0) {
				
				//초성이 없는 경우만 전송
				// - 영어대소문자 + 숫자 + 공백 + 특수문자(_) + 한글
				// - 정규식 -> ^[A-Za-z0-9\s_가-힣]{1,}$
				var regex = /^[A-Za-z0-9\s_가-힣]{1,}$/gi;
				
				//console.log(word, regex.test(word));
				
				if (regex.test(word)) {
			
					$.ajax({
						type: "GET",
						url: "/ajax/ex09ok.do",
						data: "word=" + word,
						dataType: "json",
						success: function(result) {
							
							//초기화
							$("#list section").html("");
							
							//추가하기
							$(result).each(function(index, item) {
								
								//item == 검색어
								$("#list section")
									.append("<div class='item' onclick='sel();' onmouseover='itemover();' onmouseout='itemout();'>" + item + "</div>");						
								
							});
							$("#list").show();
						},
						error: function(a,b,c) {
							console.log(a,b,c);
						}
					});
				}
			
			} else {
				$("#list").hide();
			}
			
		});
		
		
		function sel() {
			//$(this) -> jQuery를 사용해서 이벤트를 걸었을 때만 사용
			var word = event.srcElement.innerText;
			//alert(word);
			
			$("#search").val(word);
			$("#list").hide();	
			
			//alert($(event.srcElement).index());
			
			//폼.submit();
		}
		
		function itemover() {
			
			$(event.srcElement).css("background-color", "#DDD");
			
			$("#list .item").eq(index).css("background-color", "#FFF");
			
			index = $(event.srcElement).index();
			
		}
		
		function itemout() {
			
			$(event.srcElement).css("background-color", "#FFF");
			
		}
		
		
	
	</script>
</body>
</html>















