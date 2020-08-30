package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/ex08.do")
public class Ex08 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("begin", "1");
		map.put("end", "10");
		
		ArrayList<BoardDTO> list = dao.list(map);
		
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex08.jsp");
		dispatcher.forward(req, resp);
		
	}

}
