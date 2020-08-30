package com.test.user.show;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userpromotionadd.do")
public class UserPromotionAdd extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//여기서 직접적으로 쿠폰 추가를 수행할것이다.
		//사진을 누르면 쿠폰을 줄건데 여기서 계속 누르면 계속 받을 수 있으므로 조심해야 한다.~ 계속 받을 수 없도록 제어해야한다.
		
		
		HttpSession session = req.getSession();//세션을 불러온다.
		int memberSeq = (int)session.getAttribute("userseq");//회원의 번호가 떨어질것이다.
		
		
	
		//String memberSeq = "1";//테스트용
		//우리는 4번에 대한 쿠폰을 테스트 할것이다.
		int coupNum = 4;//쿠폰넘버
		
		
		UserPromotionDAO dao = new UserPromotionDAO();
		//1. 유저가 해당 쿠폰을 가지고 있는지 검사할 것이다.
		int hasResult = dao.getExistCoupon(memberSeq,coupNum);
		

		
		if (hasResult == 1) {
			//이미 해당 쿠폰을 발급받은 경우
			//result = "해당 쿠폰을 소유중입니다.";
			
		} else {
			//해당 쿠폰을 발급받지 않은 경우.
			//result = 1;
			dao.addCoupon(memberSeq,coupNum);
			
			
		}
		
		
		PrintWriter writer = resp.getWriter();
		writer.print(hasResult);
		writer.close();
		
	
		
		
	}
}
