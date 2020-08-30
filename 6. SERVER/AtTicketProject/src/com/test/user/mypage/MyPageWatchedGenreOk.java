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

@WebServlet("/mypagewatchedgenreok.do")
public class MyPageWatchedGenreOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		String begin = req.getParameter("begin");
		String end = req.getParameter("end");
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		String genre = req.getParameter("genre");

		HashMap<String,String> map = new HashMap<String,String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("genre", genre);
		map.put("from", from);
		map.put("to", to);
		map.put("cusseq", cusseq);
		
		//2.
		MyPageHDAO dao = new MyPageHDAO();
		ArrayList<MyWaDTO> glist = dao.getGenre(map);
		int totalCountG = dao.getTotalCountG(map);
		
		dao.close();
		
		//3.
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		JSONArray arr = new JSONArray();
		
		for (MyWaDTO dto : glist) {
			JSONObject obj = new JSONObject();
//			공연명: ${dto.showtitle}<br>
//			관람일: ${dto.bdate}<br>
//			예매번호: ${bookseq}<br>	
			obj.put("showposter", dto.getShowposter());
			obj.put("showtitle", dto.getShowtitle());
			obj.put("bdate", dto.getBdate());
			obj.put("bookseq", dto.getBookseq());
			obj.put("showaddr", dto.getShowaddr());
			obj.put("totalCountG", totalCountG);
			arr.add(obj);
		}
		
		writer.print(arr);
		writer.close();
		
		
	}
}



