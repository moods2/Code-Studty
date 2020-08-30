package com.test.admin.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/genreBookRateOk.do")
public class GenreBookRateOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		ViewDAO dao = new ViewDAO();
		ArrayList<ViewDTO> gTime = dao.gTime();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		
		PrintWriter writer = resp.getWriter();
		
		String gTemp = "";
		
		gTemp += "[";
		
		for (ViewDTO dto : gTime) {
			gTemp += "{";
			gTemp += String.format("\"ggenre\":\"%s\"", dto.getGgenre());
			gTemp += ",";
			gTemp += String.format("\"grate\":\"%s\"", dto.getGrate());
			gTemp += "}";
			gTemp += ",";
		}
		
		gTemp = gTemp.substring(0, gTemp.length()-1);
		
		gTemp += "]";
		
		writer.print(gTemp);
		
		writer.close();
	
	}
	
}
