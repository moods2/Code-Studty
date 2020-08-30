package com.test.codestudy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/heart.do")
public class Heart extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 -> insert
		//3. 결과 처리
		
		//1.
		String bseq = req.getParameter("seq"); //추천 글번호
		
		HttpSession session = req.getSession(); //추천인 회원 번호
		String mseq = (String)session.getAttribute("seq");
		
		HeartDTO dto = new HeartDTO();
		dto.setMseq(mseq);
		dto.setBseq(bseq); //포장
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		int result = 0;
		
		System.out.println(dao.checkHeart(dto));
		
		if (!dao.checkHeart(dto)) {
			result = dao.addHeart(dto);
		} else {
			result = dao.removeHeart(dto);
		}
		dao.close();
		
		//3.
		if (result == 1) {
			resp.sendRedirect("/codestudy/board/view.do?seq=" + bseq);
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










