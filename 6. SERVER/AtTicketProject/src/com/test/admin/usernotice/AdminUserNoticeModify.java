package com.test.admin.usernotice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usernotice/adminusernoticemodify.do")
public class AdminUserNoticeModify extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		NoticeDAO dao = new NoticeDAO();
		ArrayList<String> list = new ArrayList<String>();
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		String noticeseq = req.getParameter("noticeseq");
		String content = req.getParameter("content");
		
		list = dao.getNindex();
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		req.setAttribute("noticeseq", noticeseq);
		req.setAttribute("content", content);
		
		NoticeDTO dto = dao.getselect(noticeseq);
		
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/notice/adminusernoticemodify.jsp");
		dispatcher.forward(req, resp);
	}
	
	
}
