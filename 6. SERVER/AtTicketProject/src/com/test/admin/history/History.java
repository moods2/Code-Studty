package com.test.admin.history;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/history.do")
public class History extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HistoryDAO dao = new HistoryDAO();
		HistoryDTO dto = dao.get();
		
		int flag = 0;
		
		if(dto.getSeq().equals("0")) {
			//아무 값도 없을 때
			flag = 0;
		}else {
			flag = 1;
		}
		
		req.setCharacterEncoding("UTF-8");
		req.setAttribute("dto", dto);
		req.setAttribute("flag", flag);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/history/history.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
