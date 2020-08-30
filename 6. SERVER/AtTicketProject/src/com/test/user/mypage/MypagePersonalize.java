package com.test.user.mypage;

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

@WebServlet("/mypagepersonalize.do")
public class MypagePersonalize extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String userseq = String.valueOf( session.getAttribute("userseq"));
		String usertel = String.valueOf( session.getAttribute("usertel"));
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		//페이징 처리 관련 변수
		int nowPage = 0; 			//현재 페이지 번호
		int totalCount = 0; 		//총 게시물 수
		int pageSize = 4; 			//한페이지 당 출력 갯수
		int totalPage = 0;			//총 페이지 수
		int begin = 0;				//rnum 시작 번호
		int end = 0;				//rnum 끝 번호
		int n = 0;					//페이지바 관련 변수
		int loop = 0;				//페이지바 관련 변수
		int blockSize = 10;			//페이지바 관련 변수
		
		//list.do list.do?page=1 변경
		String page = req.getParameter("page");
		
		if (page == null || page == "") nowPage = 1 ;	//default
		else nowPage = Integer.parseInt(page); //
		
		begin = ((nowPage - 1) * pageSize) +1;
		end =  begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		map.put("userseq", userseq);
		
		
		//리스트 출력
		MyPageJDAO dao = new MyPageJDAO();
		
		totalCount = dao.getMyPagePersonalizeTotalCount(map);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		ArrayList<MypageJDTO> list1 = dao.myPagePersonalizeList(map);
		
		for (MypageJDTO dto : list1) {
			
			String msseq = dto.getMsseq();
			dto.setMsseq(msseq);
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
			String myShowRegistration = dto.getMyShowRegistration();
			dto.setMyShowRegistration(myShowRegistration);
			String myShowTheater = dto.getMyShowTheater();
			dto.setMyShowTheater(myShowTheater);
			String showTheater = dto.getShowTheater();
			dto.setShowTheater(showTheater);
			
		}
		
		//페이지바 제작
				loop = 1;
				n = ((nowPage - 1) / blockSize) * blockSize + 1;
				
				String pagebar = "";
				
				pagebar += "<nav class=\"pagebar\" id=\"pagebar\">";
				pagebar += "<ul class=\"pagination\">";

				//이전 10페이지
				if(n == 1) {
					pagebar += "<li class='disabled'>";
					pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
					pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				} else {
					pagebar += "<li>";
					pagebar += String.format("<a href=\"/AtTicketProject/mypagepersonalize.do?page=%d\" aria-label=\"Previous\">", n -1 );
					pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				}
//					for(int i=1; i<=totalPage; i++) {	
				while (!(loop > blockSize || n > totalPage)) {
				//페이지 번호
				if(n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n);
				pagebar += "</li>";
				}else {
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/AtTicketProject/mypagepersonalize.do?page=%d\">%d</a>", n,n);
				pagebar += "</li>";
				}
				loop++;
				n++;
				}
				
				//다음 10페이지
				if(n > totalPage) {
					pagebar += "<li class='disabled'>";
					pagebar += String.format("<a href=\"#!\" aria-label=\"Next\">");
					pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				} else {		
					pagebar += "<li>";
					pagebar += String.format("<a href=\"/AtTicketProject/mypagepersonalize.do?page=%d\" aria-label=\"Next\">", n);
					pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				}
				
				pagebar += "</ul>";
				pagebar += "</nav>";
				
		//=================================================================================================================================
				
				HashMap<String, String> map2 = new HashMap<String, String>();
				
				//페이징 처리 관련 변수
				int nowPage2 = 0; 			//현재 페이지 번호
				int totalCount2 = 0; 		//총 게시물 수
				int pageSize2 = 4; 			//한페이지 당 출력 갯수
				int totalPage2 = 0;			//총 페이지 수
				int begin2 = 0;				//rnum 시작 번호
				int end2 = 0;				//rnum 끝 번호
				int n2 = 0;					//페이지바 관련 변수
				int loop2 = 0;				//페이지바 관련 변수
				int blockSize2 = 10;			//페이지바 관련 변수
				
				//list.do list.do?page=1 변경
				String page2 = req.getParameter("page2");
				
				if (page2 == null || page2 == "") nowPage2 = 1 ;	//default
				else nowPage2 = Integer.parseInt(page2); //
				
				begin2 = ((nowPage2 - 1) * pageSize2) +1;
				end2 =  begin2 + pageSize2 - 1;
				
				map2.put("begin", begin2 + "");
				map2.put("end", end2 + "");
				map2.put("userseq", userseq);
				
				totalCount2 = dao.getMyticketVellTotalCount(map2);
				
				totalPage2 = (int)Math.ceil((double)totalCount2 / pageSize2);
				
				ArrayList<MypageJDTO> list2 = dao.myticketVellList(map2);
				
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
				
				//페이지바 제작
						loop2 = 1;
						n2 = ((nowPage2 - 1) / blockSize2) * blockSize2 + 1;
						
						String pagebar2 = "";
						
						pagebar2 += "<nav class=\"pagebar\" id=\"pagebar2\">";
						pagebar2 += "<ul class=\"pagination\">";

						//이전 10페이지
						if(n2 == 1) {
							pagebar2 += "<li class='disabled'>";
							pagebar2 += "<a href=\"#!\" aria-label=\"Previous\">";
							pagebar2 += "<span aria-hidden=\"true\">&laquo;</span>";
							pagebar2 += "</a>";
							pagebar2 += "<li>";
						} else {
							pagebar2 += "<li>";
							pagebar2 += String.format("<a href=\"/AtTicketProject/mypagepersonalize.do?page2=%d\" aria-label=\"Previous\">", n -1 );
							pagebar2 += "<span aria-hidden=\"true\">&laquo;</span>";
							pagebar2 += "</a>";
							pagebar2 += "<li>";
						}
//							for(int i=1; i<=totalPage; i++) {	
						while (!(loop2 > blockSize2 || n2 > totalPage2)) {
						//페이지 번호
						if(n2 == nowPage2) {
						pagebar2 += "<li class='active'>";
						pagebar2 += String.format("<a href=\"#!\">%d</a>", n);
						pagebar2 += "</li>";
						}else {
						pagebar2 += "<li>";
						pagebar2 += String.format("<a href=\"/AtTicketProject/mypagepersonalize.do?page2=%d\">%d</a>", n,n);
						pagebar2 += "</li>";
						}
						loop2++;
						n2++;
						}
						
						//다음 10페이지
						if(n2 > totalPage2) {
							pagebar2 += "<li class='disabled'>";
							pagebar2 += String.format("<a href=\"#!\" aria-label=\"Next\">");
							pagebar2 += "<span aria-hidden=\"true\">&raquo;</span>";
							pagebar2 += "</a>";
							pagebar2 += "<li>";
						} else {		
							pagebar2 += "<li>";
							pagebar2 += String.format("<a href=\"/AtTicketProject/mypagepersonalize.do?page2=%d\" aria-label=\"Next\">", n);
							pagebar2 += "<span aria-hidden=\"true\">&raquo;</span>";
							pagebar2 += "</a>";
							pagebar2 += "<li>";
						}
						
						pagebar2 += "</ul>";
						pagebar2 += "</nav>";
		
		//리스트 목록
		req.setAttribute("list1", list1);
		req.setAttribute("list2", list2);
		//페이징바
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("page2", page2);
		req.setAttribute("totalCount2", totalCount2);
		req.setAttribute("totalPage2", totalPage2);
		req.setAttribute("pagebar2", pagebar2);
		
		
		req.setAttribute("userseq", userseq);
		req.setAttribute("usertel", usertel);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypagepersonalize.jsp");
		dispatcher.forward(req, resp);
		
	}

}
