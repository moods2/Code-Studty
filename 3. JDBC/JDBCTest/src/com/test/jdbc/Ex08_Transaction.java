package com.test.jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex08_Transaction {
	
	public static void main(String[] args) {
		
		/*
	      
	      트랜잭션 처리
	      1. 오라클(DBMS)
	         1.1 스크립트 작업 중 > 사용자 직접 > commit or roll back
	         1.2 프로시저내에세.. > 업무 제어(제어문+exception) > commit or rollback
	         
	      2. 자바(JDBC > 응용)
	         - Connection 클래스를 사용
	         
	      
	      */
	      
	      //update(댓클 카운트 증가) -> insert() 
		
		Connection conn = null;
		Statement stat = null;
		DBUtil util = new DBUtil();

		try {

			conn = util.open(); //연결
			conn.setAutoCommit(false);
			
			
			stat = conn.createStatement(); //실행

			String sql = "";
			
			//업무A
			sql = "update tblBoard set commentCount = commentCount + 1 where seq = 100";
			
			int result = stat.executeUpdate(sql); //AutoCommit
			
			//업무B
			sql = "insert into tblComment (seq, subject, pseq) values (13, '댓글', 1)";
			
			result += stat.executeUpdate(sql); //AutoCommit
			
			
			System.out.println("완료");
			
			if (result == 2) {
			conn.commit();
			} else {
				conn.rollback();
			}
			
			stat.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		
	}

}
