package com.test.codestudy.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/view.do")
public class View extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 -> select
		//3. 결과 반환 + JSP 호출하기
		
		HttpSession session = request.getSession();
		
		//1. view.do?seq=1
		String seq = request.getParameter("seq");
		String search = request.getParameter("search");
		String sort = request.getParameter("sort"); //상태 유지
		
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
		dto2.setMseq((String)session.getAttribute("seq"));//****
		
		BoardDTO dto = dao.get(dto2);
		
		//2.5 데이터 가공
		//a. 개행 문자 처리
		String content = dto.getContent();
		content = content.replace("\r\n", "<br>");
		dto.setContent(content);
		
		//b. 검색어 부각시키기
		if (search != null && search != "") {
			content = content.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
			dto.setContent(content);
		}
		
		
		
		
		//2.7 댓글 목록 가져오기
		ArrayList<CommentDTO> clist = dao.listComment(seq);
		dao.close();
				
		//3. BoardDAO에게 반환받은 BoardDTO(게시글 1개)를 출력하기 위해서 JSP 페이지에게 전달하기
		request.setAttribute("dto", dto);
		request.setAttribute("search", search);
		request.setAttribute("clist", clist);
		request.setAttribute("sort", sort);//상태 유지
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(request, response);
		


//		추가 사항
//		
//		1. 댓글 수정 구현
//
//		2. 댓글 달린 게시물 삭제
//		  a. 게시물 삭제 + 댓글 삭제
//		  b. 댓글때문에 못지운다고 경고!!
//		  c. 게시물 내용을 삭제된 상태로 치환
		
	}

}








