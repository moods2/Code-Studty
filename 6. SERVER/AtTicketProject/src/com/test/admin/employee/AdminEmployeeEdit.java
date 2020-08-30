package com.test.admin.employee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminemployeeedit.do")
public class AdminEmployeeEdit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//여기서 DB를 연동하여 해당값을 가져올 것이다.
		
		System.out.println(req.getParameter("editnum"));//값을 잘 가져온다.
		
		String editnumber = req.getParameter("editnum");
		
		AdminEmployeeDAO dao = new AdminEmployeeDAO();//dao 객체 생성
		
		AdminEmployeeDTO dto = dao.editObj(editnumber);
		
		
		String seq = dto.getSeq();
		String name = dto.getName();
		String jikwi = dto.getJikwi();
		String salary = dto.getSalary();
		String ssn = dto.getSsn();
		String tel = dto.getTel();
		String buseoSeq = dto.getBuseo();
		String buseoName = "";
		
		System.out.println("---------------");
		System.out.println(seq);
		System.out.println(name);
		System.out.println(jikwi);
		System.out.println(salary);
		System.out.println(ssn);
		System.out.println(tel);
		System.out.println(buseoSeq);
		System.out.println(buseoName);
		
		if (buseoSeq.equals("1")) {
			buseoName = "인사부";
		} else if (buseoSeq.equals("2")) {
			buseoName = "개발부";
		} else if (buseoSeq.equals("3")) {
			buseoName = "기획부";
		} else if (buseoSeq.equals("4")) {
			buseoName = "경영지원";
		} else if (buseoSeq.equals("5")) {
			buseoName = "홍보부";
		} else if (buseoSeq.equals("6")) {
			buseoName = "영업부";
		} 
			
		//잘 불러와진다.

		
		
		//주민번호와 전화번호는 잘라서 넘겨야 한다.
		//1. 주민번호
		String[] ssntotal = ssn.split("-");
		String firstSsn = ssntotal[0];
		String secondSsn = ssntotal[1];
		
		//2. 전화번호
		String[] teltotal = tel.split("-");
		String middleTel = teltotal[1];
		String bottomTel = teltotal[2];
		
		
		
		req.setAttribute("seq", seq);
		req.setAttribute("name", name);
		req.setAttribute("jikwi", jikwi);
		req.setAttribute("salary", salary);
		req.setAttribute("firstSsn", firstSsn);
		req.setAttribute("secondSsn", secondSsn);
		req.setAttribute("middleTel", middleTel);
		req.setAttribute("bottomTel", bottomTel);
		req.setAttribute("buseoSeq", buseoSeq);
		req.setAttribute("buseoName", buseoName);

		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/employee/adminemploedit.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
