package com.test.admin.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/realTimeBookRankOk.do")
public class RealTimeBookRankOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		ViewDAO dao = new ViewDAO();
		ArrayList<ViewDTO> rTime = dao.rTime();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		
		PrintWriter writer = resp.getWriter();
		
		String rtemp = "";
		
		rtemp += "[";
		
		for (ViewDTO dto : rTime) {
			rtemp += "{";
			rtemp += String.format("\"poster\":\"%s\"", dto.getPoster());
			rtemp += ",";
			rtemp += String.format("\"showseq\":\"%s\"", dto.getShowseq());
			rtemp += ",";
			rtemp += String.format("\"genre\":\"%s\"", dto.getGenre());
			rtemp += ",";
			rtemp += String.format("\"rate\":\"%s\"", dto.getRate());
			rtemp += ",";
			rtemp += String.format("\"title\":\"%s\"", dto.getTitle());
			rtemp += "}";
			rtemp += ",";
		}
		
		rtemp = rtemp.substring(0, rtemp.length()-1);
		
		rtemp += "]";
		
		writer.print(rtemp);
		
		writer.close();
	
	}
	
}
