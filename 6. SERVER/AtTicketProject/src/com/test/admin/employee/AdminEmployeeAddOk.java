package com.test.admin.employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminemployeeaddok.do")
public class AdminEmployeeAddOk extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//여기서 직원새로 추가한다.
		req.setCharacterEncoding("UTF-8");
		
		
		//String empJuminLast = req.getParameter("txtjuminlast");//새로운 직원 주민 둘째
		
		//1. 데이터 가져오기
		String empName = req.getParameter("txtname");//새로운 직원 이름
		String empJumin = req.getParameter("txtjuminfirst") + "-" + req.getParameter("txtjuminlast");//새로운 직원 주민 첫째
		String empTel = req.getParameter("txtteltop") + "-" + req.getParameter("txttelmiddle") + "-" + req.getParameter("txttelbottom");//새로운 직원 전화번호 
		String empGrade = req.getParameter("txtgrade");//새로운 직원 직급
		String empSal = req.getParameter("txtsalary");//새로운 직원 봉급
		String empBuseo = "";//새로운 직원 부서
		
		if (req.getParameter("txtbuseo").equals("인사부")) {
			empBuseo = "1";
		} else if (req.getParameter("txtbuseo").equals("개발부")) {
			empBuseo = "2";
		} else if (req.getParameter("txtbuseo").equals("기획부")) {
			empBuseo = "3";
		} else if (req.getParameter("txtbuseo").equals("경영지원")) {
			empBuseo = "4";
		} else if (req.getParameter("txtbuseo").equals("홍보부")) {
			empBuseo = "5";
		} else if (req.getParameter("txtbuseo").equals("영업부")) {
			empBuseo = "6";
		}
		
		
		
		//2. DB 연동
		AdminEmployeeDAO dao = new AdminEmployeeDAO();
		
		AdminEmployeeDTO dto = new AdminEmployeeDTO();
		dto.setName(empName);
		dto.setSsn(empJumin);
		dto.setTel(empTel);
		dto.setJikwi(empGrade);
		dto.setSalary(empSal);
		dto.setBuseo(empBuseo);
		
		dao.empadd(dto);//추가 시켜주기
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/employee/adminemploaddok.jsp");
		dispatcher.forward(req, resp);
		
		
		
		
		
	}
}
