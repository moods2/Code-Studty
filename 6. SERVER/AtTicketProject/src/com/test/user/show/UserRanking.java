package com.test.user.show;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userranking.do")
public class UserRanking extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		RankDAO dao = new RankDAO();
		
		String sort = req.getParameter("sort");
		
		if (sort == null || sort == "") {
			sort = "all"; //기본값
		}
		
		ArrayList<RankDTO> rank = dao.getRank(sort);
		dao.close();
		
		int count = 0;
		
		for (int i=0; i<rank.size(); i++) {
			count += rank.get(i).getCnt();
		}
		
		req.setAttribute("count", count);
		req.setAttribute("rank", rank);
		req.setAttribute("sort", sort);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userranking.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
