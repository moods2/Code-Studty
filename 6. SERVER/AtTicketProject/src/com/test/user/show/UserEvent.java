package com.test.user.show;

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

import com.test.admin.event.EventDAO;
import com.test.admin.event.EventDTO;

@WebServlet("/userevent.do")
public class UserEvent extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		HashMap<String,String> map = new HashMap<String,String>();
		EventDAO dao = new EventDAO();
		ArrayList<EventDTO> list = dao.list(map);
		
		Calendar now = Calendar.getInstance();
		
		for (EventDTO dto : list) {
			
			//c. 최신글 표시하기
			// - 글쓴지 1시간 이내
			// - 현재 시각 - 글쓴 시각 < 1시간
			
			//b. 오늘 쓴글 구분하기
			//2020-08-04
//			if (dto.getRegdate().startsWith(String.format("%tF", now))) 
//			{ 
//				dto.setRegdate(dto.getRegdate().substring(11));
//			} else {
//				//a. 날짜 추출하기
//				//System.out.println(dto.getRegdate());
//				dto.setRegdate(dto.getRegdate().substring(0, 10));
//			}
			dto.setStartdate(dto.getStartdate().substring(0, 10));
			dto.setEnddate(dto.getEnddate().substring(0, 10));
			
			
			req.setAttribute("list", list);
		
		
		
		
		
		
		System.out.println(req.getContextPath());
		
		
		
		System.out.println(session.getAttribute("userid"));
			
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userevent.jsp");
		dispatcher.forward(req, resp);
		}
		
		
	
}
