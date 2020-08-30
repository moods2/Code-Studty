package com.test.admin.usernotice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/usernotice/adminusernoticecreateok.do")
public class AdminUserNoticeCreateOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		file
//		nindex
//		title
//		opendate
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		String sort = req.getParameter("sort");
		
		
		String path = req.getRealPath("/images");
	
		int size = 1024*1024*100; //100MB
		String filename = ""; 		//첨부파일명
		String content = "";
		String nindex = "";
		String title = "";
		String opendate = "";
		
		try {
			//기본의 request를 대신할 객체 
			//cos.jar 
			// MultipartRequest 객체를 만드는 순간 파일업로드도 같이 진행된다.
			MultipartRequest multi = new MultipartRequest(
					req, // 기존의 request 객체 
					path, // 업로드 폴더 
					size, // 업로드 크기 
					"UTF-8", // 인코딩 
					new DefaultFileRenamePolicy() // 똑같은 이름의 파일을 넘버링
					);
			
			//첨부파일명
			 filename = multi.getFilesystemName("content"); // <input type = "file" name = "attach">
			 content = filename;
			 nindex = multi.getParameter("nindex");
			 title = multi.getParameter("title");
			 opendate = multi.getParameter("opendate");
			//System.out.println(filename);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.setAttribute("filename", filename);
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		dto.setContent(content);
		dto.setNindex(nindex);
		dto.setOpendate(opendate);
		dto.setTitle(title);
		
		int result = dao.insertOk(dto);		
		
		if(result == 1) {
			resp.sendRedirect(String.format("/AtTicketProject/usernotice/adminusernotice.do?page=%s&search=%s&sort=%s",page,search,sort));
		} else {
			PrintWriter writer = resp.getWriter();//printwriter
			
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('추가작업에 실패했습니다.'); history.back();");//알림 띄우고 뒤로가기
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}
}	
