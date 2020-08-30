package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.atticket.UserDTO;

@WebServlet("/usercreateend.do")
public class UserCreateEnd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//여기서 상대방이 입력한 정보를 검증해준다
		
		req.setCharacterEncoding("UTF-8");
		
		//1. 데이터 가져오기
		String name = req.getParameter("name");
		String ssn = req.getParameter("frontregnum") + "-" + req.getParameter("backregnum");
		String id = req.getParameter("userid");
		String pw = req.getParameter("userpw");
		String address = req.getParameter("address");
		String tel = req.getParameter("frontphonenum") + "-" + req.getParameter("middlephonenum") + "-" + req.getParameter("backphonenum");
		String email = req.getParameter("frontemail") + "@" + req.getParameter("backemail");
		
		
		//2. DB 작업 -> DAO 에게 위임
		UserDAO dao = new UserDAO();
		
		//상자를 만들어서 데이터를 넘길것이므로~
		UserDTO dto = new UserDTO();
		dto.setName(name);//이름 넣기
		dto.setSsn(ssn);//주민번호 넣기
		dto.setId(id);//아이디 넣기
		dto.setPw(pw);//비밀번호 넣기
		dto.setAddr(address);//주소 넣기
		dto.setTel(tel);//전화번호 넣기
		dto.setEmail(email);//이메일 넣기
		
		
		int result = dao.userCreate(dto);
		dao.close();
		System.out.println(result);
		
		if (result == 1) {
			//회원가입에 성공한 경우
			
			resp.sendRedirect("/AtTicketProject/userindex.do");
			
		} else {
			//로그인에 실패한 경우
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");//알림 띄우고 뒤로가기
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		}
		
		
		
	}
	
	
}
