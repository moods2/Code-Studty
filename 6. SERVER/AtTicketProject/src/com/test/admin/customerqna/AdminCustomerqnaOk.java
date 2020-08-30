package com.test.admin.customerqna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admincustomerqnaOk.do")
public class AdminCustomerqnaOk extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String anSeq = req.getParameter("anSeq");
		String content = req.getParameter("content");
		
		//System.out.println(content);
		
		
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = new QnaDTO();
		
		dto.setSeq(seq);
		dto.setAnSeq(anSeq);
		dto.setAncontent(content);
		
		int result = dao.ok(dto);
		
		//System.out.println(result);
		
		if (result == 1) {
			resp.sendRedirect("/AtTicketProject/customerqna/admincustomerqnaview.do?seq="+seq);			
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
