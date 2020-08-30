package com.test.codestudy.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/message.do")
public class Message extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업 -> select
		//2. 결과 반환 + JSP 호출하기
		
		HttpSession session = req.getSession();
		
		//1.
		MemberDAO dao = new MemberDAO();
		
		//쪽지 상태 바꾸기
		dao.updateState(session.getAttribute("seq").toString());
		
		//쪽지 목록 가져오기
		ArrayList<MessageDTO> list = dao.listMessage(session.getAttribute("seq").toString());
		
		for (MessageDTO dto : list) {
			
			String content = dto.getContent();
			
			if (content.length() > 40) {
				content = content.substring(0, 40) + "...";
				dto.setContent(content);
			}
		}
		
		
		//2.
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/message.jsp");
		dispatcher.forward(req, resp);
	}
	
}






