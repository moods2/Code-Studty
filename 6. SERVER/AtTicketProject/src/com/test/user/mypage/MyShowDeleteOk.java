package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/myShowDeleteok.do")
public class MyShowDeleteOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String[] cbDelete = req.getParameterValues("cbDelete");
		
		MyPageJDAO dao = new MyPageJDAO();
		int result = dao.deleteMyShow(cbDelete);
		
		if (result == cbDelete.length) {
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
