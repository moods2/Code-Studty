package com.test.codestudy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/deleteok.do")
public class DeleteOk extends HttpServlet {

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
		dto.setId((String)session.getAttribute("id")); //로그인한 아이디
		
		if (dao.isOwner(dto)) {
			result = dao.delete(seq);
		} else {
			result = 2;
		}
		dao.close();
		
		//3.
		if (result == 1) {
			
			//삭제 성공 -> view(X) -> list(O)
			resp.sendRedirect("/codestudy/board/list.do");
			
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
			writer.print("alert('글쓴이만 삭제 가능합니다.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();		
		}
		
	}
	
}













