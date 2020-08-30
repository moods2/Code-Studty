package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/ex07ok.do")
public class Ex07Ok extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(catid, x, y)
		//2. DB 작업 -> update
		//3. 결과 반환 -> 1,0
		
		//1.
		String catid = req.getParameter("catid");
		String x = req.getParameter("x");
		String y = req.getParameter("y");
		
		//2.
		AjaxDAO dao = new AjaxDAO();
		CatDTO dto = new CatDTO();
		dto.setCatid(catid);
		dto.setX(x);
		dto.setY(y);
		
		int result = dao.editCat(dto);
		
		//3.
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
	}

}
