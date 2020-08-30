package com.test.admin.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.admin.event.EventDTO;
import com.test.atticket.DBUtil;

public class EventDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public EventDAO() {
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
				where = String.format("where (title like '%%%s%%')", map.get("search"));
			}
			
			
			String sql = "select count(*) as cnt from tblevent order by seq desc";
			
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

	public ArrayList<EventDTO> list(HashMap<String, String> map) {
		
		try {
			
			//목록 or 검색
//			String where = "";
//			
//			if (map.get("search") != null) {
//				//이름 & 제목 & 내용 - 포괄 검색
//				where = String.format("where (name like '%%%s%%' or title like '%%%s%%')", map.get("search"), map.get("search"), map.get("search"));
//			}

			

			String sql = "select * from tblevent order by seq desc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<EventDTO> list = new ArrayList<EventDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				//레코드 1줄 -> EventDTO 1개
				EventDTO dto = new EventDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setEindex(rs.getString("eindex"));
				dto.setBanner(rs.getString("banner"));
				dto.setContent(rs.getString("content"));
				dto.setShowseq(rs.getInt("showseq"));
				dto.setDelflag(rs.getString("delflag"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("EventDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int write(EventDTO dto) {
		
		try {
			
			String sql = "insert into tblevent (seq, title, startdate, enddate,eindex,banner,content,showseq,delflag) values (eventseq.nextval,?, to_date(?,'yy-mm-dd'),to_date(?,'yy-mm-dd'),?,?,?,?,default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getStartdate());
			pstat.setString(3, dto.getEnddate());
			pstat.setString(4, dto.getEindex());
			pstat.setString(5, dto.getBanner());
			pstat.setString(6, dto.getContent());
			pstat.setInt(7, dto.getShowseq());
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public EventDTO get(EventDTO dto2) {
		 
		try {
			
			String sql = "select * from tblevent where seq = ?";
			
			pstat = conn.prepareStatement(sql);			
			pstat.setString(1, dto2.getSeq());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				EventDTO dto = new EventDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setEindex(rs.getString("eindex"));
				dto.setBanner(rs.getString("banner"));
				dto.setContent(rs.getString("content"));
				dto.setShowseq(rs.getInt("showseq"));
				dto.setDelflag(rs.getString("delflag"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int edit(EventDTO dto) {
		
		try {
			
			//String sql = "update tblevent set title = ?, startdate = to_date(?,'yy/mm/dd'), enddate = to_date(?,'yy/mm/dd'), eindex = ?, banner = ? , content = ?, showseq=?, delflag = ?  where seq = ?";
			String sql = "update tblevent set title = ?, startdate = to_date(?,'yy-mm-dd hh24:mi:ss'), enddate = to_date(?,'yy-mm-dd hh24:mi:ss'), eindex = ?, banner = ? , content = ?, showseq=?, delflag = ?  where seq = ?";
//			String sql = "update tblevent set title = ?, startdate = to_date(?,'yy-mm-dd hh24:mi:ss'), enddate = to_date(?,'yy-mm-dd hh24:mi:ss'), eindex = ?, banner = ? , content = ?, showseq=? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getStartdate());
			pstat.setString(3, dto.getEnddate());
			pstat.setString(4, dto.getEindex());
			pstat.setString(5, dto.getBanner());
			pstat.setString(6, dto.getContent());
			pstat.setInt(7, dto.getShowseq());
			pstat.setString(8, dto.getDelflag());
			pstat.setString(9, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

//	public int write(EventDTO dto) {
//		
//		try {
//
//			
//			String sql = "insert into tblemplonotice (seq, title, content, regdate, nview, emseq, delflag, inputfile) values (emplonoticeseq.nextval, ?, ?, default,default,999,default,?)";
//			
//			pstat = conn.prepareStatement(sql);
//			pstat.setString(1, dto.getTitle());
//			System.out.println(dto.getContent());
//			pstat.setString(2, dto.getContent());
//			//pstat.setString(3, dto.getEmseq());			
//			pstat.setString(3, dto.getGetInputfile());
//			
//			return pstat.executeUpdate();			
//
//		} catch (Exception e) {
//			System.out.println("EventDAO.write()");
//			e.printStackTrace();
//		}
//		
//		return 0;
//	}

//	public void updateReadcount(String seq) {
//		
//		try {
//
//			String sql = "update tblemplonotice set nview = nview + 1 where seq = ?";
//			
//			pstat = conn.prepareStatement(sql);
//			pstat.setString(1, seq);
//			
//			pstat.executeUpdate();
//			
//
//		} catch (Exception e) {
//			System.out.println("EventDAO.updateReadcount()");
//			e.printStackTrace();
//		}
//		
//	}

//	public EventDTO get(EventDTO dto2) {
//		
//		try {
//			
//			String sql = "select a.*, (select name from tblemployee where seq = a.emseq) as name from tblemplonotice a where seq = ?";
//			
//			pstat = conn.prepareStatement(sql);			
//			pstat.setString(1, dto2.getSeq());
//			
//			rs = pstat.executeQuery();
//			
//			if (rs.next()) {
//				
//				EventDTO dto = new EventDTO();
//				
//				dto.setSeq(rs.getString("seq"));
//				dto.setTitle(rs.getString("title"));
//				dto.setContent(rs.getString("content"));
//				dto.setRegdate(rs.getString("regdate"));
//				dto.setNview(rs.getInt("nview"));				
//				dto.setEmseq(rs.getString("emseq"));
//				dto.setDelfalg(rs.getString("delflag"));				
//				dto.setName(rs.getString("name"));			
//				
//				
//				return dto;				
//			}
//			
//			
//			
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//			
//		}
//		
//		return null;
//	}

//	public int delete(String seq) {
//		
//		try {
//
//			String sql = "delete from tblemplonotice where seq = ?";
//			
//			System.out.println("바보");
//			System.out.println(seq);
//			
//			pstat = conn.prepareStatement(sql);
//			pstat.setString(1, seq);
//			
//			return pstat.executeUpdate();
//
//		} catch (Exception e) {
//			System.out.println("EventDAO.delete()");
//			e.printStackTrace();
//		}
//		
//		return 0;
//	}

//	public int edit(EventDTO dto) {
//		
//		try {
//
//			String sql = "update tblemplonotice set title = ?, content = ? where seq = ?";
//			
//			pstat = conn.prepareStatement(sql);
//			pstat.setString(1, dto.getTitle());
//			pstat.setString(2, dto.getContent());
//			pstat.setString(3, dto.getSeq());
//			
//			return pstat.executeUpdate();
//
//		} catch (Exception e) {
//			System.out.println("EventDAO.edit()");
//			e.printStackTrace();
//		}
//		
//		return 0;
//	}

	


	
	

		

}
