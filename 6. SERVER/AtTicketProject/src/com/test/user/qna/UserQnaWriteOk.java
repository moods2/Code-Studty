package com.test.user.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userqnawriteok.do")
public class UserQnaWriteOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		
		String userseq = String.valueOf( session.getAttribute("userseq"));
		String tag = req.getParameter("tag");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String index = req.getParameter("index");
			
		UserQnaDAO dao = new UserQnaDAO();
		UserQnaDTO dto = new UserQnaDTO();
		
		System.out.println(userseq);
		System.out.println(tag);
		System.out.println(subject);
		System.out.println(content);
		
		dto.setUserseq(userseq);
		dto.setTag(tag);
		dto.setSubject(subject);
		dto.setContent(content);
		
		int resutl = dao.write(dto);
		
		if (resutl == 1) {
			if(index.equals("1")) {
				resp.sendRedirect("/AtTicketProject/userqna.do");	
			}else {
				resp.sendRedirect("/AtTicketProject/userqnamylist.do");
			}
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
