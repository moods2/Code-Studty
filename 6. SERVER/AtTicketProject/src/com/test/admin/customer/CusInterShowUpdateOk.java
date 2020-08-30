package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/cusintershowupdateok.do")
public class CusInterShowUpdateOk extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cusseq = req.getParameter("seq");
		String myshowseq = req.getParameter("myshowseq");
		String showseq = req.getParameter("showseq");
		
		System.out.println(cusseq);
		System.out.println(myshowseq);
		System.out.println(showseq);

		CusInShowDTO dto = new CusInShowDTO();

		dto.setCusseq(cusseq);
		dto.setMyshowseq(myshowseq);
		dto.setShowseq(showseq);

		CustomerDAO dao = new CustomerDAO();

		int result = dao.myshowupdate(dto);

		PrintWriter writer = resp.getWriter();

		if (result == 1) {

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
			// 글쓰기 실패
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
