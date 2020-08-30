package com.test.user.ticket;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/usertickekting.do")
public class UserTickekting extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		int mySeq = -1;
		//나의 seq 가져오기 
		if (session.getAttribute("userseq") != null) {
			mySeq = (int)session.getAttribute("userseq");
		} 
		
		
		
		String conSeq = req.getParameter("seq");//넘어온 공연seq(실전용)
		//String conSeq = "2";//테스트용 공연


		//System.out.println("?!what");//왜 두번씩 나타나지?
		
		UserShowDAO dao = new UserShowDAO();
		UserShowDTO dto = new UserShowDTO();
		
		dto = dao.getShowInfo(conSeq);//해당번호에 해당하는 show 객체를 가져온다.
		

		
		//--show 객체에 대한  공연건물이름,공연장소에 대한 데이터를 불러온다.
		List<String> showPlace = dao.getPlace(conSeq);
		String splaceName = showPlace.get(0);
		String splace = showPlace.get(1);
		
		
		//--관람시간을 가져올것이다.
		String showDuration = dao.getShowTerm(conSeq);
		
		
		//--티켓 가격을 넘길건데 ,를 붙여서 넘길것이다.
		String ticketPc = commaPrice(dto.getPrice());
		
		//--총 좋아요 수를 넘겨줄 것이다.
		String likeCount = dao.getLikes(conSeq);
		
		//내가 좋아요 
		int likecheck = dao.likecheck(conSeq,mySeq);
		
		int likePush = 1;//기본적으로 안누른상태라고 생각해보자
		
		if (likecheck != 0) {
			//내가 한번이라도 건든 좋아요
			//내가 이미 좋아요를 누른 데이터인지 확인한다 -> 있긴있는데 눌렀는지 안눌렀는지
			likePush = dao.getLikeTrue(conSeq,mySeq);//0 또는 1이 나올것이다.	
			
		} else {
			//해당 show 에 대해 아예 한번도 좋아요를 누르지 않은경우!.
			likePush = 1; 
		}
		

		//-- 주최 , 기획사 정보 , 전화번호 를 받아올 것이다.
		List<String> agencyInfo = dao.getAgencyInfo(conSeq);
		String agencyHost = agencyInfo.get(0);
		String agencyManage = agencyInfo.get(1);
		String agencyTel = agencyInfo.get(2);
		
		
		
		//해당 공연에 허용되는 쿠폰도 가져갈 것이다.
		List<UserShowCouponDTO> couponList = dao.getCouponList(conSeq);
		int couponListLen = couponList.size();
		
		//해당 공연분류의 랭킹 1~5에 대한 정보를 가져오자. -> 이미지 이름과 해당 공연의 seq 를 받은 객체가 UserShowTopFive 라고 보면 된다.
		List<UserShowTopFive> bigFiveImgList = dao.getFiveImgList(dto.getGenre());
		
		//랭킹사진 링크를 바꿔주기 위한 작업
		String rankingImgUrl = "";
		if (dto.getGenre().equals("musical")) {
			rankingImgUrl = "http://tkfile.yes24.com/imgNew/sub/rn-tit-15457.png";
		} else if (dto.getGenre().equals("theater")) {
			rankingImgUrl = "http://tkfile.yes24.com/imgNew/sub/rn-tit-15458.png";
		} else if (dto.getGenre().equals("concert")) {
			rankingImgUrl = "http://tkfile.yes24.com/imgNew/sub/rn-tit-15456.png";
		} else if (dto.getGenre().equals("exhibition")) {
			rankingImgUrl = "http://tkfile.yes24.com/imgNew/sub/rn-tit-15460.png";
		} else if (dto.getGenre().equals("classic")) {
			rankingImgUrl = "http://tkfile.yes24.com/imgNew/sub/rn-tit-15459.png";
		}
		//오늘 날짜+1를 넘겨줄 것이다
		Calendar minDate = Calendar.getInstance();
		minDate.add(Calendar.DATE, 1);//날짜 하루뒤부터 예약이 가능함.
		
		String minDateInfo = minDate.get(Calendar.YEAR) + "-" + (minDate.get(Calendar.MONTH) + 1) + "-" + (minDate.get(Calendar.DATE));
		
		
		
		
		//********** req에 넘겨줄 정보들 **********
		req.setAttribute("minDateInfo", minDateInfo);//최소공연시작 선택일
		req.setAttribute("rankingImgUrl", rankingImgUrl);//랭킹사진 링크를 바꿔주기 위한 작업
		req.setAttribute("bigFiveImgList", bigFiveImgList);//랭킹5개!
		req.setAttribute("couponListLen", couponListLen);//가용 쿠폰 몇개인지 넘겨준다.
		req.setAttribute("couponList", couponList);//해당 show에서 사용할 수 있는 쿠폰리스트.
		req.setAttribute("likePush", likePush);//1이 넘어가면 해제 되어있는 상태 0 이 넘어가면 좋아요가 눌린상태
		req.setAttribute("agencyHost", agencyHost);//주최 이름
		req.setAttribute("agencyManage", agencyManage);//주관 이름
		req.setAttribute("agencyTel", agencyTel);//문의번호
		req.setAttribute("likeCount",likeCount);//좋아요 수를 넘겨줄 것이다.
		req.setAttribute("ticketPc", ticketPc);//티켓 가격을 넘겨준다.
		req.setAttribute("showDuration", showDuration);//공연 시간 기간
		req.setAttribute("splaceName", splaceName);//show 공연 장소이름
		req.setAttribute("splace", splace);//show 공연 장소 주소
		req.setAttribute("dto", dto);//show의 기본적인 정보.
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userticketing.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	
	//가격에 ,를 찍어주기 위함이다.
	public static String commaPrice(String price) {
		
		int priceLen = price.length();
		
		String newPrice = "";
		int count = 0;
		
		for (int i = priceLen- 1; i >= 0 ; i--) {
			count++;
			
			if (i!=0) {
				newPrice = price.charAt(i) + newPrice;
				if (count == 3) {
					newPrice = "," + newPrice;
					count = 0;

				}
			} else {
				newPrice = price.charAt(i) + newPrice;
			}
		}
		
		return newPrice;
	}
}
