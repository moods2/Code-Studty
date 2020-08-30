package com.test.user.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userqnaupdate.do")
public class UserQnaUpdate extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		String tag = req.getParameter("tag");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String seq = req.getParameter("seq");
		
		
		req.setAttribute("tag", tag);
		req.setAttribute("subject", subject);
		req.setAttribute("content", content);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userqnaupdate.jsp");
		dispatcher.forward(req, resp);
		
//		System.out.println(req.getContextPath());
		
		
//		System.out.println(session.getAttribute("userid"));

	}
	
}
