package com.test.admin.banner;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.user.main.BannerDAO;
import com.test.user.main.BannerDTO;

@WebServlet("/admin/adminbannermainend.do")
public class AdminBannerMainEnd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String pic = req.getParameter("pic");
		String top = req.getParameter("top");
		String middle = req.getParameter("middle");
		String bottom = req.getParameter("bottom");
		String color = req.getParameter("color");
		String num = req.getParameter("num");

		BannerDAO dao = new BannerDAO();
		BannerDTO dto = new BannerDTO();
		dto.setName("mainslider0" + num);
		dto.setImg(pic);
		dto.setIntro1(top);
		dto.setIntro2(middle);
		dto.setIntro3(bottom);
		dto.setFontcolor(color);
		
		String middleBackcolor = req.getParameter("middleBackcolor");
		String middleSrc = req.getParameter("middleSrc");
		String logoImg = req.getParameter("logoImg");
		String company = req.getParameter("compName");
		String address = req.getParameter("compAddress");
		String owner = req.getParameter("compOwner");
		String manager = req.getParameter("compManager");
		String email = req.getParameter("compEmail");
		String license = req.getParameter("compLicense");
		
		BannerDTO dto2 = new BannerDTO();
		dto2.setBackcolor(middleBackcolor);
		dto2.setImg(middleSrc);
		dto2.setLink(null);
		dto2.setName("mainbanner");
		
		LogoDTO dto3 = new LogoDTO();
		dto3.setCompany(company);
		dto3.setImg(logoImg);
		dto3.setAddress(address);
		dto3.setOwner(owner);
		dto3.setManager(manager);
		dto3.setEmail(email);
		dto3.setLicense(license);
		
		if (pic != null) {
			
			int result = dao.setMainBg(dto);
			dao.close();
			
			if (result == 1) {
				
				resp.sendRedirect("/AtTicketProject/admin/adminbannermain.do");
				
			} else if (result == 0) { 
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
			
		} else {
			
			int result2 = dao.setBanner(dto2);
			int result3 = dao.setLogo(dto3);
			dao.close();
			
			if (result2 == 1 && result3 == 1) {
				resp.sendRedirect("/AtTicketProject/admin/adminbannermain.do");
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
	
}
