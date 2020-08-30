package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
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

	
	
	//List 서블릿 -> 게시판 목록 주세요.
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			String sql = "select * from (select a.*, rownum as rnum from "
					+ "(select seq, subject, name, regdate from vwBoard order by seq desc) a)"
					+ " where rnum >= ? and rnum <= ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("begin"));
			pstat.setString(2, map.get("end"));			
			
			rs = pstat.executeQuery();
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
								
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
}










