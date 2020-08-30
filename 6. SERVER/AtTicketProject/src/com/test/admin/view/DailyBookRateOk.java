package com.test.admin.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/dailyBookRateOk.do")
public class DailyBookRateOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		ViewDAO dao = new ViewDAO();
		ArrayList<ViewDTO> dbTime = dao.dbTime();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		
		PrintWriter writer = resp.getWriter();
		
		String dbTemp = "";
		
		dbTemp += "[";
		
		for (ViewDTO dto : dbTime) {
			dbTemp += "{";
			dbTemp += String.format("\"dbdate\":\"%s\"", dto.getDbdate());
			dbTemp += ",";
			dbTemp += String.format("\"dbrate\":\"%s\"", dto.getDbrate());
			dbTemp += "}";
			dbTemp += ",";
		}
		
		dbTemp = dbTemp.substring(0, dbTemp.length()-1);
		
		dbTemp += "]";
		
		writer.print(dbTemp);
		
		writer.close();
	
	}
	
	
}
