package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.atticket.UserDTO;
import com.test.user.main.UserDAO;

@WebServlet ("/memberinfofixend.do")
public class MemberInfoFixEnd extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String name = req.getParameter("fixedname");
		String address = req.getParameter("fixedaddress");
		String tel = req.getParameter("fixedtel");
		String email = req.getParameter("fixedemail");
		
		System.out.println("회원정보");
		System.out.println(name);
		System.out.println(address);
		System.out.println(tel);
		System.out.println(email);
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		dto.setSeq((int)session.getAttribute("userseq"));
		dto.setName(name);
		if (!address.isEmpty()) {
			dto.setAddr(address);
		} else {
			dto.setAddr((String)session.getAttribute("useraddr"));
		}
		dto.setTel(tel);
		dto.setEmail(email);
		
		dao.userUpdate(dto);
		dao.close();
		
		session.setAttribute("username", name);//회원 이름
		session.setAttribute("useraddr", address);//회원 주소
		session.setAttribute("usertel", tel);//회원 전화번호
		session.setAttribute("useremail", email);//회원 이메일
		
		resp.sendRedirect("/AtTicketProject/usermypage.do");
		
	}

}
