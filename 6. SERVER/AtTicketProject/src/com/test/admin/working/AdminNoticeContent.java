package com.test.admin.working;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.admin.working.BoardDAO;
import com.test.admin.working.BoardDTO;


@WebServlet("/adminnoticecontent.do")
public class AdminNoticeContent extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
				//2. DB 작업 -> select
				//3. 결과 반환 + JSP 호출하기
				
				HttpSession session = req.getSession();
				
				//1. view.do?seq=1
				String seq = req.getParameter("seq");
				String search = req.getParameter("search");
				String sort = req.getParameter("sort"); //상태 유지
				
				//2. DB 담당자에게 위임
				// - 글번호 전달하고 레코드 1개(BoardDTO) 반환받기
				BoardDAO dao = new BoardDAO();
				
				
				
				if (session.getAttribute("read") == null || (boolean)session.getAttribute("read") == false) {
					//2.3 조회수 증가
					dao.updateReadcount(seq);
					
					session.setAttribute("read", true);
				}
				
				BoardDTO dto2 = new BoardDTO();
				dto2.setSeq(seq);
				dto2.setEmseq((String)session.getAttribute("seq")); // *****
				
				
				
				BoardDTO dto = dao.get(dto2);
				
				//2.5 데이터 가공
				//a. 개행 문자 처리
//				String content = dto.getContent();
//				content = content.replace("\r\n", "<br>");
//				dto.setContent(content);
//				
//				//b. 검색어 부각시키기
//				if (search != null && search != "") {
//					content = content.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
//					dto.setContent(content);
//				}				
				
				
				req.setAttribute("dto", dto);
				req.setAttribute("search", search);
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/working/adminnoticecontent.jsp");
		dispatcher.forward(req, resp);
		
	}
}
