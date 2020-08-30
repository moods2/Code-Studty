package com.test.admin.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/adminviewok.do")
public class AdminViewOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ViewDAO dao = new ViewDAO();
		ArrayList<ViewDTO> rTime = dao.rTime();
		ArrayList<ViewDTO> visitor = dao.visitor();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		
		PrintWriter writer = resp.getWriter();
		
		//전체
		String temp ="";
		//실시간
		String rtemp = "";
		//방문자
		String vtemp = "";
		
		rtemp += "[";
		rtemp += "[";
		
		for (ViewDTO dto : rTime) {
			rtemp += "{";
			rtemp += String.format("\"poster\":\"%s\"", dto.getPoster());
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
		
		  rtemp += ",";
		  
		  //방문자
		  
		  vtemp += "[";
		  
		  for (ViewDTO dto : visitor) { vtemp += "{"; vtemp +=
		  String.format("\"vdate\":\"%s\"", dto.getVdate()); vtemp += ","; vtemp +=
		  String.format("\"vcnt\":\"%s\"", dto.getVcnt()); vtemp += ","; vtemp +=
		  String.format("\"vrate\":\"%s\"", dto.getVrate()); vtemp += "}"; vtemp +=
		  ","; }
		  
		  vtemp = vtemp.substring(0, vtemp.length()-1);
		  
		  vtemp += "]"; vtemp += "]";
		  
		  temp = rtemp + vtemp;
		 
		
		
		
		
		//[[],[]]		
		//넘기기
		//writer.print(rtemp);
		//swriter.print(vtemp);
		writer.print(temp);
		
		writer.close();
		
		
	}
	
}
