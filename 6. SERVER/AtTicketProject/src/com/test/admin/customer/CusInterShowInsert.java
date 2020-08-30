package com.test.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusintershowinsert.do")
public class CusInterShowInsert extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		CustomerDAO dao = new CustomerDAO();
		
		ArrayList<ShowDTO> list = new ArrayList<ShowDTO>();
		list = dao.getShow();
		
		req.setAttribute("seq", seq);
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customer/cusInterShowInsert.jsp");
		dispatcher.forward(req, resp);
	}
}
