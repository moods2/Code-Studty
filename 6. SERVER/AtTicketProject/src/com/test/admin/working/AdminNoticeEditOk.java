package com.test.admin.working;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.admin.working.BoardDAO;
import com.test.admin.working.BoardDTO;

@WebServlet("/adminnoticeeditok.do")
public class AdminNoticeEditOk extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		req.setCharacterEncoding("UTF-8");
		
		
		//1.
		HttpSession session = req.getSession();
		
		String title= req.getParameter("title");
		String content = req.getParameter("content");
		String emseq = (String)session.getAttribute("emseq"); //글쓴 회원 번호
		String file = req.getParameter("file");
		
		//2. DB 작업 위임 -> BoardDAO
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setEmseq(emseq);
		dto.setGetInputfile(file);
		
		int result = dao.write(dto);
		dao.close();
		
		if(result ==1) {
			//글쓰기 성공
			resp.sendRedirect("/AtTicketProject/adminworking.do");
		} else {
			//글쓰기 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	
	}

	
	
}
