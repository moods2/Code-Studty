package com.test.user.show;

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

import com.test.user.main.BannerDAO;
import com.test.user.main.BannerDTO;

@WebServlet("/userexhibition.do")
public class UserExhibition extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		String slider = "exhislider";
		String page = "exhibannertop";
		String page2 = "exhibannerbottom";
		String whatshot = "exhibition";
		
		BannerDAO dao = new BannerDAO();
		HashMap<String,String> map = dao.mainlist(slider);
		BannerDTO dto = dao.banner(page);
		BannerDTO dto2 = dao.banner(page2);
		ArrayList<BannerDTO> hot = dao.mainhot(whatshot);
		ArrayList<BannerDTO> atspick = dao.atspick(whatshot);
		dao.close();
		
		req.setAttribute("map", map);
		req.setAttribute("banner", dto);
		req.setAttribute("banner2", dto2);
		req.setAttribute("hot", hot);
		req.setAttribute("atspick", atspick);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userexhibition.jsp");
		dispatcher.forward(req, resp);
		
		System.out.println(req.getContextPath());
		System.out.println(session.getAttribute("userid"));
		
	}
	
}
