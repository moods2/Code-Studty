package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/ex09ok.do")
public class Ex09Ok extends HttpServlet {

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(word)
		//2. DB 작업 -> select
		//3. 결과 반환 -> JSON List 반환
		
		//1.
		req.setCharacterEncoding("UTF-8");
		String word = req.getParameter("word");
		
		//2.
		AjaxDAO dao = new AjaxDAO();
		ArrayList<String> list = dao.searchlist(word);
		dao.close();
		
		//3. ex09ok.do?word=가
//		for (String item : list) {
//			System.out.println(item);
//		}
		
		JSONArray arr = new JSONArray();
		
		for (String item : list) {
			arr.add(item);
			
//			JSONObject o = new JSONObject();
//			o.put("word", item);
//			arr.add(o);
		}
		
		//System.out.println(arr);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(arr);
		
		writer.close();
		
		
		
		//JSON 라이브러리
		//JSONObject o1 = new JSONObject();
		//JSONArray arr = new JSONArray();
		
//		JSONObject o1 = new JSONObject();
//		o1.put("name", "홍길동");
//		o1.put("age", 20);
//		
//		JSONObject o2 = new JSONObject();
//		o2.put("name", "아무개");
//		o2.put("age", 25);
//		
//		//{"name":"홍길동","age":20}
//		System.out.println(o1);
//		System.out.println(o2);	
//		
//		JSONArray arr = new JSONArray();
//		arr.add(o1);
//		arr.add(o2);
//		
//		System.out.println(arr);
		
		
				
	}
	
}












