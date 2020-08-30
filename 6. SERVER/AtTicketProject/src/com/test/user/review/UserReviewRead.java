package com.test.user.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userreviewread.do")
public class UserReviewRead extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		String rseq = req.getParameter("rseq");
		
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.getReview(rseq);
		
		System.out.println("read : " + session.getAttribute("read"));
		System.out.println((boolean)session.getAttribute("read"));
		
		if(session.getAttribute("read") == null || (boolean)session.getAttribute("read") == false) {
			dao.updateReadcount(rseq); 
			session.setAttribute("read", true);
		}
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userreviewread.jsp");
		dispatcher.forward(req, resp);
	
	}
	
}
