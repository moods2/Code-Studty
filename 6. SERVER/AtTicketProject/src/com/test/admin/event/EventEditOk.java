package com.test.admin.event;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/event/eventeditok.do")
public class EventEditOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
req.setCharacterEncoding("UTF-8");
		
		//1.
		
		String seq = req.getParameter("seq");
		String title= req.getParameter("title");
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String eindex = req.getParameter("eindex");
		String banner = req.getParameter("banner");
		String content = req.getParameter("content");
		String showseq = req.getParameter("showseq");
		String delflag = req.getParameter("delflag");
		
		System.out.println(title);
		//2. DB 작업 위임 -> EventDAO
		
		EventDAO dao = new EventDAO();
		EventDTO dto = new EventDTO();
		dto.setSeq(seq);
		dto.setTitle(title);
		dto.setStartdate(startdate);
		dto.setEnddate(enddate);
		dto.setEindex(eindex);
		dto.setBanner(banner);
		dto.setContent(content);
		dto.setShowseq(Integer.parseInt(showseq));
		dto.setDelflag(delflag);
		
		HttpSession session = req.getSession();
		
		EventDTO dto2 = new EventDTO();
		dto2.setSeq(seq);
		
		int result = 0;
		
		result = dao.edit(dto);
		
		//resp.sendRedirect("/AtTicketProject/event/eventedit.do?seq="+seq);
		
		PrintWriter writer = resp.getWriter();
		
//		resp.sendRedirect("/AtTicketProject/event/adminevent.do");
		
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
