package com.test.jdbc;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

public class Ex04_DML {
	
	public static void main(String[] args) {
		
		//정적 SQL -> 동적 SQL
		
		Connection conn = null;
		Statement stat = null;
		Scanner scan = new Scanner(System.in);
		DBUtil util = new DBUtil();
		
		try {
			
//			System.out.print("이름 : ");
//			String name = scan.nextLine();
//			
//			System.out.print("나이 : ");
//			String age = scan.nextLine();
//			
//			System.out.print("전화 : ");
//			String tel = scan.nextLine();
//			
//			System.out.print("주소 : ");
//			String address = scan.nextLine();
			
//			String sql = String.format("insert into tblAddress (seq, name, age, tel, address, regdate) "
//					+ "values (seqAddress.nextVal, '%s', %s, '%s', '%s', default)", name, age, tel, address);
//			
//			System.out.println(sql); //디버깅 출력
			
//			String sql = "update tblAddress set age = age + 1";
			
//			String sql = "delete from tblAddress where seq = 3";
			
			
			//DDL
//			String sql = "create table tblAAA "
//					+ "(seq number primary key, "
//					+ "data varchar2(100) not null)";
			
			String sql =  "drop table tblAAA";
			
			conn = util.open();
			stat = conn.createStatement();
			
			//반환값 = 적용된 행의 갯수(단, DML에 한해서 반환)
			int result = stat.executeUpdate(sql);
			
			if (result > 0) {
				System.out.println("SQL 실행 완료");
			} else {
				System.out.println("SQL 실행 실패");
			}
			
			//자원 반환 코드 > Clean Up Code
			stat.close();
			conn.close();			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
