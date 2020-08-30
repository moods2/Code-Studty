package com.test.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/customer/admincustomerinfo.do")
public class AdminCustomerInfo extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String search = req.getParameter("search");
			String page = req.getParameter("page");
			String seq = req.getParameter("seq");
			
			CustomerDAO dao = new CustomerDAO();
			ArrayList<CusBookDTO> list = dao.getBook(seq);
			ArrayList<CusPointDTO> list2 = dao.getPoint(seq);
			ArrayList<CusMyShowDTO> list3 = dao.getInterest(seq);
			ArrayList<CusShowViewDTO> list4 = dao.getViewShow(seq);
			ArrayList<CusCouponDTO> list5 = dao.getCoupon(seq);
			
			req.setAttribute("list",list);
			req.setAttribute("seq", seq);
			req.setAttribute("search", search);
			req.setAttribute("page", page);
			req.setAttribute("list2", list2);
			req.setAttribute("list3", list3);
			req.setAttribute("list4", list4);
			req.setAttribute("list5", list5);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customer/adminCustomerInfo.jsp");
			dispatcher.forward(req, resp);
			
		}
}
