package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex12.do")
public class Ex12 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업 > select
		//2. 결과 전달 + JSP 호출하기
		
		//1.
		AjaxDAO dao = new AjaxDAO();
		
		//2.
		ArrayList<String> list = dao.buseolist();
		
		req.setAttribute("list", list);		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex12.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}












