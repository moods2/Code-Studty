package com.test.admin.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/index.do")//xml 연결
public class Index extends HttpServlet{
	
	//관리자 로그인 시작하는 페이지
	//링크만 연결할 것이므로  Get방식으로 연결해준다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
		dispatcher.forward(req, resp);
		
		HttpSession session = req.getSession();
		System.out.println(session.getAttribute("id"));//처음에는 세션내부에 값이 없어지는게 정상이다.
		
		

	}	
}


