package com.test.admin.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/ageBookRateOk.do")
public class AgeBookRateOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		ViewDAO dao = new ViewDAO();
		ArrayList<ViewDTO> abTime = dao.abTime();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		
		PrintWriter writer = resp.getWriter();
		
		String abtemp = "";
		
		abtemp += "[";
		
		for (ViewDTO dto : abTime) {
			abtemp += "{";
			abtemp += String.format("\"age\":\"%s\"", dto.getAge());
			abtemp += ",";
			abtemp += String.format("\"man\":\"%s\"", dto.getMan());
			abtemp += ",";
			abtemp += String.format("\"woman\":\"%s\"", dto.getWoman());
			abtemp += "}";
			abtemp += ",";
		}
		
		abtemp = abtemp.substring(0, abtemp.length()-1);
		
		abtemp += "]";
		
		writer.print(abtemp);
		
		writer.close();
	
	}
	
}
