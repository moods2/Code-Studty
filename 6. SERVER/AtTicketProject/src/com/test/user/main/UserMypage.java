package com.test.user.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.mypage.MyPageJDAO;
import com.test.user.mypage.MyReDTO;
import com.test.user.mypage.MyWaDTO;
import com.test.user.mypage.MypageJDTO;


@WebServlet("/usermypage.do")
public class UserMypage extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		UserDAO dao = new UserDAO();
		ArrayList<CouponDTO> clist = dao.getCoupon((int)session.getAttribute("userseq"));
		ArrayList<EventDTO> elist = dao.getEvent();
		MyHDAO hdao = new MyHDAO();
		
	
		HashMap<String,String> mapB = new HashMap<String,String>();
		
		String page = req.getParameter("page");
		String pageW = req.getParameter("pageW");
		
		int nowPageB = 0;
		int totalPageB = 0;
		int pageSizeB = 2;
		int totalCountB = 0;
		
		if(page == null || page == "") nowPageB = 1; //default
		else nowPageB = Integer.parseInt(page);
		
		mapB.put("begin", "1");
		mapB.put("end", "2");
		mapB.put("cusseq", cusseq);
		//예매
		ArrayList<MyReDTO> rlist = hdao.getlistB(mapB);
		totalCountB = hdao.getTotalCount(cusseq);
		totalPageB = (int)Math.ceil((double)totalCountB/pageSizeB);
	
		System.out.println(totalCountB);
		req.setAttribute("mapB", mapB);
		req.setAttribute("totalCountB", totalCountB);
		req.setAttribute("totalPageB", totalPageB);
		req.setAttribute("nowPageB", nowPageB);
		
		HashMap<String,String> map1 = new HashMap<String,String>();

		int nowPageW = 0;
		int totalPageW = 0;
		int pageSizeW = 2;
		int totalCountW = 0;
		
		if(pageW == null || pageW == "") nowPageW = 1; //default
		else nowPageW = Integer.parseInt(pageW);
		
		map1.put("beginW", "1");
		map1.put("endW", "2");
		map1.put("cusseq", cusseq);
		req.setAttribute("map1", map1);
		
		//관람 공연 
		ArrayList<MyWaDTO> wlist = hdao.getWatch(map1);
		totalCountW = hdao.getTotalCountW(cusseq);
		totalPageW = (int)Math.ceil((double)totalCountW/pageSizeW);
		
		
		req.setAttribute("totalCountW", totalCountW);
		req.setAttribute("totalPageW", totalPageW);
		req.setAttribute("nowPageW", nowPageW);

		req.setAttribute("rlist", rlist);
		req.setAttribute("clist", clist);
		req.setAttribute("elist", elist);
		req.setAttribute("wlist", wlist);
		
		//====================================================================================================
		//관심공연
		//====================================================================================================
		
		String userseq = String.valueOf( session.getAttribute("userseq"));
		
		HashMap<String, String> map = new HashMap<String, String>();
		HashMap<String, String> map2 = new HashMap<String, String>();
		
		//페이징 처리 관련 변수
		int nowPage = 1; 			//현재 페이지 번호
		int totalCount = 0; 		//총 게시물 수
		int pageSize = 3; 			//한페이지 당 출력 갯수
		int totalPage = 0;			//총 페이지 수
		int begin = 0;				//rnum 시작 번호
		int end = 0;				//rnum 끝 번호
		
		begin = ((nowPage - 1) * pageSize) +1;
		end =  begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		map.put("userseq", userseq);
		
		map2.put("begin", begin + "");
		map2.put("end", end + "");
		map2.put("userseq", userseq);
		
		
		//리스트 출력
		MyPageJDAO dao1 = new MyPageJDAO();
		
		totalCount = dao1.getMyPageShowTotalCount(map);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		ArrayList<MypageJDTO> list = dao1.myPageShowList(map);
		
		for (MypageJDTO dto : list) {
			
			String myShowseq = dto.getMyShowseq();
			dto.setMyShowseq(myShowseq);
			String myShowTitle = dto.getMyShowTitle();
			dto.setMyShowTitle(myShowTitle);
			String myShowPoster = dto.getMyShowPoster();
			dto.setMyShowPoster(myShowPoster);
			String myShowstart = dto.getMyShowstart();
			dto.setMyShowstart(myShowstart);
			String myShowend = dto.getMyShowend();
			dto.setMyShowend(myShowend);
			String myShowTheater = dto.getMyShowTheater();
			dto.setMyShowTheater(myShowTheater);
			String showTheater = dto.getShowTheater();
			dto.setShowTheater(showTheater);
			
		}
		
		//====================================================================================================
		//맞춤알람
		//====================================================================================================
		MyPageJDAO dao11 = new MyPageJDAO();		
		
		ArrayList<MypageJDTO> list1 = dao11.myPagePersonalizeList(map);
		
		for (MypageJDTO dto : list1) {
			
			String msseq = dto.getMsseq();
			dto.setMsseq(msseq);
			String myShowseq = dto.getMyShowseq();
			dto.setMyShowseq(myShowseq);
			String myShowTitle = dto.getMyShowTitle();
			dto.setMyShowTitle(myShowTitle);
			String myShowstart = dto.getMyShowstart();
			dto.setMyShowstart(myShowstart);
			String myShowend = dto.getMyShowend();
			dto.setMyShowend(myShowend);
			String myShowRegistration = dto.getMyShowRegistration();
			dto.setMyShowRegistration(myShowRegistration);
			String myShowTheater = dto.getMyShowTheater();
			dto.setMyShowTheater(myShowTheater);
			
		}
		
		//====================================================================================================
		//맞춤알람
		//====================================================================================================
		
		MyPageJDAO dao12 = new MyPageJDAO();
		
		ArrayList<MypageJDTO> list2 = dao12.myticketVellList(map2);
		
		for (MypageJDTO dto : list2) {
			
			String vellseq = dto.getVellseq();
			dto.setVellseq(vellseq);
			String vellshowseq = dto.getVellshowseq();
			dto.setVellshowseq(vellshowseq);
			String velltitle = dto.getVelltitle();
			dto.setVelltitle(velltitle);
			String vellopenDate = dto.getVellopenDate();
			dto.setVellopenDate(vellopenDate);
			String velldate = dto.getVelldate();
			dto.setVelldate(velldate);
			String noticeseq = dto.getNoticeseq();
			dto.setNoticeseq(noticeseq);
			
			System.out.println(dto.getNoticeseq());
			
		}
		
		
		//리스트 목록
		req.setAttribute("list", list);
		req.setAttribute("list1", list1);
		req.setAttribute("list2", list2);
		//페이징바
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("userseq", userseq);
		
		
		
		req.setAttribute("clist", clist);
		req.setAttribute("elist", elist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/usermypage.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
