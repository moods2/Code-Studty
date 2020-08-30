package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusintershowdelete.do")
public class CusInterShowDelete extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String[] myshowseq = req.getParameterValues("myshowseq");
		String seq = req.getParameter("seq");
		String page = req.getParameter("page");
		String search = req.getParameter("search");
	
		CustomerDAO dao = new CustomerDAO();
		
		int result = dao.myshowdelete(myshowseq);
		PrintWriter writer = resp.getWriter();
		
		if(result == 1) {
			
			resp.sendRedirect(String.format("admincustomerinfo.do?seq=%s&page=%s&search=%s",seq,page,search));
			
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
