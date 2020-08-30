package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/customer/cuslistdelete.do")
public class CusListDelete extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String seq = req.getParameter("seq");
		String search = req.getParameter("search");
		String page = req.getParameter("page");
		
		CustomerDAO dao = new CustomerDAO();
		int result = 0;
		HttpSession session = req.getSession();
		
		String[] cb = req.getParameterValues("cb");
		result = dao.delete(seq,cb);
		
		
		//3. 
		if(result == 1) {
			//삭제 성공 -> view(X) -> list(O)
			//resp.sendRedirect("/AtTicketProject/customer/admincustomerlist.do");
			resp.sendRedirect(String.format("/AtTicketProject/customer/admincustomerlist.do?page=%s&search=%s",page,search));
		} else if(result == 0) {
			//글쓰기 실패 
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed');history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/customer/cuslistdelete.jsp");
//		dispatcher.forward(req, resp);
	}
}
