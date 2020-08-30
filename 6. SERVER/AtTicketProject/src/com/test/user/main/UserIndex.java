package com.test.user.main;

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

@WebServlet("/userindex.do")
public class UserIndex extends HttpServlet{
	
	//고객 맨처음 시작하는 페이지 -> 메인화면을 보여주는 
	//링크만 연결할 것이므로  Get방식으로 연결해준다
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String page = "mainbanner";
		String slider = "mainslider";
		String whatshot = "";
		
		BannerDAO dao = new BannerDAO();
		HashMap<String,String> map = dao.mainlist(slider);
		ArrayList<BannerDTO> slide = dao.getslider(slider);
		BannerDTO dto = dao.banner(page);
		ArrayList<BannerDTO> hot = dao.mainhot(whatshot);
		ArrayList<BannerDTO> rank = dao.mainrank();
		ArrayList<BannerDTO> musical = dao.mainmusical();
		ArrayList<BannerDTO> concert = dao.mainconcert();
		ArrayList<BannerDTO> exhibition = dao.mainexhibition();
		ArrayList<BannerDTO> open = dao.mainopen();
		dao.close();
		
		req.setAttribute("map", map);
		req.setAttribute("slide", slide);
		req.setAttribute("banner", dto);
		req.setAttribute("hot", hot);
		req.setAttribute("rank", rank);
		req.setAttribute("musical", musical);
		req.setAttribute("concert", concert);
		req.setAttribute("exhibition", exhibition);
		req.setAttribute("open", open);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/userindex.jsp");
		dispatcher.forward(req, resp);
		
		System.out.println(req.getContextPath());
		System.out.println(session.getAttribute("userid"));
		
	}
	
}
