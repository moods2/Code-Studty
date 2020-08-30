package com.test.admin.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/customer/cuslistinsertok.do")
public class CusListInsertOk extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String path = req.getRealPath("/images");
		System.out.println(path);
		int size = 1024*1024*100; //100MB
		
		//3. 변수 선언
		String filename = ""; 		//첨부파일명
		String orgfilename = "";	// 첨부파일명
		String name = "";
		String id = "";
		String egg = "";
		String ssn = "";
		String grade = "";
		String email = "";
		String tel = "";
		String pw = "";
		String photo = "";
		String addr = "";
		req.setCharacterEncoding("UTF-8");
		
		try {
			MultipartRequest multi = new MultipartRequest(
					req, // 기존의 request 객체 
					path, // 업로드 폴더 
					size, // 업로드 크기 
					"UTF-8", // 인코딩 
					new DefaultFileRenamePolicy() // 똑같은 이름의 파일을 넘버링
					);
	
			//첨부파일명
			filename = multi.getFilesystemName("attach"); // <input type = "file" name = "attach">
			//System.out.println(filename);
			orgfilename = multi.getOriginalFileName("attach"); //물리적인 이름
			//System.out.println(orgfilename); // 넘버링 하기 전의 이름 , 원본 이름 
			name = multi.getParameter("name");
			id = multi.getParameter("id");
			egg = multi.getParameter("egg");
			ssn = multi.getParameter("ssn");
			grade = multi.getParameter("grade");
			email = multi.getParameter("email");
			tel = multi.getParameter("tel");
			pw = multi.getParameter("pw");
			photo = filename;
			addr = multi.getParameter("address");
			
		} catch (Exception e) {
			System.out.println("CusInsertOk.doPost()");
			e.printStackTrace();
		}
		
		req.setAttribute("filename", filename);
		req.setAttribute("orgfilename", orgfilename);
		
		HttpSession session = req.getSession();
		
		
		CustomerDAO dao = new CustomerDAO();
		CustomerDTO dto = new CustomerDTO();
		
		dto.setAddr(addr);
		dto.setEgg(egg);
		dto.setEmail(email);
		dto.setGrade(grade);
		dto.setId(id);
		dto.setName(name);
		dto.setPhoto(photo);
		dto.setPw(pw);
		dto.setSsn(ssn);
		dto.setTel(tel);
		
		int result = dao.write(dto);
		PrintWriter writer = resp.getWriter();
		
		if(result == 1) {
			//resp.sendRedirect("/AtTicketProject/customer/cuslistinsert.do");
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("opener.location.reload();");
			writer.print("window.close();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		} else {
			//글쓰기 실패 
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed');history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	
	}
	
}
