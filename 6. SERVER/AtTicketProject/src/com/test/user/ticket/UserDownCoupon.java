package com.test.user.ticket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userdowncoupon.do")
public class UserDownCoupon extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		int userSeq = (int)session.getAttribute("userseq");//회원의 seq
		
		String couponSeq = req.getParameter("couponseq");//쿠폰 seq
		String showSeq = req.getParameter("showseq");//공연번호
		
		//확인
		System.out.println("=====****==========");
		System.out.println(userSeq);//회원의 seq
		System.out.println(couponSeq);//쿠폰의 seq
		System.out.println(showSeq);//공연의 seq
		System.out.println("=========*****======");
		
		UserShowDAO dao = new UserShowDAO();
		
		int checkCoupon = dao.getCheckCoupon(userSeq,couponSeq);//쿠폰을 가지고 있는지 아닌지 체크한다.
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();
		String temp = "";
		temp += "{";
		
		if (checkCoupon != 0) {
			//이미 내가 보유하고 있는 쿠폰
			temp += "\"pass\" : \"fail\"";
			
		} else {
			//내가 보유하고 있지 않은 쿠폰
			//쿠폰을 다운받아준다.
			dao.downCoupon(userSeq,couponSeq);
			temp += "\"pass\" : \"success\"";
			
		}
		
		temp += "}";
		
		writer.print(temp);
		writer.close();
		
		
	}
}
