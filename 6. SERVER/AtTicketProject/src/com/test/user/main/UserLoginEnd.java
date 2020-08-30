package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.atticket.UserDTO;

@WebServlet("/userloginend.do")
public class UserLoginEnd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//여기서 상대방이 입력한 id와 pw를 검증해준다
		//System.out.println("asdasdasdasd???");
		
		//1. 데이터 가져오기
		String id = req.getParameter("userid");
		String pw = req.getParameter("userpw");
		
		
		//2. DB 작업 -> DAO 에게 위임
		UserDAO dao = new UserDAO();
		
		//상자를 만들어서 데이터를 넘길것이므로~
		UserDTO dto = new UserDTO();
		dto.setId(id);//아이디 넣기
		dto.setPw(pw);//비밀번호 넣기
		
		System.out.println(req.getParameter("userid"));
		System.out.println(req.getParameter("userpw"));
		System.out.println(id);
		System.out.println(pw);
		
		
		int result = dao.userLogin(dto);
		
		System.out.println(result);
		
		if (result == 1) {
			//로그인에 성공한 경우
			HttpSession session = req.getSession();
			
			//나머지 회원들의 정보들도 session에 넘겨줘야 한다.
			UserDTO dto2 = dao.getMember(dto.getId());
		
			//dao.close();
			session.setAttribute("userseq", dto2.getSeq());//회원 번호
			session.setAttribute("username", dto2.getName());//회원 이름 
			session.setAttribute("userssn", dto2.getSsn());//회원 주민번호
			session.setAttribute("userid", dto2.getId());//회원 아이디
			session.setAttribute("userpw", dto2.getPw());//회원 비밀번호
			session.setAttribute("useregg", dto2.getEggMoney());//회원 egg머니
			session.setAttribute("useraddr", dto2.getAddr());//회원 주소
			session.setAttribute("usertel", dto2.getTel());//회원 전화번호
			session.setAttribute("useremail", dto2.getEmail());//회원 이메일
			session.setAttribute("usergrade", dto2.getGrade());//회원 등급
			
			resp.sendRedirect("/AtTicketProject/userindex.do");//다시 메인페이지로 가는데 user의 session을 안고 가는것이다.
			
		} else {
			//로그인에 실패한 경우
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();//printwriter
			
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('아이디 또는 비밀번호를 확인해주세요'); history.back();");//알림 띄우고 뒤로가기
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		}
		
		
		
	}
	
	
}
