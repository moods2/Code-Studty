package com.test.user.review;

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


@WebServlet("/userreviewshow.do")
public class UserReviewShow extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
//		String cseq = (String) session.getAttribute("userseq");
		String cseq = req.getParameter("cseq");
		String genre = req.getParameter("genre");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("cseq",cseq);
		map.put("genre",genre);
		
		
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = dao.getShowlist(map);
		
		/*
		 [
		 	{
		 		"cseq" : "1",
		 		"showseq" : "dd",
		 		"showname" : "addr"
		 	}
		 ]
		 */
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		PrintWriter writer = resp.getWriter();

		String temp = "";

		temp += "[";

		for (ReviewDTO dto : list) {
			temp += "{";
			temp += String.format("\"cseq\" : \"%d\",", dto.getCseq());
			temp += String.format("\"showseq\" : \"%s\",", dto.getShowSeq());
			temp += String.format("\"showname\" : \"%s\"", dto.getShowName());
			temp += "}";
			temp += ",";
		}

		temp = temp.substring(0, temp.length() - 1);
		temp += "]";

		writer.print(temp);
		writer.close();

	}
	
}
