package com.test.admin.coupon;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/coupon/coupondelete.do")
public class CouponDelete extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//쿠폰을 삭제하기
		
		String delNum = req.getParameter("delNum");
		
		String[] nums = delNum.split(",");

		AdminCouponDAO dao = new AdminCouponDAO();
		
		dao.deleteCoupon(nums);
		
		
	
		resp.sendRedirect("/AtTicketProject/coupon/admincoupon.do");
		
	}
	
}
