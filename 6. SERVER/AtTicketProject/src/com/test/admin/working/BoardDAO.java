package com.test.admin.working;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.atticket.DBUtil;
import com.test.admin.working.BoardDTO;

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

	public int getTotalCount(HashMap<String, String> map) {

		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("where (name like '%%%s%%' or title like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"), map.get("search"));
			}
			
			String sql = String.format("select count(*) as cnt from vwboard order by seq desc");
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				System.out.println(rs.getInt("cnt"));
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			//목록 or 검색
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("where (name like '%%%s%%' or title like '%%%s%%')", map.get("search"), map.get("search"), map.get("search"));
			}

			

			String sql = String.format("select * from (select * from vwbb %s) where num >= %s and num <= %s"  , where, map.get("begin"), map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				//레코드 1줄 -> BoardDTO 1개
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setNview(rs.getInt("nview"));			
				
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int write(BoardDTO dto) {
		
		try {

			
			String sql = "insert into tblemplonotice (seq, title, content, regdate, nview, emseq, delflag, inputfile) values (emplonoticeseq.nextval, ?, ?, default,default,999,default,?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			System.out.println(dto.getContent());
			pstat.setString(2, dto.getContent());
			//pstat.setString(3, dto.getEmseq());			
			pstat.setString(3, dto.getGetInputfile());
			
			return pstat.executeUpdate();			

		} catch (Exception e) {
			System.out.println("BoardDAO.write()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public void updateReadcount(String seq) {
		
		try {

			String sql = "update tblemplonotice set nview = nview + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			

		} catch (Exception e) {
			System.out.println("BoardDAO.updateReadcount()");
			e.printStackTrace();
		}
		
	}

	public BoardDTO get(BoardDTO dto2) {
		
		try {
			
			String sql = "select a.*, (select name from tblemployee where seq = a.emseq) as name from tblemplonotice a where seq = ?";
			
			pstat = conn.prepareStatement(sql);			
			pstat.setString(1, dto2.getSeq());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setNview(rs.getInt("nview"));				
				dto.setEmseq(rs.getString("emseq"));
				dto.setDelfalg(rs.getString("delflag"));				
				dto.setName(rs.getString("name"));			
				
				
				return dto;				
			}
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
	}

	public int delete(String seq) {
		
		try {

			String sql = "delete from tblemplonotice where seq = ?";
			
			System.out.println("바보");
			System.out.println(seq);
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.delete()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int edit(BoardDTO dto) {
		
		try {

			String sql = "update tblemplonotice set title = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.edit()");
			e.printStackTrace();
		}
		
		return 0;
	}

	


	
	

		

}
