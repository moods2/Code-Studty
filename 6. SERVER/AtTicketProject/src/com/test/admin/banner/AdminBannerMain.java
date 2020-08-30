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

@WebServlet("/admin/adminbannermain.do")
public class AdminBannerMain extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String filename = req.getParameter("file");
		String bgcolor = req.getParameter("color");
		System.out.println(filename);
		System.out.println(bgcolor);
		
		BannerDAO dao = new BannerDAO();
		String slider = "mainslider";
		String page = "mainbanner";
		LogoDTO logo = dao.getlogo();
		
		ArrayList<BannerDTO> slide = dao.getslider(slider);
		BannerDTO banner = dao.getbanner(page);
		dao.close();
		
		req.setAttribute("slide", slide);
		req.setAttribute("banner", banner);
		req.setAttribute("filename", filename);
		req.setAttribute("bgcolor", bgcolor);
		req.setAttribute("logo", logo);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/banner/adminbannermain.jsp");
		dispatcher.forward(req, resp);
		
		
	}
}
