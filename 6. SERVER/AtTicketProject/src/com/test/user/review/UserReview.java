package com.test.user.review;

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

@WebServlet("/userreview.do")
public class UserReview extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 게시판 내용 불러오기
		//2. 검색 결과
		//3. 페이징하기
		//4. 정렬
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
//		System.out.println("user : "+ (int)session.getAttribute("userseq"));
		
//		int userseq = (int)session.getAttribute("userseq");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		
		
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = new ReviewDTO();
//		dto.setCseq(userseq);
		
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		HashMap<String,String> map = new HashMap<String, String>();
		
		if (sort == null || sort == "") {
			sort = "seq desc"; // 기본값
		}else if(sort.equals("rview")) {
			sort = "rview desc";
		}else if(sort.equals("heart")) {
			sort = "heart desc"; 
		}
		
		map.put("sort",sort);
		map.put("search",search);
		
		
		
		// 페이징 처리 관련 변수
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한 페이지당 출력 갯수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련 변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 10; // 페이지바 관련 변수
		
		// list.do -> list.do?page=1 변경
		// list.do?page=3
		String page = req.getParameter("page");
		
		if (page == null || page == "")
			nowPage = 1; // default
		else
			nowPage = Integer.parseInt(page);

		// nowPage -> 보려는 페이지 번호!!
		// 1page -> where rnum >= 1 and rnum <= 10
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		//총 페이지 수 계산하기
		//총 페이지 수 = 총 게시물 수 / 한 페이지당 출력 게시물 수
		totalCount = dao.getTotalCount(map);

		totalPage = (int) Math.ceil((double) totalCount / pageSize);
		list = dao.getList(map);
		
		//새로고침 조회수 증가 방지
		session.setAttribute("read", false);

		// 페이지바 제작
		loop = 1;

		n = ((nowPage - 1) / blockSize) * blockSize + 1;

		String pagebar = "";

		pagebar += "<nav class=\"pagebar\">";
		pagebar += "<ul class=\"pagination\">";

		// 이전 10페이지
		if (n == 1) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/AtTicketProject/userreview.do?page=%d\" aria-label=\"Previous\">",
					n - 1);
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}

		// for(int i=1; i<=totalPage; i++) {
		while (!(loop > blockSize || n > totalPage)) {

			// 페이지 번호
			if (n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n);
				pagebar += "</li>";
			} else {
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/AtTicketProject/userreview.do?page=%d&search=%s\">%d</a>", n,
						search == null ? "" : search, n);
				pagebar += "</li>";
			}

			loop++;
			n++;
		}

		// 다음 10페이지
		if (n > totalPage) {
			// 최대페이지까지만 가게 하자
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Next\">";
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/AtTicketProject/userreview.do?page=%d\" aria-label=\"Next\">", n);
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}

		pagebar += "</ul>";
		pagebar += "</nav>";
		
		
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("pagebar", pagebar);
		
//		req.setAttribute("userseq", userseq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userreview.jsp");
		dispatcher.forward(req, resp);
		
		
//		System.out.println(req.getContextPath());
//		System.out.println(session.getAttribute("userid"));
		
	}
	
}
