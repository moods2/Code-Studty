package com.test.admin.employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/employee/adminemployeedelete.do")
public class AdminEmployeeDelete extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//System.out.println(req.getParameter("delNum"));
		
		String[] delnum = req.getParameter("delNum").split(",");//삭제할 글 번호 넘김.
		
		AdminEmployeeDAO dao = new AdminEmployeeDAO();
		
		dao.empdel(delnum);//지워버림.

		resp.sendRedirect("/AtTicketProject/adminemployee.do");
		
	}
	


	
	
}
