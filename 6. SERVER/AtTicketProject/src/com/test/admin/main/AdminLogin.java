package com.test.admin.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.atticket.AdminMemberDTO;

@WebServlet("/adminlogin.do")
public class AdminLogin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(id,pw)
		//2. DB 작업  > select (입력한 아이디 비번이 진짜 db 에 있는지?)
		//3. 결과 반환  > 완료 처리
		
		//현재 req 객체에 jsp 에서 보내준 데이터가 저장되어 있다.** -> id와 pw 정보를 저장하고 있음.
		
		//1. 데이터 가져오기
		String id = req.getParameter("id");//아이디 가져오기 -> jsp 에서 사용자가 쓴것
		String pw = req.getParameter("pw");//비번 가져오기 -> jsp 에서 사용자가 쓴것
		
		
		//2. DB 작업 -> DAO 위임
		AdminMemberDAO dao = new AdminMemberDAO();
		
		//상자를 만들어서 담아서 데이터를 넘길것이다! -> 하나하나씩 넘기는 것보단 한번에 넘기는게 좋음
		AdminMemberDTO dto = new AdminMemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		
		
		int result = dao.login(dto);//1이 나오면 로그인이 성공인 것이고 0 이 나오면 로그인에 실패했다는것이다.
		//System.out.println("result = " + result);
		
		//3.
		if (result == 1) {
			//로그인 에 성공한 경우
			//1.인증(Authentication) : 이 사람이 우리 고객이 맞는지 확인하는 작업임.
			//- 인증티켓 을 발급할 것이다
			//- 인증티켓은 개인적이어야 하고, 전역이어야 한다!(놀이동산 어디던지 돌아다닐 수 있으므로!) 
			//	-> session 에 넣어주면 된다 인증티켓을 한번 발급받으면 어떤 페이지를 가던 죽어버리면 안된다.
			
			//세선을 어찌 가져오느냐? -> 세션객체를 받아온다
			HttpSession session = req.getSession();//세션 객체 생성
			
			//관리자의 seq 를 알아내자
			int adminSeq = dao.getAdminSeq(id,pw);
			
			session.setAttribute("adminSeq", adminSeq);//세션에  관리자 seq 를 넘긴다
			session.setAttribute("id", req.getParameter("id"));//세션에 id 데이터를 넣어준다
			session.setAttribute("pw", req.getParameter("pw"));//세션에 pw 데이터를 넣어준다.
			
			
			
			//Adminmain.java 로 정보를 옮겨준다.
			resp.sendRedirect("/AtTicketProject/adminmain.do");
			
			
			
			
		} else {
			System.out.println(result);
			//로그인에 실패한 경우
			//preintWriter 객체는 html에서 실제로 쓰는것처럼 만들어주는 것임.
			resp.setContentType("text/html; charset=UTF-8");//이걸 해야 아래 html 에서 한글을 적어도 깨지지 않는다

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
