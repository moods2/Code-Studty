package com.test.user.show;

import java.io.IOException;

import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/usernoticetemp.do")
public class UserNoticeTemp extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		String noticeseq = req.getParameter("noticeseq");
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		String tel = String.valueOf(session.getAttribute("usertel"));
		
		req.setAttribute("noticeseq", noticeseq);
		req.setAttribute("page", page);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		req.setAttribute("cusseq", cusseq);
		req.setAttribute("tel", tel);
		
		NoticeDAO dao = new NoticeDAO();
		
		NoticeDTO dto = dao.getNotice(noticeseq);
		String showseq = dto.getSeq();
		String showtitle = dto.getTitle();
		
		req.setAttribute("showseq", showseq);
		req.setAttribute("showtitle", showtitle);
		
		if(session.getAttribute("read") == null || (boolean)session.getAttribute("read")==false) {
			//2.3 조회수 증가 
			dao.updateReadcount(noticeseq);
			session.setAttribute("read", true); // 읽었음
		}
		NtShowDTO showdto = dao.getNtShowDTO(noticeseq);
			
		//북 마크를 할 경우 null 일 수도 있어 
				
				
		
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
		
		req.setAttribute("dto", dto);
		req.setAttribute("showdto", showdto);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cusseq", cusseq);
		map.put("showseq", showseq);

		int repeat = dao.getRepeat(map);
		
		req.setAttribute("repeat", repeat);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/usernoticetemp.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	
}
