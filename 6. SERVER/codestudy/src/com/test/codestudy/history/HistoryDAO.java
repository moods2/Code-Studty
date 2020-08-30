package com.test.codestudy.history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.codestudy.DBUtil;

public class HistoryDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public HistoryDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.open();
		
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public HistoryDTO get() {
		
		try {
			
			String sql = "select * from tblHistory where seq = 1";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				//레코드 1줄 -> DTO
				HistoryDTO dto = new HistoryDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				
				return dto;
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//History
	public void edit(String content) {
		
		try {
			
			String sql = "update tblHistory set content = ? where seq = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, content);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
