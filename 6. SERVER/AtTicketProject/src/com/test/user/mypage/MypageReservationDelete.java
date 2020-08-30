package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypagereservationdelete.do")
public class MypageReservationDelete extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyPageHDAO dao = new MyPageHDAO();
		HttpSession session = req.getSession();
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		String monthsearch = req.getParameter("monthsearch");
		
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		String nowPage = req.getParameter("nowPage");
		String[] bookseq = req.getParameterValues("cb1");

		int result = dao.deleteReservation(bookseq);
		PrintWriter writer = resp.getWriter();
		
		if(result == bookseq.length) {
			
			resp.sendRedirect(String.format("/AtTicketProject/mypagereservation.do?monthsearch=%s&from=%s&to=%s",monthsearch,from,to));
			
		} else {
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed');history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}

}
