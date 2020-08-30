package com.test.admin.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminlogout.do")
public class AdminLogout extends HttpServlet{
	
	//로그아웃 서블릿이므로 여기서 세션을 비워줄것이다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminmain.jsp");
		//dispatcher.forward(req, resp);
		
		HttpSession session = req.getSession();
		
		session.invalidate();//세션삭제
		
		
		resp.sendRedirect("/AtTicketProject/index.do");
		
	}
	
}
