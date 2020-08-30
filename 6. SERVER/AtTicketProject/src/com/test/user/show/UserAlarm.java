package com.test.user.show;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/useralarm.do")
public class UserAlarm extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		String showseq = String.valueOf(req.getParameter("showseq"));
		String noticeseq = req.getParameter("noticeseq");
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cusseq", cusseq);
		map.put("showseq", showseq);
		System.out.println(showseq);
		NoticeDAO dao = new NoticeDAO();
		int result = dao.updateAlarm(map);
		System.out.println(result);
		if(result == 1) {
			//글쓰기 성공 -> 게시판 목록 보기로 이동 
			resp.sendRedirect(String.format("/AtTicketProject/usernoticetemp.do?noticeseq=%s&page=%s&search=%s&showseq=%s",noticeseq,page,search,showseq));
		} else {
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
		
	}
}
