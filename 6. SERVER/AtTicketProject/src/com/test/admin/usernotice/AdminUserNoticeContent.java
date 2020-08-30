package com.test.admin.usernotice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usernotice/adminusernoticecontent.do")
public class AdminUserNoticeContent extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		String noticeseq = req.getParameter("noticeseq");
		
		req.setAttribute("noticeseq", noticeseq);
		req.setAttribute("page", page);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		
		NoticeDAO dao = new NoticeDAO();
		
		NoticeDTO dto = dao.getNotice(noticeseq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/notice/adminusernoticecontent.jsp");
		dispatcher.forward(req, resp);
	}
}
