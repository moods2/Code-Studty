package com.test.user.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.admin.customerqna.QnaDAO;

@WebServlet("/userqnamylistdelete.do")
public class UserQnamylistDelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String[] cbDelete = req.getParameterValues("cbDelete");
		
		QnaDAO dao = new QnaDAO();
		int result = dao.deleteMessage(cbDelete);
		
		if (result == cbDelete.length) {
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
