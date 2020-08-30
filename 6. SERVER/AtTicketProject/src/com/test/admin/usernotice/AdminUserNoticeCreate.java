package com.test.admin.usernotice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usernotice/adminusernoticecreate.do")
public class AdminUserNoticeCreate extends HttpServlet{
	//회원대상 공지를 다룬다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		NoticeDAO dao = new NoticeDAO();
		ArrayList<String> list = new ArrayList<String>();
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		
		list = dao.getNindex();
		req.setAttribute("list", list);
		req.setAttribute("page", page);
		req.setAttribute("search", search);
		req.setAttribute("sort", sort);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/notice/adminusernoticecreate.jsp");
		dispatcher.forward(req, resp);
		
	}
}
