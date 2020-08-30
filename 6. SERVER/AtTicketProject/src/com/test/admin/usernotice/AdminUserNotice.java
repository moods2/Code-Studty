package com.test.admin.usernotice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usernotice/adminusernotice.do")
public class AdminUserNotice extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		String page = req.getParameter("page");
		
		//페이징 처리 관련 변수
		int nowPage = 0; //현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한 페이지 당 출력 갯수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련 변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 10; //페이지바 관련 변수
		
		HashMap<String,String> map = new HashMap<String,String>();
		if(page == null || page == "") nowPage = 1; //default
		else nowPage = Integer.parseInt(page); // 보고 싶은 페이지
		
		if(sort == null || sort == "") {
			sort = "seq"; // 기본값
		}
		
		map.put("search", search);
		map.put("sort", sort);
		
		//nowPage -> 보려는 페이지 번호!!
		//1page -> where rnum 1 >= 10 && rnum <= 10 
		//2page -> where rnum 1 >= 11 && rnum <= 20 
		//3page -> where rnum 1 >= 21 && rnum <= 30
		begin = ((nowPage-1)*pageSize)+1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin+"");
		map.put("end",end+"");
		
		NoticeDAO dao = new NoticeDAO();
		
		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount/pageSize);
		
		ArrayList<NoticeDTO> list = dao.list(map);
		
		for(NoticeDTO dto : list) {
			if(search != null && search != "") {
				//d. 검색어 부각시키기 
				// - 제목
//				String addr = dto.getAddr();
//				addr = addr.replace(search,"<span style = 'font-weight:bold;color:tomato;'>"+search+"</span>");
//				dto.setAddr(addr);
				
				String title = dto.getTitle();
				title = title.replace(search,"<span style = 'font-weight:bold;color:tomato;'>"+search+"</span>");
				dto.setTitle(title);
				
				String regdate = dto.getRegdate();
				regdate = regdate.replace(search,"<span style = 'font-weight:bold;color:tomato;'>"+search+"</span>");
				dto.setRegdate(regdate);
				
				String opendate = dto.getOpendate();
				opendate = opendate.replace(search,"<span style = 'font-weight:bold;color:tomato;'>"+search+"</span>");
				dto.setOpendate(opendate);
		
				
			}
		}
		
		loop = 1;
		n = ((nowPage-1)/blockSize)*blockSize + 1;
		if(search==null) {
			search = "";
			
		}
		
		String pagebar = "";
		
		pagebar+="<nav class = \"pagebar\">";
		pagebar+="<ul class =\"pagination\">";
		
		if(n==1) {
			pagebar+="<li class = 'disabled'>";
			pagebar+="<a href=\"#!\" aria-label=\"Previous\">";
			pagebar+="<span aria-hidden=\"true\">&laquo;</span>";
			pagebar+="</a>";
			pagebar+="</li>";
		} else {
			pagebar+="<li>";
			pagebar+=String.format("<a href=\"/AtTicketProject/usernotice/adminusernotice.do?page=%d&search=%s&sort=%s\" aria-label=\"Previous\">",n-1,search,sort);
			pagebar+="<span aria-hidden=\"true\">&laquo;</span>";
			pagebar+="</a>";
			pagebar+="</li>";
		}
		
		while(!(loop > blockSize || n > totalPage)) {
			if(n==nowPage) {
				pagebar+="<li class = 'active'>";
				pagebar+=String.format("<a href=\"#!\">%d</a>",n);
				pagebar+="</li>";
			} else {
				pagebar+="<li>";
				pagebar+=String.format("<a href=\"/AtTicketProject/usernotice/adminusernotice.do?page=%d&search=%s&sort=%s\">%d</a>",n,search,sort,n);
				pagebar+="</li>";
			}
			loop++;
			n++;
		}
		
		if(n>totalPage) {
			pagebar+="<li class = 'disabled'>";
			pagebar+="<a href=\"#!\" aria-label=\"Next\">";
			pagebar+="<span aria-hidden=\"true\">&raquo;</span>";
			pagebar+="</a>";
			pagebar+="</li>";
		} else {
			pagebar+="<li>";
			pagebar+=String.format(" <a href=\"/AtTicketProject/usernotice/adminusernotice.do?page=%d&search=%s&sort=%s\" aria-label=\"Next\">",n,search,sort);
			pagebar+="<span aria-hidden=\"true\">&raquo;</span>";
			pagebar+="</a>";
			pagebar+="</li>";
		}
		
		pagebar+="</ul>";
		pagebar+="</nav>";
		
		req.setAttribute("list",list);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/notice/adminusernotice.jsp");
		dispatcher.forward(req, resp);
	}
	
}
