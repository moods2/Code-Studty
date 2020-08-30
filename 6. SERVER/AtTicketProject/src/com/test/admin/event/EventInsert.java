package com.test.admin.event;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/event/eventinsert.do")
public class EventInsert extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/event/eventInsert.jsp");
			dispatcher.forward(req, resp);
	}
}
