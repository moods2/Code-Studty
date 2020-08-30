package com.test.admin.customerqna;

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

//고객이 관리자에게 보내는 메시지
@WebServlet("/admincustomerqna.do")
public class AdminCustomerQna extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("search",search);
		//map.put("sort",sort);
		
		
		//페이징 처리 관련 변수
		int nowPage = 0; 			//현재 페이지 번호
		int totalCount = 0; 		//총 게시물 수
		int pageSize = 15; 			//한페이지 당 출력 갯수
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
		QnaDAO dao = new QnaDAO();
		
		totalCount = dao.getTotalCount(map);
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		ArrayList<QnaDTO> list = dao.list(map);
		
		for (QnaDTO dto : list) {
			
			if(search != null && search !="") {
				//d. 검색어 부각시키기
				// - 제목
				String subject = dto.getSubject();
				subject = subject.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
				dto.setSubject(subject);
				
				String name = dto.getName();
				name = name.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
				dto.setName(name);
				}
			
				/*
				 * String subject = dto.getSubject(); dto.setSubject(subject); String name =
				 * dto.getName(); dto.setName(name);
				 */
			String regdate = dto.getRegdate();
			dto.setRegdate(regdate);
			String tag = dto.getTag();
			dto.setTag(tag);
			int qview = dto.getQview();
			dto.setQview(qview);
			int ansSeq = dto.getAnsSeq();
			dto.setAnsSeq(ansSeq);
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
					pagebar += String.format("<a href=\"/AtTicketProject/admincustomerqna.do?page=%d\" aria-label=\"Previous\">", n -1 );
					pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
					pagebar += "</a>";
					pagebar += "<li>";
				}
//				for(int i=1; i<=totalPage; i++) {	
				while (!(loop > blockSize || n > totalPage)) {
				//페이지 번호
				if(n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n);
				pagebar += "</li>";
				}else {
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/AtTicketProject/admincustomerqna.do?page=%d\">%d</a>", n,n);
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
					pagebar += String.format("<a href=\"/AtTicketProject/admincustomerqna.do?page=%d\" aria-label=\"Next\">", n);
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
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customerqna/admincustomerqna.jsp");
		dispatcher.forward(req, resp);
		
		
	}
}
