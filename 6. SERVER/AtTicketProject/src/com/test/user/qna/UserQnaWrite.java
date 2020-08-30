package com.test.user.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userqnawrite.do")
public class UserQnaWrite extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String index = req.getParameter("index");
		
		
		req.setAttribute("index", index);
		
		System.out.println(index);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userqnawrite.jsp");
		dispatcher.forward(req, resp);
		
		
//		System.out.println(req.getContextPath());
		
		
//		System.out.println(session.getAttribute("userid"));
		
	}
	
	
	
}
