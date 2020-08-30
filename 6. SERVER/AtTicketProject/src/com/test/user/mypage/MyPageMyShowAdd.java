package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.admin.customerqna.QnaDAO;

@WebServlet("/MyPageMyShowAdd.do")
public class MyPageMyShowAdd extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		String userseq = String.valueOf( session.getAttribute("userseq"));
		
		String[] cbAdd = req.getParameterValues("cbAdd");
		
		MyPageJDAO dao = new MyPageJDAO();
		
		
		int result = dao.AddMyShow(cbAdd, userseq);
		
		if (result == cbAdd.length) {
			resp.sendRedirect("/AtTicketProject/mypageinterest.do");			
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
