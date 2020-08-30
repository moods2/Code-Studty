package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusbookupdateok.do")
public class CusBookUpdateOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		String cusseq = req.getParameter("cusseq");
		String bookdate = req.getParameter("bookdate");
		String bookseq = req.getParameter("bookseq");
		String showtitle = req.getParameter("showtitle");

		String bdate = req.getParameter("bdate");
		String bookstate = req.getParameter("bookstate");
	
		CustomerDAO dao = new CustomerDAO();
		CusBookDTO dto = new CusBookDTO();
		
		dto.setBdate(bdate);
		dto.setBookdate(bookdate);
		dto.setBookseq(bookseq);
		dto.setBookstate(bookstate);
		dto.setCusseq(cusseq);
		dto.setShowtitle(showtitle);
		
		int result = dao.bookupdate(dto);
		
		
		PrintWriter writer = resp.getWriter();
		
		if(result == 1) {

			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("opener.location.reload();");
			writer.print("window.close();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		} else {
			//글쓰기 실패 
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
