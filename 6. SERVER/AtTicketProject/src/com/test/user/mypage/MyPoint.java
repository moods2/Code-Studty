package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/mypoint.do")
public class MyPoint extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String month2 = req.getParameter("month2");
		HttpSession session = req.getSession();
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		
		MyPageHDAO dao = new MyPageHDAO();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cusseq", cusseq);
		map.put("month2",month2);
		ArrayList<MyPointDTO> list = dao.getPoint(map);
		
		JSONArray arr = new JSONArray();
		
		for(MyPointDTO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("y", Integer.parseInt(dto.getEgg()));
			/* obj.put("name", dto.getShowgenre()); */
			arr.add(obj);
			
		}
		System.out.println(arr);
		//3.
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		
		
	}
}	
