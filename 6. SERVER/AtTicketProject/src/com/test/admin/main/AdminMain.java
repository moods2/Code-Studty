package com.test.admin.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.admin.history.HistoryDAO;
import com.test.admin.history.HistoryDTO;

@WebServlet("/adminmain.do")
public class AdminMain extends HttpServlet{

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
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminmain.jsp");
		dispatcher.forward(req, resp);
		
		//HttpSession session = req.getSession();//세션을 불러오는 작업 수행.
		
		//System.out.println("세션값은");
		//System.out.println(session.getAttribute("id"));
		
		
	}
	
}
