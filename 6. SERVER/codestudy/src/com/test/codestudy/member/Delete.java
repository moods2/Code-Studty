package com.test.codestudy.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/delete.do")
public class Delete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(쪽지 번호들..)
		//2. DB 작업 -> delete
		//3. 결과 통보
		
		//1.
		String[] cbDelete = req.getParameterValues("cbDelete");
		
		//2.
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteMessage(cbDelete);
		
		//3.
		if (result == cbDelete.length) {
			
			resp.sendRedirect("/codestudy/member/message.do");
			
		} else {
			
			//회원 가입 실패
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
