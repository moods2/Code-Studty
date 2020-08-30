package com.test.user.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.admin.customerqna.QnaDAO;

@WebServlet("/userqnadeleteok.do")
public class UserQnaDeleteOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String seq = req.getParameter("seq");
		
		
		UserQnaDAO dao = new UserQnaDAO();
		
		int result = dao.deletecontent(seq);
		
		if (result == 1) {
			resp.sendRedirect("/AtTicketProject/userqnamylist.do");			
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
