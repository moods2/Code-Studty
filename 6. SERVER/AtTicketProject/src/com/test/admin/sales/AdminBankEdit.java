package com.test.admin.sales;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminbankedit.do")
public class AdminBankEdit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String seq = req.getParameter("seq");

		SalesDAO dao = new SalesDAO();
		BankDTO dto = dao.getBank(seq);
	
		req.setAttribute("dto", dto);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/sales/adminbankedit.jsp");
		dispatcher.forward(req, resp);
	}
	
}
