package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cuspointupdateok.do")
public class CusPointUpdateOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String showtitle = req.getParameter("showtitle");
		String pointdate = req.getParameter("pointdate");
		String egg = req.getParameter("egg");
		String valid = req.getParameter("valid");
		String type = req.getParameter("type");
		String bookseq = req.getParameter("bookseq");
		String cusseq = req.getParameter("cusseq");
		
		CustomerDAO dao = new CustomerDAO();
		CusPointDTO dto = new CusPointDTO();
		
		dto.setBookseq(bookseq);
		dto.setCusseq(cusseq);
		dto.setEgg(egg);
		dto.setPointdate(pointdate);
		dto.setShowtitle(showtitle);
		dto.setType(type);
		dto.setValid(valid);
		
		int result = dao.pointupdate(dto);
		
		 PrintWriter writer = resp.getWriter();
		 
		 if(result == 1) {
		 //resp.sendRedirect("/AtTicketProject/customer/cuslistinsert.do");
		 writer.print("<html>"); writer.print("<body>"); writer.print("<script>");
		 writer.print("opener.location.reload();"); writer.print("window.close();");
		 writer.print("</script>"); writer.print("</body>"); writer.print("</html>");
		 writer.close();
		 
		 } else { //글쓰기 실패 writer.print("<html>"); writer.print("<body>");
		 writer.print("<script>"); writer.print("alert('failed');history.back();");
		 writer.print("</script>"); writer.print("</body>"); writer.print("</html>");
		 writer.close(); }
		
		
	}

}







