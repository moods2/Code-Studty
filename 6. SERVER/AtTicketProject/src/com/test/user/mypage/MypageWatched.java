package com.test.user.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypagewatched.do")
public class MypageWatched extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		
		Calendar now = Calendar.getInstance();
		
		MyPageHDAO dao = new MyPageHDAO();
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("now", String.format("%tF", now));
		map.put("begin", "1");
		map.put("end", "3");
		map.put("cusseq", cusseq);
		
		ArrayList<MyWaDTO> vlist = dao.getlistV(map);
		int totalCountV = dao.getTotalCountV(map);
		
		req.setAttribute("map", map);
		req.setAttribute("totalCountV", totalCountV);
		req.setAttribute("vlist", vlist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypagewatched.jsp");
		dispatcher.forward(req, resp);
		
	}

}
