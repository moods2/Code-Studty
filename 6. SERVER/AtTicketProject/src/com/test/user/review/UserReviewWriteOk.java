package com.test.user.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/userreviewwriteok.do")
public class UserReviewWriteOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		int cseq = (int)session.getAttribute("userseq");
		
		String path = req.getRealPath("/images/reviewFile");
//		System.out.println(path);
		int size = 1024 * 1024 * 10; // 100MB
		String filename = ""; // 첨부파일명
		String orgfilename = ""; // 첨부파일명
		
		MultipartRequest multi = new MultipartRequest(
				req, //기존의 request 객체
				path, //업로드 폴더
				size, //업로드 크기
				"UTF-8", //인코딩
				new DefaultFileRenamePolicy() //파일이 같은 이름이면 넘버링해줌
				);
		
		try {
			// 첨부파일명
			filename = multi.getFilesystemName("rfile");
			orgfilename = multi.getOriginalFileName("rfile"); // 내려받을땐 원본이름으로 받게 하기 위한 이름 저장 변수

		} catch (Exception e) {
			System.out.println(e);
		}
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String showSeq = multi.getParameter("showTitle"); //공연 번호
		String rfile = orgfilename;
		
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = new ReviewDTO();
		
		dto.setCseq(cseq);
		dto.setContent(content);
		dto.setTitle(title);
		dto.setRfile(rfile);
		dto.setShowSeq(showSeq);
		
		int result = dao.insertReview(dto);
		
		String rseq = dao.getRseq();
		
		if(result == 1) {
			resp.sendRedirect("/AtTicketProject/userreviewread.do?rseq="+rseq);
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('add failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}
	
}
