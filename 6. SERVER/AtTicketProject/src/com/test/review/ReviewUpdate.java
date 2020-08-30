package com.test.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.user.show.RankDTO;

@WebServlet("/review/reviewupdate.do")
public class ReviewUpdate extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.getReview(seq);
		
		ArrayList<RankDTO> list = dao.showList();
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/review/reviewUpdate.jsp");
		dispatcher.forward(req, resp);
	}
}
