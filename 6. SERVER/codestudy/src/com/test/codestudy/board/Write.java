package com.test.codestudy.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/write.do")
public class Write extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 데이터 가져오기(reply)
		//2. 결과 전달 + JSP 호출하기
		
		//1.
		String reply = request.getParameter("reply");
		String thread = request.getParameter("thread");
		String depth = request.getParameter("depth");
		
		//2.
		request.setAttribute("reply", reply);
		request.setAttribute("thread", thread);
		request.setAttribute("depth", depth);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/board/write.jsp");
		dispatcher.forward(request, response);
		
	}

}






