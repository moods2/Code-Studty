package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/ex08ok.do")
public class Ex08Ok extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(begin, end)
		//2. DB 작업 -> select
		//3. 결과 반환 -> JSON 반환
		
		//1.
		String begin = req.getParameter("begin");
		String end = req.getParameter("end");
		
		//2.
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> list = dao.list(map);
		
		dao.close();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		
		/*
		 * 
		[
		 {
			 "seq": "10",
			 "subject": "글제목",
			 "name": "이름",
			 "regdate": "2020"
		 }
		 ,
		]
		
		*/
		
		PrintWriter writer = resp.getWriter();
		
		String temp = "";
		
		temp += "[";
		
		for (BoardDTO dto : list) {
			temp += "{";
			temp += String.format("\"seq\": \"%s\",", dto.getSeq());
			temp += String.format("\"subject\": \"%s\",", dto.getSubject());
			temp += String.format("\"name\": \"%s\",", dto.getName());
			temp += String.format("\"regdate\": \"%s\"", dto.getRegdate());
			temp += "}";
			temp += ",";
		}
		
		temp = temp.substring(0, temp.length()-1);
		
		temp += "]";
		
		writer.print(temp);
		writer.close();
	}

}









