package com.test.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusviewupdate.do")
public class CusViewUpdate extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cusseq = req.getParameter("cusseq");
		String bookseq = req.getParameter("bookseq");
		
		
		req.setAttribute("seq", cusseq);
		req.setAttribute("bookseq", bookseq);
		
		
		CustomerDAO dao = new CustomerDAO();
		//CusShowViewDTO dto2 = new CusShowViewDTO();
		
		ArrayList<ShowDTO> list = new ArrayList<ShowDTO>();
		list = dao.getShow();
		
		req.setAttribute("list", list);
		
		dao = new CustomerDAO();
		//dto2.setCusseq(cusseq);
		//dto2.setBookseq(bookseq);
		
		CusShowViewDTO dto = dao.getShowView(bookseq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customer/cusViewUpdate.jsp");
		dispatcher.forward(req, resp);
	}

}
