package com.test.codestudy.plan;

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

@WebServlet("/plan/index.do")
public class Index extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//index.do
		//index.do?year=2020&month=9
		
		String txtYear = request.getParameter("year");
		String txtMonth = request.getParameter("month");
		int year = 0;
		int month = 0;
		Calendar c = Calendar.getInstance(); //현재 시각
		
		if (txtYear == null && txtMonth == null) {
			//이번년 + 이번월
			year = c.get(Calendar.YEAR);
			month = c.get(Calendar.MONTH);//보정
		} else {
			//지정년 + 지정월
			year = Integer.parseInt(txtYear);
			month = Integer.parseInt(txtMonth);
		}
		
		
		//일정 가져오기
		PlanDAO dao = new PlanDAO();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("year", year);
		map.put("month", month);
		
		ArrayList<PlanDTO> list = dao.list(map);
		
		System.out.println(list.size());
		
		
		//달력 HTML -> JSP 전달하기
		String txtCal = "";
		
		//1. 해당월의 최대일수
		//2. 해당월 1일의 요일
		c.set(year, month, 1);
		
		int maxDate = c.getActualMaximum(Calendar.DATE);
		
		//1일 앞의 빈 <td> 출력
		for (int i=0; i<c.get(Calendar.DAY_OF_WEEK)-1; i++) {
			txtCal += "<td></td>";
		};
		
		//날짜 출력
		for (int i=1; i<=maxDate; i++) {
			
			txtCal += "<td>";
			txtCal += String.format("<div class='date'>%d</div>", i);
			
			//출력되는 날짜와 ArrayList안의 날짜가 동일하면 출력
			for (PlanDTO dto : list) {
				
				//달력 날짜 ->
				if (dto.getRegdate().equals(String.format("%tF", c))) {
					txtCal += String.format("<div class='item' data-toggle='modal' data-target='#myModal'"
							+ "onclick='setData(\"%s\", \"%s\");'>- %s</div>",dto.getRegdate(), dto.getName(), dto.getContent());
				}
				
			}
			
			txtCal += "</td>";
			
			//토요일 tr처리
			if (c.get(Calendar.DAY_OF_WEEK) == 7) {
				txtCal += "</tr><tr>";
			}
			
			c.add(Calendar.DATE, 1);
		};
		
		//마지막 일 다음의 빈 <td> 만들기
		for (int i=0; i<=7-c.get(Calendar.DAY_OF_WEEK); i++) {
			txtCal += "<td></td>";
		};
		
		//현재 년월 -> 이전 년월 + 다음 년월
		Calendar now = Calendar.getInstance();
		now.set(year, month, 1);
		
		now.add(Calendar.MONTH, -1);
		int prevYear = now.get(Calendar.YEAR);
		int prevMonth = now.get(Calendar.MONTH);
		
		now.add(Calendar.MONTH, 2);
		int nextYear = now.get(Calendar.YEAR);
		int nextMonth = now.get(Calendar.MONTH);
		
		request.setAttribute("txtCal", txtCal);	
		request.setAttribute("year", year);
		request.setAttribute("month", String.format("%02d", month));
		request.setAttribute("prevYear", prevYear);
		request.setAttribute("prevMonth", prevMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/plan/index.jsp");
		dispatcher.forward(request, response);
		
	}

}







