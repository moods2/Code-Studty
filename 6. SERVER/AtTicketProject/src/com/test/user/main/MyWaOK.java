package com.test.user.main;

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

import com.test.user.mypage.MyWaDTO;

@WebServlet("/mywaok.do")
public class MyWaOK extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		String beginW = req.getParameter("beginW");
		String endW = req.getParameter("endW");
		String nowPageW = req.getParameter("nowPageW");
		
		HashMap<String,String> map1 = new HashMap<String,String>();
		map1.put("beginW", beginW);
		map1.put("endW", endW);
		map1.put("cusseq", cusseq);
		
		//2.
		MyHDAO dao = new MyHDAO();
		int pageSizeW = 2;
		int totalPageW = (int)Math.ceil((double)dao.getTotalCountW(cusseq)/pageSizeW);
	
		if(totalPageW == 0) {
			totalPageW = 1;
		}
		
		ArrayList<MyWaDTO> wlist = dao.getWatch(map1);
		
		dao.close();
		
		//3.
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		JSONArray arr = new JSONArray();
		
		for (MyWaDTO dto : wlist) {
			JSONObject obj = new JSONObject();
//			공연명: ${dto.showtitle}<br>
//			관람일: ${dto.bdate}<br>
//			예매번호: ${bookseq}<br>	
			obj.put("showtitle", dto.getShowtitle());
			obj.put("bdate", dto.getBdate());
			obj.put("bookseq", dto.getBookseq());
			obj.put("showaddr", dto.getShowaddr());
			obj.put("nowPageW", nowPageW);
			obj.put("totalPageW", totalPageW);
			arr.add(obj);
		}
		
		writer.print(arr);
		writer.close();
		
	}
}
