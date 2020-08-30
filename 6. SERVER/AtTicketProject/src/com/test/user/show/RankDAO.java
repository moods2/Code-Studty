package com.test.user.show;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.atticket.DBUtil;

public class RankDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public RankDAO() {//생성자 생성
		//DB 연결
		DBUtil util = new DBUtil();
		conn = util.open();//연결 완료
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<RankDTO> getRank(String sort) {
		
		try {
			
			String where = "";
			
			if (sort != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				if (sort.equals("all")) {
					where = "";
				} else {
					where = String.format("where genre = \'%s\'", sort.toLowerCase());
				}
			}
			
			String sql = String.format("SELECT * FROM VWRANK %s", where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<RankDTO> list = new ArrayList<RankDTO>();
			
			while (rs.next()) {
				RankDTO dto = new RankDTO();
				
				dto.setTitle(rs.getString("title"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setStartdate(rs.getString("startdate").substring(0, 10));
				dto.setEnddate(rs.getString("enddate").substring(0, 10));
				dto.setHall(rs.getString("hall"));
				dto.setTheater(rs.getString("theater"));
				dto.setPoster(rs.getString("poster"));
				dto.setGenre(rs.getString("genre"));
				
				dto.setSeq(rs.getString("seq"));
				
				list.add(dto);
			}
			
			rs.close();
			stat.close();
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

}
