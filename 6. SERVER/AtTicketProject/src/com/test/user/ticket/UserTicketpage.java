package com.test.user.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userticketpage.do")
public class UserTicketpage extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//여기서 좌석상황 쿠폰 등등 다 넘겨줘야된다.
		//회차번호를 넣어줘야 되는거 아닌가?
		
		HttpSession session = req.getSession();
		int userSeq = (int)session.getAttribute("userseq");//유저 seq
		
		
		String showSeq = req.getParameter("showSeq");//공연seq
		
		UserShowDAO dao = new UserShowDAO();
		UserShowDTO dto = new UserShowDTO();
		
		dto = dao.getShowInfo(showSeq);//해당번호에 해당하는 show 객체를 가져온다.
		
		//--show 객체에 대한  공연건물이름,공연장소에 대한 데이터를 불러온다.
		List<String> showPlace = dao.getPlace(showSeq);
		String splaceName = showPlace.get(0);
		String splace = showPlace.get(1);
		
		
		//오늘 날짜+1를 넘겨줄 것이다
		Calendar minDate = Calendar.getInstance();
		minDate.add(Calendar.DATE, 1);//날짜 하루뒤부터 예약이 가능함.
		
		String minDateInfo = minDate.get(Calendar.YEAR) + "-" + (minDate.get(Calendar.MONTH) + 1) + "-" + (minDate.get(Calendar.DATE));
		
		//가지고 있는 쿠폰을 넘겨준다.
		List<UserShowCouponDTO> hasCouponList = dao.getMyCouponList(userSeq,showSeq);
		 
		
		//가격을 넘겨줘야 한다.
		int tickectPrice = dao.getTicketPrice(showSeq);//공연정보에 대한 price를 가져온다.
		
		
		
		//전화번호
		String[] userTelNum = ((String)session.getAttribute("usertel")).split("-");
		
		//이메일
		String[] userEmail = ((String)session.getAttribute("useremail")).split("@");

		//초기 에그머니
		int userEggMoney = (int)session.getAttribute("useregg");
		
		//취소 가능 마감시간을 위해 공연 시작일자를 받아올것이다.
		
		
		//-----------------------------------------------------------------------------------//
		req.setAttribute("userEggMoney", userEggMoney);//에그머니 넘겨준다.
		req.setAttribute("userEmail", userEmail);//유저의 이메일을 넘겨준다
		req.setAttribute("userTelNum", userTelNum);//유저의 전화번호를 넘겨준다
		req.setAttribute("tickectPrice", tickectPrice);//티켓 가격 넘겨준다
		req.setAttribute("hasCouponList", hasCouponList);//가지고 있는 쿠폰 넘겨준다.
		req.setAttribute("splaceName", splaceName);//공연장소이름
		req.setAttribute("dto", dto);//show 객체자체를 넘겨줄것이다.
		req.setAttribute("minDateInfo", minDateInfo);//최소공연시작 선택일
		req.setAttribute("showSeq", showSeq);//공연번호 넘겨주기
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userticketpage.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
}
