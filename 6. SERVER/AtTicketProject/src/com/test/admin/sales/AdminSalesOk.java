package com.test.admin.sales;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/adminsalesok.do")
public class AdminSalesOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String sdate = req.getParameter("sdate");
		String edate = req.getParameter("edate");
		
		SalesDAO dao = new SalesDAO();
		SalesDTO dto = new SalesDTO();
		
		dto.setSdate(sdate);
		dto.setEdate(edate);
		
		int total = dao.getTotalSales(dto);
		
		String strTotal = String.format("%,d",total);
		
		req.setAttribute("dto", dto);
		req.setAttribute("total", strTotal);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/sales/sales.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
