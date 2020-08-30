package com.test.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/review/reviewupdateok.do")
public class ReviewUpdateOk extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String genre = req.getParameter("genre");
		String showname = req.getParameter("showname");
		
		String title = req.getParameter("row2");
		String content = req.getParameter("row3");
		String file = req.getParameter("txtphoto");
		String date = req.getParameter("row4");
		System.out.println(seq);
		System.out.println(genre);
		System.out.println(showname);
		System.out.println(title);
		System.out.println(content);
		System.out.println(file);
		System.out.println(date);
		
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = new ReviewDTO();
		
		dto.setSeq(seq);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setRfile(file);
		dto.setRegdate(date);
		
		dto.setStitle(showname);
		dto.setGenre(genre);
		
		int result = dao.update(dto);
		
		if (result == 1) {
			
			resp.sendRedirect("/AtTicketProject/review/adminreview.do");
			
		} else {
			
			PrintWriter writer = resp.getWriter();			
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		}
		
	}
}
