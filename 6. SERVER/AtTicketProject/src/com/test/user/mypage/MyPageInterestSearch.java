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

@WebServlet("/mypageinterestsearch.do")
public class MyPageInterestSearch extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String search = req.getParameter("search");
		String index = req.getParameter("index");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("search",search);
		
		System.out.println(map.get("search"));
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
		//list.do?page=3
		String page = req.getParameter("page");
		
		if (page == null || page == "") nowPage = 1 ;	//default
		else nowPage = Integer.parseInt(page); //
		
		begin = ((nowPage - 1) * pageSize) +1;
		end =  begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		//리스트 출력
		MyPageJDAO dao = new MyPageJDAO();
		
		totalCount = dao.getMyShowSearchTotalCount(map);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		ArrayList<MypageJDTO> list = dao.myShowSearchList(map);
		
		for (MypageJDTO dto : list) {
			
			String showseq = dto.getShowseq();
			dto.setShowseq(showseq);
			String showtitle = dto.getShowtitle();
			dto.setShowtitle(showtitle);
			String showstart = dto.getShowstart();
			dto.setShowstart(showstart);
			String showend = dto.getShowend();
			dto.setShowend(showend);
			String showPoster = dto.getShowPoster();
			dto.setShowPoster(showPoster);
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
					/* if(index.equals("3")) { */
						pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\" aria-label=\"Previous\">",index,search, n -1);
				/*	}else {			
						pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\">%d</a>",index,search, n,n);
					}
					pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?page=%d\" aria-label=\"Previous\">", n -1 );*/
					pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				}
//					for(int i=1; i<=totalPage; i++) {	
				while (!(loop > blockSize || n > totalPage)) {
				//페이지 번호
				if(n == nowPage) {
					search = req.getParameter("search");	
					
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n);
				pagebar += "</li>";
				}else {
				pagebar += "<li>";
				
				if(index.equals("3")) {
					pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\">%d</a>",index,search, n,n);
				}else {			
					pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\">%d</a>",index,search, n,n);
				}
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
					/*
					 * pagebar += String.
					 * format("<a href=\"/AtTicketProject/mypageinterestsearch.do?page=%d\" aria-label=\"Next\">"
					 * , n);
					 */
					if(index.equals("3")) {
//						pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\">%d</a>",index,search, n,n);
						pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\" aria-label=\"Next\">",index,search, n);
					}else {			
//						pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\">%d</a>",index,search, n,n);
						pagebar += String.format("<a href=\"/AtTicketProject/mypageinterestsearch.do?index=%s&search=%s&page=%d\" aria-label=\"Next\">",index,search, n);
					}
					pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				}
				
				pagebar += "</ul>";
				pagebar += "</nav>";
		
		//리스트 목록
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		//페이징바
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("pagebar", pagebar);
		
		if(index.equals("3")) {
			req.setAttribute("index", "4");			
		}else {			
			req.setAttribute("index", "2");
		}
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypageinterestpopup.jsp");
		dispatcher.forward(req, resp);

	}
	
}
