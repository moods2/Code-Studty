package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//ajax 객체의 요청 받아서 응답하는 서블릿
// - 브라우저를 상대하는 서블릿이 아니다.

//브라우저 -> HTML 문서를 반환
//ajax -> 데이터를 반환(HTML (X))
@WebServlet ("/ex04ok.do")
public class Ex04Ok extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type = req.getParameter("type");
		
		if (type.equals("1")) {
			m1(req, resp);
		} else if (type.equals("2")) {
			m2(req, resp);
		} else if (type.equals("3")) {
			m3(req, resp);
		} else if (type.equals("4")) {
			m4(req, resp);
		} else if (type.equals("5")) {
			m5(req, resp);
		} else if (type.equals("6")) {
			m6(req, resp);
		}
		
	}

	private void m6(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//m3() == m6()
		AjaxDAO dao = new AjaxDAO();
		ArrayList<BoardDTO> list = dao.list();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		String temp = "";
		
		temp += "[";
		
		for (BoardDTO dto : list) {
			temp += "{";
			temp += String.format("\"seq\": \"%s\"", dto.getSeq());
			temp += ",";
			temp += String.format("\"subject\": \"%s\"", dto.getSubject());
			temp += ",";
			temp += String.format("\"regdate\": \"%s\"", dto.getRegdate());
			temp += "}";
			temp += ",";
		}
		temp = temp.substring(0, temp.length()-1);
		
		temp += "]";
		
		writer.print(temp);
		
		writer.close();
		
	}

	private void m5(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//m2() == m5()
		AjaxDAO dao = new AjaxDAO();
		ArrayList<BoardDTO> list = dao.list();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/xml");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<?xml version='1.0' encoding='UTF-8' ?>");
		writer.print("<list>");
		
		for (BoardDTO dto : list) {
			writer.print("<item>");
			
			writer.print("<seq>");
			writer.print(dto.getSeq());
			writer.print("</seq>");
			
			writer.print("<subject>");
			writer.print(dto.getSubject());
			writer.print("</subject>");
			
			writer.print("<regdate>");
			writer.print(dto.getRegdate());
			writer.print("</regdate>");
			
			writer.print("</item>");
		}
		
		writer.print("</list>");
		writer.close();
		
	}

	private void m4(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//m1() == m4()
		AjaxDAO dao = new AjaxDAO();
		ArrayList<BoardDTO> list = dao.list();
		
		//ajax에게 게시물 반환
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		//CSV
		for (BoardDTO dto : list) {
			writer.printf("%s, %s, %s\n"
							, dto.getSeq()
							, dto.getSubject()
							, dto.getRegdate());
		}
		writer.close();
		
	}

	private void m3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//JSON 요청
		//JSON -> 자바 표기법을 사용한 객체 표현 방식
		
		/*
		
		var obj = {
			name: "홍길동",
			age: 20,
			address: "서울시"
		};
		
		{
			"name": "홍길동",
			"age": 20,
			"address": "서울시"
		}
		
		*/
		
		int count = 111;
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"result\": \"%d\"", count);
		writer.print("}");
		writer.close();
		
	}

	private void m2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//XML 요청
		// -> ajax에게 돌려주는 데이터를 XML 형식으로 만들어서 반환
		// -> writer로 작성하는 데이터가 XML 문법의 출력물이면 된다.
		
		int count = 250;
		resp.setContentType("text/xml"); //MIME(브라우저에게 현재 전달되는 데이터가 XML 형식의 데이터라고 알려주는 역할)
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<?xml version='1.0' encoding='UTF-8' ?>");
		writer.print("<item>");
		writer.print(count);
		writer.print("</item>");
		writer.close();
		
	}

	private void m1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Text 요청
		//select count(*) ->
		int count = 181;
		
		//ajax에게 응답
		PrintWriter writer = resp.getWriter();
		writer.print(count);
		writer.close();
		
	}

}
