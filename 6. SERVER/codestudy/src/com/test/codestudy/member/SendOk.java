package com.test.codestudy.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/sendok.do")
public class SendOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. DB 작업 -> insert
		//3. 결과 처리
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		//쪽지 받을 회원 번호들..
		String[] mseq = req.getParameterValues("mseq");
		String content = req.getParameter("content");
		
		//2.
		MemberDAO dao = new MemberDAO();
		MessageDTO dto = new MessageDTO();
		
		HttpSession session = req.getSession();
		
		dto.setContent(content);
		dto.setSmseq(session.getAttribute("seq").toString());
		dto.setRmseq(mseq);
		
		int result = dao.send(dto);
		
		//3.
		if (result == mseq.length) {
			resp.sendRedirect("/codestudy/member/message.do");			
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














