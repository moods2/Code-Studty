package com.test.admin.show;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminshowview.do")
public class AdminShowView extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String page = req.getParameter("page");
		
		ShowDAO dao = new ShowDAO();
		ShowDTO dto = dao.loadview(seq);
		TagDTO tdto = dao.loadTag(seq);
		
//		System.out.println(dto.toString());
		
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		req.setAttribute("tdto", tdto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/show/adminshowview.jsp");
		dispatcher.forward(req, resp);
	}
	
}
