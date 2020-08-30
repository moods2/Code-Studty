package com.test.address;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class List extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//목록 보기
		//1. DB 작업 > select
		//2. 반환 테이블 > JSP 호출하기
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "select * from tblAddress order by seq desc";
			
			DBUtil util = new DBUtil();
			conn = util.open();	
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			//rs -> ArrayList<DTO>
			ArrayList<Address> list = new ArrayList<Address>();
			
			while (rs.next()) {
				//레코드 1줄 -> Address 1줄
				Address address = new Address();
				
				address.setSeq(rs.getString("seq"));
				address.setName(rs.getString("name"));
				address.setAge(rs.getString("age"));
				address.setAddress(rs.getString("address"));
				address.setRegdate(rs.getString("regdate"));
				
				list.add(address);
			}
			
			req.setAttribute("list", list);
			
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/list.jsp");
		dispatcher.forward(req, resp);
		
	}

}
