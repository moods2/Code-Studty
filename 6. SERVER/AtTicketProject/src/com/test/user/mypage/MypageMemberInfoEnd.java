package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypagememberinfoend.do")
public class MypageMemberInfoEnd extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String pw = req.getParameter("password");
		
		if (pw.isEmpty()) {
			resp.setContentType("text/html; charset=UTF-8");
			
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
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('비밀번호를 확인해주세요.'); history.back();");//알림 띄우고 뒤로가기
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/memberinfofix.jsp");
		dispatcher.forward(req, resp);
		
	}

}
