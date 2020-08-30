package com.test.user.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/mypagedensity.do")
public class MyPageDensity extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String cusseq = String.valueOf(session.getAttribute("userseq"));
		String month1 = String.valueOf(req.getAttribute("month1"));
		MyPageHDAO dao = new MyPageHDAO();
		MyCusDTO cdto = dao.getCus(cusseq);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cusseq", cusseq);
		map.put("month1", month1);
		ArrayList<MyQDTO> qlist = dao.getQus(cusseq);
		ArrayList<MyReviewDTO> rlist = dao.getReview(cusseq);
		ArrayList<MyBuyDTO> blist = dao.getBuy(map);
		ArrayList<MyPostDTO> plist = dao.getPoster(map);
		
		resp.setCharacterEncoding("UTF-8");
		req.setAttribute("cdto",cdto);
		req.setAttribute("qlist", qlist);
		req.setAttribute("rlist", rlist);
		req.setAttribute("blist", blist);
		req.setAttribute("plist", plist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypagedensity.jsp");
		dispatcher.forward(req, resp);
	}
}
