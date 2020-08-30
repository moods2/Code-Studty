<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<!-- ex03.jsp -->
	<div class="container">
	
		<h1>1:1 채팅</h1>
		
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<td>
					<input type="text" name="user" id="user"
						class="form-control" placeholder="유저명">
				</td>
				<td>
					<button type="button" id="btnConnect" class="btn btn-default">접속하기</button>
					<button type="button" id="btnDisconnect" class="btn btn-default" disabled>종료하기</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="output" style="width: 100%; height: 300px; padding: 20px; overflow: auto;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="message" id="message" placeholder="대화내용을 입력하세요." class="form-control" disabled>
				</td>
			</tr>
		</table>
		
	</div>
	
	<script>
	
		//서버 주소
		var url = "ws://localhost:8090/codestudy/ex03server";
		var ws;
		
		//연결하기
		$("#btnConnect").click(function() {
			
			//유저명 확인
			if ($("#user").val().trim().length != 0) {
				
				//서버와 소켓 연결하기
				ws = new WebSocket(url);
				
				//소켓 이벤트 매핑
				ws.onopen = function() {
					print($("#user").val(), "연결되었습니다.");
					$("#user").attr("disabled", true);
					$("#btnConnect").attr("disabled", true);
					$("#btnDisconnect").attr("disabled", false);
					$("#message").attr("disabled", false);
					$("#message").focus();
				};
				ws.onclose = function() {
					print($("#user").val(), "종료되었습니다.");
					
					$("#user").attr("disabled", false);
					$("#btnConnect").attr("disabled", false);
					$("#btnDisconnect").attr("disabled", true);
					$("#message").attr("disabled", true);
					$("#user").val("");
					$("#user").focus();
				};
				ws.onerror = function(evt) {
					console.log(evt.data);					
				};
				ws.onmessage = function(evt) {
					//서버가 클라이언트에게 저달한 메시지
					var index = evt.data.indexOf("#");
					var user = evt.data.substring(0, index);
					var txt = evt.data.substring(index + 1);
					print(user, txt);
					$("#output").scrollTop($("#output").prop("scrollHeight"));
				};
				
			} else {
				alert("유저명을 입력하세요.");
			}
			
		});
		
		$("#user").keydown(function() {
			if (event.keyCode == 13) {
				$("#btnConnect").click();
			}
		});
		
		function print(user, txt) {
			var temp = "";
			temp += "<div>"
			temp += "[" + user + "]";
			temp += txt;
			temp += "<span style='font-size: 11px; color: #777;'>" + (new Date()).toLocaleTimeString() + "</span>";
			temp += "</div>";
			
			$("#output").append("<div>" + temp + "</div>");
		};
		
		
		
		
		//종료하기
		$("#btnDisconnect").click(function() {
			ws.close();
		});
		
		//메시지 전송하기
		$("#message").keyup(function() {
			
			if (event.keyCode == 13) {
				
				//서버에게 메시지 전달
				ws.send($("#user").val() + "#" + $(this).val());
				
				print($("#user").val(), $(this).val());
				$(this).val("");
				
				$("#output").scrollTop($("#output").prop("scrollHeight"));
			};
			
		});
	
	</script>
</body>
</html>















