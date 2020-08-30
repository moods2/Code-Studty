package com.test.codestudy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(수정할 값들)
		//2. DB 작업 -> update
		//3. 결과 처리
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String seq = req.getParameter("seq");
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = new BoardDTO();
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setContent(content);
		
		//int result = dao.edit(dto); //1, 0
		int result = 0;
		
		HttpSession session = req.getSession();
		
		BoardDTO dto2 = new BoardDTO();
		dto2.setSeq(seq);
		dto2.setId((String)session.getAttribute("id"));
		
		if (dao.isOwner(dto2)) {
			result = dao.edit(dto);
		} else {
			result = 2;
		}
		dao.close();
		
		//3.
		if (result == 1) {
			
			//수정 성공 -> 이동하기 -> list.do or view.do
			resp.sendRedirect("/codestudy/board/view.do?seq=" + seq);
			
		} else if (result == 0) {
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();		
		} else if (result == 2) {
			
			resp.setCharacterEncoding("UTF-8");//
			
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");//
			writer.print("<meta charset='UTF-8'>");//
			writer.print("</head>");//
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('글쓴이만 수정 가능합니다.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();		
		}
		
	}
	
}










