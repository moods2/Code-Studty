package com.test.user.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.admin.customerqna.DBUtil;
import com.test.admin.customerqna.QnaDTO;

public class UserQnaDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserQnaDAO() {
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

	public int updateOk(UserQnaDTO dto) {
		
		try {
			
			String sql = "update tblQna set tag = ?, title = ?, content= ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTag());
			pstat.setString(2, dto.getSubject());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getSeq());
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateOk()");
		}
		
		
		return 0;
	}

	public int deletecontent(String seq) {
		
		
		try {
			
			String sql = "update tblQna set delflag = 1 where seq = ?";
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deletecontent()");
		}
		
		
		return 0;
	}

	public int write(UserQnaDTO dto) {
		
		try {
			
			String sql = "insert into tblqna values (QNASEQ.nextval, ?, ?, ?,DEFAULT, DEFAULT, ?, DEFAULT , null)";
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getTag());
			pstat.setString(4, dto.getUserseq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("write()");
		}
		
		
		return 0;
	}

	public ArrayList<UserQnaDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("and (name like '%%%s%%' or title like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"), map.get("search"));
			}
			
			String sort = "";
			String sql = "";
			
			if (map.get("sort") != null) {
				
				sort = String.format("where tag = '%s'", map.get("sort"));
				
				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwAdminQnaBoard %s and cusseq = %s order by seq desc) a) where rnum >= %s and rnum <=%s %s", 
						sort, map.get("userseq"), map.get("begin"), map.get("end"), 
						 where);
			}
			
			if (map.get("sort") == null) {
				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwAdminQnaBoard where cusseq = %s order by seq desc) a) where rnum >= %s and rnum <=%s %s", 
					map.get("userseq"), map.get("begin"), map.get("end"), 
					where);
			}

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<UserQnaDTO> list = new ArrayList<UserQnaDTO>();
			
			while (rs.next()) {
				UserQnaDTO dto = new UserQnaDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setTag(rs.getString("tag"));
				dto.setQview(rs.getInt("qview"));
				dto.setAnsSeq(rs.getInt("ansSeq"));
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("QnaDTO.list()");
			
		}
		
		
		
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("where (title like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"));
			}
			
			String sql = "";
			String sort = "";
			
			
			if (map.get("sort") != null) {
				
				sort = String.format("where tag = '%s'", map.get("sort"));
				sql = String.format("select count(*) as cnt from tblqna %s %s", where, sort);
			}
			
			if (map.get("sort") == null) {
				sql = String.format("select count(*) as cnt from tblqna %s", where);
			}
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			//System.out.println("==="+sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getTotalCount");
		}
		
		return 0;
	}

	public int getMyQnaTotalCount(HashMap<String, String> map) {
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("and (title like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"));
				System.out.println("검색 있");
			}
			
			String sql = "";
			String sort = "";
			
			
			if (map.get("sort") != null) {
				
				sort = String.format("and tag = '%s'", map.get("sort"));
				sql = String.format("select count(*) as cnt from tblqna where cusseq = %s %s %s ",map.get("userseq"), where, sort);
				
				System.out.println("소트 있");
			}
			
			if (map.get("sort") == null) {
				sql = String.format("select count(*) as cnt from tblqna where cusseq = %s %s ",map.get("userseq"), where);
				System.out.println("소트 없");
			}
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyQnaTotalCount");
		}
		return 0;
	}


}
