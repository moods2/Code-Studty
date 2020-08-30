package com.test.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/review/adminreview.do")
public class AdminReview extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//페이징 처리 관련 변수
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;			//총 게시물 수
		int pageSize = 15;			//한페이지 당 출력 갯수
		int totalPage = 0;			//총 페이지 수
		int begin = 0;				//rnum 시작 번호
		int end = 0;				//rnum 끝 번호
		int n = 0;					//페이지바 관련 변수
		int loop = 0;				//페이지바 관련 변수
		int blockSize = 10;			//페이지바 관련 변수
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		//review.do?page=1
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		map.put("search", search);
		
		if (page == null || page == "") nowPage = 1; //default
		else nowPage = Integer.parseInt(page);
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		ReviewDAO dao = new ReviewDAO();
		
		totalCount = dao.getTotalCount(map);
		
		ArrayList<ReviewDTO> list = dao.getList(map);
		dao.close();
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		String pagebar = "";
		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		pagebar += "<nav class=\"pagebar\">";
		pagebar += "<ul class=\"pagination\">";
		
		if (n == 1) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/AtTicketProject/review/adminreview.do?page=%d\" aria-label=\"Previous\">", n-1);
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
//		for (int i=1; i<=totalPage; i++) {
		while (!(loop > blockSize || n > totalPage)) {
		//페이지 번호
			if (n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n);
				pagebar += "</li>";
			} else {
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/AtTicketProject/review/adminreview.do?page=%d\">%d</a>", n, n);
				pagebar += "</li>";
			}
		
		loop++;
		n++;
		}
		
		//다음 10페이지
		if (n > totalPage) {
			pagebar += "<li class='disabled'>";
			pagebar += String.format("<a href=\"#!\" aria-label=\"Next\">");
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/AtTicketProject/review/adminreview.do?page=%d\" aria-label=\"Next\">", n);
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
		pagebar += "</ul>";
		pagebar += "</nav>";
		
		
		req.setAttribute("list", list);
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("search", search);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/review/review.jsp");
		dispatcher.forward(req, resp);
	}
}
