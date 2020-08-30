package com.test.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/review/adminreviewdelete.do")
public class ReviewDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] cb = req.getParameterValues("cb");
		
		ReviewDAO dao = new ReviewDAO();
		int result = dao.delete(cb);
		
		if (result == cb.length) {
			
			resp.sendRedirect("/AtTicketProject/review/adminreview.do");
			
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
