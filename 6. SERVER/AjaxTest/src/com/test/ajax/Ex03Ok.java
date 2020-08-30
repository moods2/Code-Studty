package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/ex03ok.do")
public class Ex03Ok extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		System.out.println("호출됨");
//		System.out.println(req.getParameter("num"));
//		System.out.println(req.getParameter("id"));
//		System.out.println(req.getParameter("txt1"));
		
		int txt1 = Integer.parseInt(req.getParameter("txt1"));
		int db = 123;
		int result = txt1 * db;
		
		//일부 작업 > 고비용 + 시간(10초 소요)
		try {
			Thread.sleep(10000);//일시중지
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = resp.getWriter();
		
		//Ajax 객체는 브라우저와 능력이 다르다.
		// - HTML, CSS, Javascript 파싱 능력이 없다.
		// - 순수 데이터만 반환해야 한다.(*********)
//		writer.print("<html>");
//		writer.print("<body>");
		writer.print(result);
//		writer.print("</body>");
//		writer.print("</html>");
		
		writer.close();
		
	}

}
