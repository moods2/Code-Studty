package com.test.admin.show;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminshowdeleteok.do")
public class AdminShowDeleteOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ShowDAO dao = new ShowDAO();
		int sresult = dao.deleteShow(seq);
		int rresult = dao.deleteRound(seq);
		
		TagDTO tdto = dao.loadTag(seq);
		
		int tresult = dao.deleteTag(tdto);
		
		
		
		if (sresult == 1 && rresult == 1) {
			//삭제 성공 -> view(X) -> list(O)
			resp.sendRedirect("/AtTicketProject/adminshow.do");	
			
 		} else{			
 			//삭제 실패
 			System.out.println(sresult + " " + rresult + " " + tresult);
 			
 			PrintWriter writer = resp.getWriter();
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
