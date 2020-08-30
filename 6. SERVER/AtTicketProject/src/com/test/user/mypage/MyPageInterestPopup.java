package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypageinterestpopup.do")
public class MyPageInterestPopup extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String index = "1";
		
		index = req.getParameter("index");
		
		if(index != null) {
			req.setAttribute("index", index);
		} else {
			req.setAttribute("index", 1);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mypageinterestpopup.jsp");
		dispatcher.forward(req, resp);
		
	}

}
