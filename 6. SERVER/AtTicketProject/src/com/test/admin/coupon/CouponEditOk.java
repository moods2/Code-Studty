package com.test.admin.coupon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/coupon/couponeditok.do")
public class CouponEditOk extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//여기서 실질으로 쿠폰의 수정을 실시할것이다.
		
		req.setCharacterEncoding("UTF-8");
		
		String titleSeq = req.getParameter("editNum");//수정해야할 쿠폰 번호
		String titletxt = req.getParameter("titletxt");//쿠폰명
		String datefirst = req.getParameter("datefirst").replace("-", "/");//쿠폰 사용기간 시작
		String datesecond = req.getParameter("datesecond").replace("-", "/");;//쿠폰 사용기간 끝
		String pricetxt = req.getParameter("pricetxt");//할인금액
		String avashow = req.getParameter("avashow");//해당 공연 번호
		
		List<String> list = new ArrayList<String>();
		
		list.add(titleSeq);//쿠폰 seq
		list.add(titletxt);//쿠폰명
		list.add(datefirst);//시작일
		list.add(datesecond);//종료일
		list.add(pricetxt);//차감액
		list.add(avashow);//해당공연 seq
		
		AdminCouponDAO dao = new AdminCouponDAO();
		
		dao.editCoupon(list);//새로 쿠폰 수정 성공
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/coupon/couponeditok.jsp");
		dispatcher.forward(req, resp);
	}
	
}
