package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusviewupdateok.do")
public class CusViewUpdateOk extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String roundseq = req.getParameter("roundseq");
		String showseq = req.getParameter("showseq");
		
		CusShowViewDTO dto = new CusShowViewDTO();
		dto.setRoundseq(roundseq);
		dto.setShowseq(showseq);
		
		CustomerDAO dao = new CustomerDAO();
		int result = dao.viewupdate(dto);
		
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
