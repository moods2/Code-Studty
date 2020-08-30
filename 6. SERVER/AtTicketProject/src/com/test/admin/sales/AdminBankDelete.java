package com.test.admin.sales;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminbankdelete.do")
public class AdminBankDelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		
		SalesDAO dao = new SalesDAO();
		
		int result = dao.deleteBank(seq);
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		if (result == 1) {
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('삭제되었습니다.');");
			writer.print("history.back();");
			writer.print("opener.location.reload();");
//			writer.print("location.href='/AtTicketProject/admin/adminbank.do'");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
 		} else{			
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('delete failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
 		}
	}
	
	
}
