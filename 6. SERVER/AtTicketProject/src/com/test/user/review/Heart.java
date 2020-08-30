package com.test.user.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/heart.do")
public class Heart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		int cseq = (int)session.getAttribute("userseq"); 
		String rseq = req.getParameter("rseq");
		
		HeartDTO dto = new HeartDTO();
		dto.setCusseq(Integer.toString(cseq));
		dto.setRevseq(rseq);
		
		ReviewDAO dao = new ReviewDAO();
		
		int result = 0;
		
		if(!dao.checkHeart(dto)) {
			result = dao.addHeart(dto);
		}else {
			result = dao.removeHeart(dto);
		}
		
		if(result == 1) {
			resp.sendRedirect("/AtTicketProject/userreviewread.do?rseq=" + rseq);
			
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
