package com.test.user.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLSyntaxErrorException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/usershowfinal.do")
public class UserShowFinal extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		

		
		HttpSession session = req.getSession();//회원의 세션을 받아온다 -> 회원의 정보가 존재함
		
		int cseq = (int)session.getAttribute("userseq");//회원의 seq가 존재
		int hasEggMoney = (int)session.getAttribute("useregg");//회원이 보유한 egg
		
		String what = req.getParameter("seatAvail");//좌석을 나타낸다.
		String useEgg = req.getParameter("eggmoney");//유저의 에그머니 => 얼마나 사용했는지
		String showroundSeq = req.getParameter("showroundSeq");//회차번호
		String couponUserSeq = req.getParameter("couponUserSeq");//쿠폰번호
		
		String inputDate = req.getParameter("inputDate");//공연시작날짜
		String ticketNum = req.getParameter("ticketNum");//티켓번호
		
		String temp = inputDate.substring(0,inputDate.length()-3);
		inputDate = temp;
		
		//마이페이지에 예매작업을 진행해준다.
		UserShowDAO dao = new UserShowDAO();
		BookDTO dto = new BookDTO();
		
		
		dto.setCouponUserSeq(couponUserSeq);
		dto.setInputDate(inputDate);
		dto.setShowroundSeq(showroundSeq);
		dto.setTicketNum(ticketNum);
		dto.setCusseq(cseq);
		
		//System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
		//System.out.println(dto.getTicketNum());
		//System.out.println(dto.getInputDate());
		
		//회원이 사용한 쿠폰을 없애준다.
		
		System.out.println("=-==================");
		System.out.println(couponUserSeq);
		System.out.println("=-==================");
		
		if(!couponUserSeq.equals("undefined")) {
			dao.removeUserCoup(couponUserSeq);			
		}
		//그리고 session에 접근하여 적용해준다.-> 쿠폰은 적용할 필요가 없지.
		
		
		//회원이 사용한 에그머니를 사용한 만큼 없애준다.
		int remainEgg = hasEggMoney - Integer.parseInt(useEgg);
		dao.removeEggMoney(cseq,remainEgg);
		//세션에 접근하여 값을 변경
		session.setAttribute("useregg", remainEgg);
		
		
		
		
		int result = dao.insertBook(dto);//여기문제
		
		System.out.println("result : " + result);
		
		PrintWriter writer = resp.getWriter();
		writer.close();

		
		
	}
	
}
