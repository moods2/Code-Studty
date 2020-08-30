package com.test.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cuscouponupdate.do")
public class CusCouponUpdate extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cusseq = req.getParameter("seq");
		String cuscouponseq = req.getParameter("cuscouponseq");
		
		CustomerDAO dao = new CustomerDAO();
		ArrayList<CouponDTO> list = new ArrayList<CouponDTO>();
		list = dao.getInfoCoupon();
		
		req.setAttribute("list", list);
		req.setAttribute("cusseq", cusseq);
		req.setAttribute("cuscouponseq", cuscouponseq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customer/cusCouponUpdate.jsp");
		dispatcher.forward(req, resp);
	}
}
