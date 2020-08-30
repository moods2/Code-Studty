package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.qna.UserQnaDAO;

@WebServlet("/mypagecouponok.do")
public class MyPageCouponOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		String userSeq = String.valueOf( session.getAttribute("userseq"));
		String couponSeq = req.getParameter("couponseq");
		
		MyPageJDAO dao = new MyPageJDAO();
		MypageJDTO dto = new MypageJDTO();
		
		dto.setUserSeq(userSeq);
		dto.setCouponSeq(couponSeq);
		
		int result = dao.couponOk(dto);
		
		if (result == 1) {
			resp.sendRedirect("/AtTicketProject/mypagecoupon.do");			
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
