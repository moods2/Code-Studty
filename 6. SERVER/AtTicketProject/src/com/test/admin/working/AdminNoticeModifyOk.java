package com.test.admin.working;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminnoticemodifyok.do")
public class AdminNoticeModifyOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String title= req.getParameter("title");
		String content = req.getParameter("content");
//		String emseq = (String)session.getAttribute("emseq"); //글쓴 회원 번호
		String seq = req.getParameter("seq");
		String file = req.getParameter("file");
		
		System.out.println(title);
		//2. DB 작업 위임 -> BoardDAO
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSeq(seq);
//		dto.setEmseq(emseq);
		dto.setGetInputfile(file);
		
		HttpSession session = req.getSession();
		
		BoardDTO dto2 = new BoardDTO();
		dto2.setSeq(seq); //수정할할 글번호
		
		int result = 0;
		
		
		result = dao.edit(dto);
		resp.sendRedirect("/AtTicketProject/adminnoticecontent.do?seq="+seq);
		
			//수정 성공
			
		
			
			
	}

	
	
}
