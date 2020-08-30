package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex02ok.do")
public class Ex02Ok extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(txt1)
		//2. DB 작업 결과 + 1번
		//3. 반환
		
		int num = Integer.parseInt(req.getParameter("txt1"));
		
		int db = 10;
		
		int result = num + db;
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("<html>");
		writer.print("<body>");
		writer.print("<script>");
		writer.printf("location.href='/ajax/ex02.do?result=%d';"
													, result);
		writer.print("</script>");
		writer.print("</body>");
		writer.print("</html>");
		
	}
	
}





