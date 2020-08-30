package com.test.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cuspointupdate.do")
public class CusPointUpdate extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cusseq = req.getParameter("seq");
		String bookseq = req.getParameter("bookseq");
		
		req.setAttribute("cusseq", cusseq);
		req.setAttribute("bookseq", bookseq);
		
		CustomerDAO dao = new CustomerDAO();
		CusPointDTO dto2 = new CusPointDTO();
		
		dto2.setCusseq(cusseq);
		dto2.setBookseq(bookseq);
		
		CusPointDTO dto = dao.getPoint(dto2);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customer/cusPointUpdate.jsp");
		dispatcher.forward(req, resp);
	}
}
