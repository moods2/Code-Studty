package com.test.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.atticket.DBUtil;
import com.test.user.show.RankDTO;

public class ReviewDAO {
	
	//DB 담당
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ReviewDAO() {
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
	
	public ArrayList<ReviewDTO> getList(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				where = String.format("and (title like '%%%s%%' or content like '%%%s%%')"
									, map.get("search"), map.get("search"));
			}
			
			String sql = String.format("SELECT * FROM (SELECT RV.*, ROWNUM AS RNUM FROM "
									+ "(SELECT R.*, (SELECT NAME FROM TBLCUSTOMER WHERE SEQ = R.CUSSEQ) AS CNAME "
									+ "FROM TBLREVIEW R WHERE DELFLAG = 0 %s ORDER BY REGDATE DESC, SEQ DESC) RV) "
									+ "WHERE RNUM >= %s AND RNUM <= %s"
									, where, map.get("begin"), map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
			
				ReviewDTO dto = new ReviewDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0, 10));
				dto.setRview(rs.getString("rview"));
				dto.setCusseq(rs.getString("cusseq"));
				dto.setShowseq(rs.getString("showseq"));
				dto.setRfile(rs.getString("rfile"));
				
				dto.setCname(rs.getString("cname"));
				
				list.add(dto);
				
			}
			
			rs.close();
			stat.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("and (title like '%%%s%%' or content like '%%%s%%')"
									, map.get("search"), map.get("search"));
			}
			
			String sql = String.format("SELECT COUNT(*) AS CNT FROM TBLREVIEW WHERE DELFLAG = 0 %s", where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delete(String[] cb) {
		
		try {
			
			String sql = "UPDATE TBLREVIEW SET DELFLAG = 1 WHERE SEQ = ?";
			
			pstat = conn.prepareStatement(sql);
			int result = 0;
			
			for (String seq : cb) {
				pstat.setString(1, seq);
				result += pstat.executeUpdate();
			}
			pstat.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ReviewDTO getReview(String seq) {
		
		try {
			
			String sql = "SELECT R.*, (SELECT TITLE FROM TBLSHOW WHERE SEQ = R.SHOWSEQ) AS STITLE, "
					+ "(SELECT GENRE FROM TBLSHOW WHERE SEQ = R.SHOWSEQ) AS GENRE FROM TBLREVIEW R WHERE DELFLAG = 0 AND SEQ = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			ReviewDTO dto = new ReviewDTO();
			
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0, 10));
				dto.setShowseq(rs.getString("showseq"));
				dto.setRfile(rs.getString("rfile"));
				dto.setStitle(rs.getString("stitle"));
				dto.setGenre(rs.getString("genre"));
			}

			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<RankDTO> showList() {
		
		try {
			
			String sql = "SELECT * FROM TBLSHOW WHERE DELFLAG = 0 AND STARTDATE < SYSDATE";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<RankDTO> list = new ArrayList<RankDTO>();
			
			while (rs.next()) {
				
				RankDTO dto = new RankDTO();
				dto.setTitle(rs.getString("title"));
				dto.setGenre(rs.getString("genre"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int update(ReviewDTO dto) {
		
		try {
			
			if (dto.getRfile() == "" || dto.getRfile() == null) {
				
				String sql = "UPDATE TBLREVIEW SET TITLE = ?, CONTENT = ?, REGDATE = ?, "
						+ "SHOWSEQ = (SELECT SEQ FROM TBLSHOW WHERE TITLE = ?) WHERE SEQ = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getTitle());
				pstat.setString(2, dto.getContent());
				pstat.setString(3, dto.getRegdate());
				pstat.setString(4, dto.getStitle());
				pstat.setString(5, dto.getSeq());
				
				return pstat.executeUpdate();
				
			} else {
				
				String sql = "UPDATE TBLREVIEW SET TITLE = ?, CONTENT = ?, REGDATE = ?, "
						+ "SHOWSEQ = (SELECT SEQ FROM TBLSHOW WHERE TITLE = ?), RFILE = ? "
						+ "WHERE SEQ = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getTitle());
				pstat.setString(2, dto.getContent());
				pstat.setString(3, dto.getRegdate());
				pstat.setString(4, dto.getStitle());
				pstat.setString(5, dto.getRfile());
				pstat.setString(6, dto.getSeq());
				
				return pstat.executeUpdate();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}
