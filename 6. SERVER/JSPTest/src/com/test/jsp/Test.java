package com.test.jsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//com.test.jsp > Test.java
public class Test extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req
						, HttpServletResponse resp) 
						throws ServletException, IOException {
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<body>");
		writer.println("Document");
		writer.println("</body>");		
		writer.println("</html>");
		
		writer.close();
		
	}
	
}


