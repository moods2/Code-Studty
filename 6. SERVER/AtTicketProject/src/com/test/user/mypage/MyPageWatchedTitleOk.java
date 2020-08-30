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

@WebServlet("/mypagewatchedtitleok.do")
public class MyPageWatchedTitleOk extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String begin = req.getParameter("begin");
		String end = req.getParameter("end");
		String showtitle = req.getParameter("showtitle");
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("showtitle", showtitle);
		map.put("cusseq", cusseq);
		
		//2.
		MyPageHDAO dao = new MyPageHDAO();
		ArrayList<MyWaDTO> tlist = dao.getTitle(map);
		int totalCountT = dao.getTotalCountT(map);
		dao.close();
		
		//3.
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		JSONArray arr = new JSONArray();
		
		PrintWriter writer = resp.getWriter();
			
		
		for (MyWaDTO dto : tlist) {
			JSONObject obj = new JSONObject();
			obj.put("showtitle", dto.getShowtitle());
			obj.put("bdate", dto.getBdate());
			obj.put("bookseq", dto.getBookseq());
			obj.put("showaddr", dto.getShowaddr());
			obj.put("showposter", dto.getShowposter());
			obj.put("totalCountT", totalCountT);
			arr.add(obj);
		}
		System.out.println(totalCountT);
		writer.print(arr);
		writer.close();
		
	}
}
