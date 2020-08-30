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

@WebServlet("/userconcert.do")
public class UserConcert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		String slider = "concertslider";
		String page = "concertbanner";
		String whatshot = "concert";
		String region01 = "서울";
		String region02 = "부산";
		String region03 = "대전";

		BannerDAO dao = new BannerDAO();
		HashMap<String,String> map = dao.mainlist(slider);
		BannerDTO dto = dao.banner(page);
		ArrayList<BannerDTO> hot = dao.mainhot(whatshot);
		ArrayList<BannerDTO> rank = dao.concertrank();
		ArrayList<BannerDTO> region1 = dao.concertregion(region01);
		ArrayList<BannerDTO> region2 = dao.concertregion(region02);
		ArrayList<BannerDTO> region3 = dao.concertregion(region03);
		ArrayList<BannerDTO> atspick = dao.atspick(whatshot);
		dao.close();
		
		req.setAttribute("map", map);
		req.setAttribute("banner", dto);
		req.setAttribute("hot", hot);
		req.setAttribute("rank", rank);
		req.setAttribute("region1", region1);
		req.setAttribute("region2", region2);
		req.setAttribute("region3", region3);
		req.setAttribute("atspick", atspick);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userconcert.jsp");
		dispatcher.forward(req, resp);
		
		System.out.println(req.getContextPath());
		System.out.println(session.getAttribute("userid"));
		
	}
	
}
