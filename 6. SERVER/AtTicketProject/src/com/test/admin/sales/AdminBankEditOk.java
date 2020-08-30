package com.test.admin.sales;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminbankeditok.do")
public class AdminBankEditOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String account = req.getParameter("account");
		
//		System.out.println("seq : " + seq);
		
		SalesDAO dao = new SalesDAO();
		BankDTO dto = new BankDTO();
		
		dto.setSeq(seq);
		dto.setName(name);
		dto.setAccount(account);
		
		int result = dao.editBank(dto); 
		
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
		}else {
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('edit failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}
	
}
