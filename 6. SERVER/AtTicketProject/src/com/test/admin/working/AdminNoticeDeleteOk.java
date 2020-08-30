package com.test.admin.working;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.admin.working.BoardDAO;
import com.test.admin.working.BoardDTO;

@WebServlet("/adminnoticedeleteok.do")
public class AdminNoticeDeleteOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
				//2. DB 작업 -> delete
				//3. 결과 처리
				
				//1.
				String seq = req.getParameter("seq");
				
				//2.
				BoardDAO dao = new BoardDAO();
				
				
				
				int result = 0;
				
				HttpSession session = req.getSession();
				
				BoardDTO dto = new BoardDTO();
				dto.setSeq(seq); //삭제할 글번호
				//dto.setId((String)session.getAttribute("id")); //로그인한 아이디
				
				resp.sendRedirect("/AtTicketProject/adminworking.do");
			
				System.out.println(seq);
				
				result = dao.delete(seq);
		
	}
	
}
