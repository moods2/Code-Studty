package com.test.admin.customerqna;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customerqna/admincustomerqnaview.do")
public class AdminCustomerQnaView extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		
		//System.out.println(seq);
		//DB
		QnaDAO dao = new QnaDAO();
		
		//QnaDTO dto2 = new QnaDTO();
		//dto2.setSeq(seq);
		//dto2.setMseq((String)session.getAttribute("seq"));	//****** 회원번호 가져오기
		
		
		QnaDTO dto = dao.get(seq);
		//System.out.println(dto.getContent());
		
		//개행 문자 처리
		//질문
		
		String content = dto.getContent();
		//System.out.println(content);
		content = content.replace("\n", "<br>");
		dto.setContent(content);
		
		//답변
		String ancontent = dto.getAncontent();
		if(ancontent != null) {
		ancontent = ancontent.replace("\r\n", "<br>");
		ancontent = ancontent.replace("\n", "<br>");
		dto.setAncontent(ancontent);
		}
		
		
		
//		//검색어 부각시키기
		if (search != null && search != "") {
			content = content.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
			dto.setContent(content);
		}
		
		//2.7 댓글 목록 가져오기
		//ArrayList<CommentDTO> clist = dao.listComment(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		
		//req.setAttribute("clist", clist);
		//req.setAttribute("sort", sort);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customerqna/admincustomerqnaview.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
