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
	<!-- template.jsp > ex02.jsp -->
	<div class="container">
	
		<h1>Ajax</h1>
		<!--  
		
		[기본 방식]
		- 페이지 바뀐다. > 브라우저 화면이 바뀐다.(깜빡임)
		1. 버튼을 누른다.
		2. 입력값을 서버로 전송한다.
		3. 서버 > 입력값을 DB값 더한 후 반환한다.
		4. 반환된 값을 화면에 출력한다.
		
		-->
		<form method="POST" action="/ajax/ex02ok.do">
			<input type="text" name="txt1" id="txt1">
			<input type="submit" value="버튼1" id="btn1">
			<div id="result1">결과: <span>${result}</span></div>
		</form>
		
		<hr>
		다른 작업 : <input type="text">
		
	</div>
	
	<script>
	
	</script>
</body>
</html>



