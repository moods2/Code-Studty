package com.test.admin.usernotice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usernotice/adminusernoticedelete.do")
public class AdminUserNoticeDelete extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String page = req.getParameter("page");
		 String search = req.getParameter("search");
		 String sort = req.getParameter("sort");
		 String [] noticeseq = req.getParameterValues("noticeseq");
		 
		 NoticeDAO dao = new NoticeDAO();
		 
		 int result = dao.deleteNotice(noticeseq);
		 
		 PrintWriter writer = resp.getWriter();
		 if(result == 1) {
				
				resp.sendRedirect(String.format("adminusernotice.do?page=%s&search=%s&sort=%s",page,search,sort));
				
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
