package com.test.admin.working;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminnoticemodify.do")
public class AdminNoticieModify extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 수정할 글번호 가져오기
				String seq = req.getParameter("seq");
				
				//2. 글번호를 가지고 모든 내용 가져오기
				BoardDAO dao = new BoardDAO();
				
				BoardDTO dto2 = new BoardDTO();
				dto2.setSeq(seq);
				
				BoardDTO dto = dao.get(dto2);
				
				//3. DTO를 JSP에게 전달하면서 호출하기
				req.setAttribute("dto", dto);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/working/adminnoticemodify.jsp");
				dispatcher.forward(req, resp);
		
	}
	
}
