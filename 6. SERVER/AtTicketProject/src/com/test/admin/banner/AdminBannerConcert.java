package com.test.admin.banner;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.user.main.BannerDAO;
import com.test.user.main.BannerDTO;

@WebServlet("/admin/adminbannerconcert.do")
public class AdminBannerConcert extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String filename = req.getParameter("file");
		String color = req.getParameter("color");
		String url = req.getParameter("url");
		System.out.println(color);
		System.out.println(filename);
		System.out.println(url);
		
		String slide = "concertslider";
		String banner = "concertbanner";
		
		BannerDAO dao = new BannerDAO();
		ArrayList<BannerDTO> dto = dao.getslider(slide);
		BannerDTO dto2 = dao.getbanner(banner);
		
		req.setAttribute("slider", dto);
		req.setAttribute("banner", dto2);
		req.setAttribute("filename", filename);
		req.setAttribute("color", color);
		req.setAttribute("url", url);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/banner/adminbannerconcert.jsp");
		dispatcher.forward(req, resp);

	}
	
}
