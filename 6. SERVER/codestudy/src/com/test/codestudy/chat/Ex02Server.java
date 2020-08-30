package com.test.codestudy.chat;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

//WebSocket 서버
@ServerEndpoint("/server")
public class Ex02Server {

	//대기 -> 클라이언트 연결 요청
	@OnOpen
	public void handleOpen() {
		System.out.println("클라이언트가 접속했습니다.");
	}
	
	@OnClose
	public void handleClose() {
		//ws.close()
		System.out.println("클라이언트가 종료되었습니다.");
	}
	
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	
	@OnMessage
	public String handleMessage(String message) {
		
		System.out.println("클라이언트가 메시지를 전달했습니다. : " + message);
		
		return "(응답)" + message;
		
	}
	
}
