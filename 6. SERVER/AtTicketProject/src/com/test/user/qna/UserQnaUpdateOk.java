package com.test.user.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.admin.customerqna.QnaDAO;
import com.test.admin.customerqna.QnaDTO;

@WebServlet("/userqnaupdateok.do")
public class UserQnaUpdateOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String tag = req.getParameter("tag");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		UserQnaDAO dao = new UserQnaDAO();
		UserQnaDTO dto = new UserQnaDTO();
		
		System.out.println("=============="+seq);
		System.out.println(tag);
		System.out.println(subject);
		System.out.println(content);
		
		dto.setSeq(seq);
		dto.setTag(tag);
		dto.setSubject(subject);
		dto.setContent(content);
		
		int result = dao.updateOk(dto);
		
		if (result == 1) {
			resp.sendRedirect("/AtTicketProject/userqnacontent.do?seq="+seq);			
		} else {
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
