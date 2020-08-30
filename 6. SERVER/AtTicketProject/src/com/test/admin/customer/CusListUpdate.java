package com.test.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cuslistupdate.do")
public class CusListUpdate extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String search = req.getParameter("search");
		String page = req.getParameter("page");
		String seq = req.getParameter("seq");
		
	
		
		
		CustomerDAO dao = new CustomerDAO();
		CustomerDTO dto2 = new CustomerDTO();
		
		dto2.setSeq(seq);
		
		CustomerDTO dto = dao.get(dto2);
		ArrayList<String> list1 = dao.getGrade();
		
		req.setAttribute("list1", list1);
		req.setAttribute("seq", seq);
		req.setAttribute("dto", dto);	
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customer/cusListUpdate.jsp");
		dispatcher.forward(req, resp);
	}
}
