package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusintershowinsertok.do")
public class CusInterShowInsertOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String cusseq = req.getParameter("seq");
		String myshowseq = req.getParameter("myshowseq");
		
		CustomerDAO dao = new CustomerDAO();
		CusInShowDTO dto = new CusInShowDTO();
		dto.setCusseq(cusseq);
		dto.setShowseq(myshowseq);
		int result = dao.showinsert(dto);
		
		PrintWriter writer = resp.getWriter();
		 if(result == 1) {
			
			writer.print("<html>"); writer.print("<body>"); writer.print("<script>");
			writer.print("opener.location.reload();"); writer.print("window.close();");
			writer.print("</script>"); writer.print("</body>"); writer.print("</html>");
			writer.close();
			
			} else { 
			writer.print("<script>"); writer.print("alert('failed');history.back();");
			writer.print("</script>"); writer.print("</body>"); writer.print("</html>");
			writer.close(); }
		
	}

}
