package com.test.codestudy.chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//웹소켓 서버
@ServerEndpoint("/ex03server")
public class Ex03Server {

	//현재 서버에 접속한 클라이언트의 WebSocket Session 목록
	private static ArrayList<Session> list = new ArrayList<Session>();
	
	//클라이언트(브라우저)가 연결을 요청 + 접속
	@OnOpen
	public void handleOpen(Session userSession) {
		System.out.println("클라이언트 접속 성공");
		
		list.add(userSession);//접속자 관리
		
		for (Session session : list) {
			if (session != userSession) {
				//접속한 클라이언트가 아닌 접속자
				try {
					session.getBasicRemote().sendText("다른 유저가 접속했습니다.");
				} catch (IOException e) {
					e.printStackTrace();
				};
			}
		}
	}
	
	//클라이언트가 연결을 종료 요청 + 해제
	@OnClose
	public void handleClose(Session userSession) {
		System.out.println("클라이언트 접속 해제");
		
		//접속을 끊은 유저의 세션을 제거한다.
		list.remove(userSession);
	}
	
	//통신 중 에러 발생
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	
	//클라이언트가 서버에게 메시지를 전달
	@OnMessage
	public void handleMessage(String message, Session userSession) {
		
		int index = message.indexOf("#");
		String user = message.substring(0, index);
		String txt = message.substring(index + 1);
		//System.out.println(user);
		//System.out.println(txt);
		
		//한사람이 보낸 메시지를 다른 사람에게 전달
		for (Session session : list) {
			if (session != userSession) {
				try {
					session.getBasicRemote().sendText(message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	
}
