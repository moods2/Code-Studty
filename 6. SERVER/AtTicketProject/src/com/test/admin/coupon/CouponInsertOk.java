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

@WebServlet("/coupon/couponinsertok.do")
public class CouponInsertOk extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//여기서 새로운 쿠폰을 추가해줄 작업을 수행할 것이다. -> insert 작업 수행.
		
		req.setCharacterEncoding("UTF-8");
		
		String titletxt = req.getParameter("titletxt");//쿠폰명
		String datefirst = req.getParameter("datefirst").replace("-", "/");//쿠폰 사용기간 시작
		String datesecond = req.getParameter("datesecond").replace("-", "/");;//쿠폰 사용기간 끝
		String pricetxt = req.getParameter("pricetxt");//할인금액
		String avashow = req.getParameter("avashow");//해당 공연 번호
		
		
		
		  System.out.println(titletxt); 
		  System.out.println(datefirst);
		  System.out.println(datesecond); 
		  System.out.println(pricetxt);
		  System.out.println(avashow);
		 
		
		List<String> list = new ArrayList<String>();
		list.add(titletxt);//쿠폰명
		list.add(datefirst);//시작일
		list.add(datesecond);//종료일
		list.add(pricetxt);//차감액
		list.add(avashow);//해당공연 seq
		
		AdminCouponDAO dao = new AdminCouponDAO();
		
		dao.insertCoupon(list);//새로 쿠폰 추가 성공
		
		
		//resp.sendRedirect("");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/coupon/couponinsertok.jsp");
		dispatcher.forward(req, resp);
		
		
		
		
	}
	
}
