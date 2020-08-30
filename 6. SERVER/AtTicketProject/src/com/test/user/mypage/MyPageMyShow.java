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

@WebServlet("/mypagemyshow.do")
public class MyPageMyShow extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String userseq = String.valueOf( session.getAttribute("userseq"));
		String reqshowtitle = req.getParameter("reqshowtitle");
		String reqshowgenre = req.getParameter("reqshowgenre");
		String bookdateFrom = req.getParameter("bookdateFrom");
		String bookdateTo = req.getParameter("bookdateTo");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		//페이징 처리 관련 변수
		int nowPage = 0; 			//현재 페이지 번호
		int totalCount = 0; 		//총 게시물 수
		int pageSize = 5; 			//한페이지 당 출력 갯수
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

		map.put("reqshowtitle", reqshowtitle);
		map.put("reqshowgenre", reqshowgenre);
		map.put("bookdateFrom", bookdateFrom);
		map.put("bookdateTo", bookdateTo);
		
		
		System.out.println(map.get("reqshowtitle"));
		System.out.println(map.get("reqshowgenre"));
		System.out.println(map.get("bookdateFrom"));
		System.out.println(map.get("bookdateTo"));
		
		
		//리스트 출력
		MyPageJDAO dao = new MyPageJDAO();
		
		totalCount = dao.getMyShowTotalCountSearch(map);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		ArrayList<MypageJDTO> list = dao.myShowListSearch(map);
		
		for (MypageJDTO dto : list) {
			
			String bookdate = dto.getBookdate();
			dto.setBookdate(bookdate);
			String rinfoseq = dto.getRinfoseq();
			dto.setRinfoseq(rinfoseq);
			String showseq = dto.getShowseq();
			dto.setShowseq(showseq);
			String showtitle = dto.getShowtitle();
			dto.setShowtitle(showtitle);
			String showgenre = dto.getShowgenre();
			dto.setShowgenre(showgenre);
			String showstart = dto.getShowstart();
			dto.setShowstart(showstart);
			String showend = dto.getShowend();
			dto.setShowend(showend);
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
					pagebar += String.format("<a href=\"/AtTicketProject/mypagewatched.do?page=%d\" aria-label=\"Previous\">", n -1 );
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
				pagebar += String.format("<a href=\"/AtTicketProject/mypagewatched.do?page=%d\">%d</a>", n,n);
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
					pagebar += String.format("<a href=\"/AtTicketProject/mypagewatched.do?page=%d\" aria-label=\"Next\">", n);
					pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				}
				
				pagebar += "</ul>";
				pagebar += "</nav>";
		
		//리스트 목록
		req.setAttribute("list", list);
		//페이징바
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("pagebar", pagebar);
		
		
		req.setAttribute("userseq", userseq);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypagewatched.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
