package com.test.admin.show;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminshowedit.do")
public class AdminShowEdit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ShowDAO dao = new ShowDAO();	
		ShowDTO dto = dao.loadview(seq);
		TagDTO tdto = dao.loadTag(seq);

		req.setAttribute("dto", dto);
		req.setAttribute("tdto", tdto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/show/adminshowedit.jsp");
		dispatcher.forward(req, resp);
	}
}
