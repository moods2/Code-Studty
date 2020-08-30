package com.test.admin.banner;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.user.main.BannerDAO;
import com.test.user.main.BannerDTO;

@WebServlet("/admin/adminbannerconcertend.do")
public class AdminBannerConcertEnd extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String slider1 = req.getParameter("slider1");
		String slider2 = req.getParameter("slider2");
		String slider3 = req.getParameter("slider3");
		String slider4 = req.getParameter("slider4");
		String slider5 = req.getParameter("slider5");
		
		String backcolor = req.getParameter("backcolor");
		String backimg = req.getParameter("backimg");
		String link = req.getParameter("videosrc");
		
		System.out.println(slider1);
		System.out.println(slider2);
		System.out.println(slider3);
		System.out.println(slider4);
		System.out.println(slider5);
		System.out.println(backcolor);
		System.out.println(backimg);
		System.out.println(link);
		
		BannerDAO dao = new BannerDAO();
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		map.put(1, slider1);
		map.put(2, slider2);
		map.put(3, slider3);
		map.put(4, slider4);
		map.put(5, slider5);
		int result = dao.setConcertBg(map);
		
		BannerDTO dto2 = new BannerDTO();
		dto2.setImg(backimg);
		dto2.setLink(link);
		dto2.setBackcolor(backcolor);
		dto2.setName("concertbanner");
		int result2 = dao.setBanner(dto2);
		dao.close();
		System.out.println(result);
		System.out.println(result2);
		
		if (result == 1 && result2 == 1) {
			
			resp.sendRedirect("/AtTicketProject/admin/adminbannerconcert.do");
			
		} else { 
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
		
	}
	
}
