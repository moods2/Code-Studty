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

@WebServlet("/mypagereservation.do")
public class MypageReservation extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MyPageHDAO dao = new MyPageHDAO();
		HttpSession session =  req.getSession();	
		HashMap<String,String> map = new HashMap<String,String>();
		
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		String page = req.getParameter("page");
		System.out.println(page);
		Calendar now = Calendar.getInstance();
		String from = String.format("%tF", now);
		now.add(Calendar.MONTH, -1);
		String to = String.format("%tF", now);
		
		String from1 = req.getParameter("from");
		String to1 = req.getParameter("to");
		
		int nowPage = 0;
		int totalPage = 0;
		int pageSize = 3;
		int totalCount = 0;
		
		if(page == null || page == "") nowPage = 1; //default
		else nowPage = Integer.parseInt(page);
		
		map.put("begin", "1");
		map.put("end", "3");
		map.put("from", from);
		map.put("to", to);
		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount/pageSize);
		
		if(from1 != null && to1 != null) {
			map.put("from", from1);
			map.put("to", to1);
		}
	
		map.put("cusseq", cusseq);

		ArrayList<MyReDTO> rlist = dao.getlistB(map);
		
		req.setAttribute("rlist", rlist);
		req.setAttribute("map", map);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypagereservation.jsp");
		dispatcher.forward(req, resp);
		
		
	}

}
