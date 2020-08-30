package com.test.admin.history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.atticket.DBUtil;

public class HistoryDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public HistoryDAO() {
		//DB 연결
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}//close()
	
	//Index 서블릿 -> 레코드 1개 주세요.
	public HistoryDTO get() {
		
		try {
			String sql = "select * from tblHistory where seq = 1";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				//레코드 1줄 -> DTO 1개
				HistoryDTO dto = new HistoryDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				
				return dto;
				
			} else { //결과 없을 때
				HistoryDTO dto = new HistoryDTO();
				dto.setSeq("0");
				
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//History 서블릿
	public void edit(String content) {
		
		try {
			String sql = "update tblHistory set content = ? where seq = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, content);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//HistoryOk 서블릿 
	public void add(String content) {
		try {
			String sql = "insert into tblHistory (seq,content) values (1,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, content);
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
