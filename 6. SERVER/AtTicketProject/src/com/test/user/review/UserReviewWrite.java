package com.test.user.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userreviewwrite.do")
public class UserReviewWrite extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int cseq = Integer.parseInt(req.getParameter("userseq"));

		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userreviewwrite.jsp");
		dispatcher.forward(req, resp);
		
//		System.out.println(req.getContextPath());
//		System.out.println(session.getAttribute("userid"));
		
	}
	
}

