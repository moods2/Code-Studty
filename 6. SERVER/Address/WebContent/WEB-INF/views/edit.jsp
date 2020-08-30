<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/inc/asset.jsp" %>
<style>

</style>
</head>
<body>

	<div class="container">
	
		<%@ include file="/inc/header.jsp" %>
		<div class="content">
			
			<form method="POST" action="/address/editok.do">
				
				<table class="table table-bordered add">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" class="form-control short" required="required" value="${address.name}"></td>
					</tr>
					
					<tr>
						<th>나이</th>
						<td><input type="number" name="age" id="age" class="form-control short" required="required" value="${address.age}"></td>
					</tr>
					
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" id="address" class="form-control" required="required" value="${address.address}"></td>
					</tr>				
				</table>
				
				<div class="btns">
					<button type="submit" class="btn btn-primary">수정하기</button>
					<button type="button" onclick="history.back();" class="btn btn-default">돌아가기</button>
				</div>
				
				<input type="hidden" name="seq" value="${address.seq}">
				
			</form>
			
		</div>
	
	</div>
	
	<script>
	
	</script>
	
</body>
</html>
