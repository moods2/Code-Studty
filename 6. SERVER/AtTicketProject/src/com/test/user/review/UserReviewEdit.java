package com.test.user.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userreviewedit.do")
public class UserReviewEdit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		HttpSession session = req.getSession();
		
		String rseq = req.getParameter("rseq");
		
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.getReview(rseq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userreviewedit.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}

