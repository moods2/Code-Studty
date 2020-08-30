package com.test.address;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//AddOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > insert
		//3. JSP 호출하기
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		
		//2.
		Connection conn = null;
		PreparedStatement stat = null;
		
		try {
			
			DBUtil util = new DBUtil();
			conn = util.open();
			
			String sql = "insert into tblAddress(seq, name, age, address, regdate) "
					+ "values (seqAddress.nextVal, ?, ?, ?, default)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, name);
			stat.setString(2, age);
			stat.setString(3, address);
			
			int result = stat.executeUpdate();
			
			req.setAttribute("result", result);
			
			stat.close();
			conn.close();
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/addok.jsp");
		dispatcher.forward(req, resp);
		
	}

}
