package com.test.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Ex06_PreparedStatement {
	
	public static void main(String[] args) {
		
		//insert 작업
//		m1(); //Statement > 정적 쿼리
		m2(); //PreparedStatement > 동적 쿼리
		
		//Statement vs PreparedStatement
		//1. SQL 매개변수 유무
		// - select * from tblInsa; > Statement
		// - select * from tblInsa where num = ?; > PreparedStatement
		
	}

	private static void m2() {
		
		//사용자 입력
		String name = "아무개";
		String age = "25";
		String tel = "010-1212-4545";
		String address = "서울시 강남구's 역삼동";
		
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();

		try {

			conn = util.open();
			
			String sql = "insert into tblAddress (seq, name, age, tel, address, regdate) "
					+ "values (seqAddress.nextVal, ?, ?, ?, ?, default)";
			
			//stat = conn.createStatement();
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, name);
			stat.setString(2, age);
			stat.setString(3, tel);
			stat.setString(4, address);
			
			stat.executeUpdate();
			
			System.out.println("실행 완료");		

			stat.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
