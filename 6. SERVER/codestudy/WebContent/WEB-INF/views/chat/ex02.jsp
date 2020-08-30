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
	<!-- ex02.jsp -->
	<div class="container">
	
		<h1>WebSocket</h1>
		
		<!--  
		
		웹클라이언트 <-> (통신) <-> 웹서버
		1. 브라우저 <-> 서버 
			- 일반적인 요청 + 응답
			- 링크, <form> 등등..
		2. 자바스크립트 객체 <-> 서버
			a. Ajax
			b. WebSocket(Java 소켓(네트워크) + 스레드)
		
		-->
		
		<input type="button" id="btn1" value="클릭">
		<div id="output"></div>	
		
		<hr>
		
		<input type="button" id="btn2" value="연결하기">
		<input type="button" id="btn3" value="종료하기" disabled>
		<br>
		<input type="text" id="message" disabled>
		<div id="output2"></div>
		
		
		
		
	</div>
	
	<script>
	
		var url = "ws://localhost:8090/codestudy/server";
		var ws;
		
		function print(msg) {
			$("#output2").append("<div>[" 
							+ (new Date()).toLocaleTimeString() + "] " 
							+ msg + "</div>");
		}
	
		$("#btn2").click(function() {
			
			//웹소켓 + 서버 접속
			ws = new WebSocket(url); //****
			
			ws.onopen = function(evt) {
				print("연결되었습니다.");
				
				$("#btn2").attr("disabled", true);
				$("#btn3").attr("disabled", false);
				$("#message").attr("disabled", false);
			};
			
			ws.onclose = function(evt) {
				print("종료되었습니다.");
				
				$("#btn2").attr("disabled", false);
				$("#btn3").attr("disabled", true);
				$("#message").attr("disabled", true);
			};
			
			ws.onmessage = function(evt) {
				
				print("응답받은 데이터 : " + evt.data);
				
			};
			
			ws.onerror = function(evt) {
				console.log(evt.data);
			};
			
		});
		
		$("#btn3").click(function() {
			ws.close(); //****
		});
		
		
		$("#message").keyup(function() {
			if (event.keyCode == 13) {
				//에코서버에 메시지를 전달하기
				ws.send($(this).val());
				$(this).val("");
			}
		});
	
	
	
		$("#btn1").click(function() {
			
			//웹소켓 -> 서버와 통신
			//1. 소켓 생성
			//2. 서버 접속
			//3. 통신
			//4. 서버 접속 종료
			
			//웹소켓 테스트용 서버
			var url = "ws://echo.websocket.org";
			
			//웹소켓 생성 + 서버 접속
			var ws = new WebSocket(url);
			
			//비동기(이벤트)
			ws.onopen = function(evt) {
				console.log("서버와 연결되었습니다.");		
				ws.send("Hello"); //클라이언트 -> 서버
			};
			
			ws.onmessage = function(evt) {
				//서버 -> 클라이언트
				console.log("서버측에서 클라이언트에게 메시지를 보냈습니다.");
				console.log(evt.data);
				
				//소켓 연결 종료
				ws.close();
			};
			
			ws.onclose = function(evt) {
				console.log("서버와 연결이 종료되었습니다.");
			};
			
			ws.onerror = function(evt) {
				console.log("error", evt.data);
			};
			
		});
	
	</script>
</body>
</html>















