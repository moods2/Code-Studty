package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.atticket.UserDTO;
import com.test.user.main.UserDAO;

@WebServlet ("/memberinfodeleteend.do")
public class MemberInfoDeleteEnd extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String pw = req.getParameter("password");
		
		UserDAO dao = new UserDAO();
		resp.setContentType("text/html; charset=UTF-8");
		if (pw.isEmpty()) {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('비밀번호를 입력해주세요.'); history.back();");//알림 띄우고 뒤로가기
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();	
			
		} else if (!pw.equals(session.getAttribute("userpw"))) {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('비밀번호를 확인해주세요.'); history.back();");//알림 띄우고 뒤로가기
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		} else {
			dao.userDelete((int)session.getAttribute("userseq"));
			session.invalidate();
			dao.close();
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('탈퇴 되었습니다.'); history.back();");//알림 띄우고 뒤로가기
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			resp.sendRedirect("/AtTicketProject/userindex.do");
		}
		
	}

}
