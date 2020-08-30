package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet ("/usercheckid.do")
public class UserCheckId extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String ssn = req.getParameter("ssn");
		System.out.println(id);
		System.out.println(ssn);
		
		//2.
		UserDAO dao = new UserDAO();
		int result = dao.checkid(id); //1, 0
		int result2 = dao.checkssn(ssn); //1, 0
		dao.close();
		System.out.println(result);
		System.out.println(result2);
		
		//3.
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"use\": %d,", result); //"use": 1
		writer.printf("\"use2\": %d", result2); //"use2": 1
		writer.print("}");
		
		
	}

}
