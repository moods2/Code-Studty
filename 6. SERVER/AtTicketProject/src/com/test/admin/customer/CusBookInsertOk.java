package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusbookinsertok.do")
public class CusBookInsertOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String bookdate = req.getParameter("bookdate");
		String roundseq = req.getParameter("roundseq");
		String showstate = req.getParameter("showstate");
		String cnt = req.getParameter("cnt");
		String bdate = req.getParameter("bdate");
		
		
		CusBookingDTO dto = new CusBookingDTO();
		dto.setBdate(bdate);
		dto.setBookdate(bookdate);
		dto.setCnt(cnt);
		dto.setRoundseq(roundseq);
		dto.setState(showstate);
		
		CustomerDAO dao = new CustomerDAO();
		
		/*
		 * int result = dao.bookinsert(dto);
		 * 
		 * PrintWriter writer = resp.getWriter();
		 * 
		 * if(result == 1) {
		 * //resp.sendRedirect("/AtTicketProject/customer/cuslistinsert.do");
		 * writer.print("<html>"); writer.print("<body>"); writer.print("<script>");
		 * writer.print("opener.location.reload();"); writer.print("window.close();");
		 * writer.print("</script>"); writer.print("</body>"); writer.print("</html>");
		 * writer.close();
		 * 
		 * } else { //글쓰기 실패 writer.print("<html>"); writer.print("<body>");
		 * writer.print("<script>"); writer.print("alert('failed');history.back();");
		 * writer.print("</script>"); writer.print("</body>"); writer.print("</html>");
		 * writer.close(); }
		 */
		
		
	}
}
