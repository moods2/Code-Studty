package com.test.admin.coupon;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/coupon/couponinsertajax.do")
public class CouponInsertAjax extends HttpServlet{
	
	
	//비동기 통신 처리를 수행할것이다.
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String showSeq = req.getParameter("showSeq");//앞에서 선택된 seq 를 받아와야 한다
		
		AdminCouponDAO dao = new AdminCouponDAO();
		
		
		List<String> timeList = new ArrayList<String>();
		timeList = dao.getShowTerm(showSeq);
		
		//System.out.println(timeList.get(0));
		//System.out.println(timeList.get(1));
		
		String startDate = timeList.get(0).substring(0,10);//공연 시작일을 받아와야 한다.--> 여기서 오류가 생기네?
		String endDate = timeList.get(1).substring(0,10);//공연 종료일을 받아와야 한다.
		
		String term = startDate + "~" + endDate;
		
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(term);
		
		writer.close();
		
	}
}
