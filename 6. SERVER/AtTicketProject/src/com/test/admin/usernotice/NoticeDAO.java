package com.test.admin.usernotice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.atticket.DBUtil;
import com.test.user.show.NtShowDTO;

public class NoticeDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public NoticeDAO() {
			
			//DB 연결 
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

		public ArrayList<NoticeDTO> list(HashMap<String, String> map) {
	
			String where = "";
			String sql = null;
			if(map.get("search")!=null && map.get("search")!="") {
				where = String.format("where (title like '%%%s%%' or regdate like '%%%s%%' or opendate like '%%%s%%')", map.get("search"),map.get("search"),map.get("search"));
			} 
			if(map.get("sort").equals("seq1")) {
				sql = String.format("select * from (select a.*, rownum as rnum, to_char(opendate,'dy') as dy from (select * from tblnotice %s order by seq asc) a) where rnum > = %s and rnum <= %s  order by seq",where,map.get("begin"),map.get("end"));
			} else {
				sql = String.format("select * from (select a.*, rownum as rnum, to_char(opendate,'dy') as dy from (select * from tblnotice %s order by seq desc) a) where rnum > = %s and rnum <= %s  order by %s desc",where,map.get("begin"),map.get("end"), map.get("sort"));
			}
			try {
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
				
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
				
					dto.setContent(rs.getString("content"));
					dto.setNindex(rs.getString("nindex"));
					dto.setNview(rs.getString("nview"));
					dto.setOpendate(rs.getString("opendate").substring(0,11));
					dto.setRegdate(rs.getString("regdate").substring(0,11));
					dto.setSeq(rs.getString("seq"));
					dto.setTitle(rs.getString("title"));
					dto.setDy(rs.getString("dy"));
					
					list.add(dto);
				}
				
				return list;
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.list()");
				e.printStackTrace();
			}
			
			return null;
		}

		public int getTotalCount(HashMap<String, String> map) {
			
			try {
				String where = "";
				
				if(map.get("search")!=null) {
					where = String.format("where (title like '%%%s%%' or regdate like '%%%s%%' or opendate like '%%%s%%')", map.get("search"),map.get("search"),map.get("search"));
				} 
				String sql = String.format("select count(*) as cnt from tblnotice %s", where);
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				if(rs.next()) {
					return rs.getInt("cnt");
				}
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getTotalCount()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public NoticeDTO getNotice() {
			
			try {
				
				String sql = null;
				sql = "select * from tblnotice where seq = ?";
				pstat = conn.prepareStatement(sql);
				
				
				
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.getNotice()");
				e.printStackTrace();
			}
			
			return null;
		}

		public int insertOk(NoticeDTO dto) {
			
			try {
				
				String sql = null;
				sql = "insert into tblnotice values(noticeSeq.nextVal,?,?,?,?,sysdate,0)";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1,dto.getNindex());
				pstat.setString(2, dto.getTitle());
				pstat.setString(3, dto.getOpendate());
				pstat.setString(4, dto.getContent());
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.insertOk()");
				e.printStackTrace();
			}
			return 0;
		}

		public ArrayList<String> getNindex() {
			try {
				String sql = "select distinct nindex from tblnotice group by nindex";
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				ArrayList<String> list = new ArrayList<String>();
				while(rs.next()) {
					list.add(rs.getString("nindex"));
				}
				return list;
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.getNindex()");
				e.printStackTrace();
			}
			return null;
		}

		public int updateOk(NoticeDTO dto) {
			
			try {
				String sql = "";
				if(dto.getContent()!=null) {
					sql = "update tblnotice set nindex = ?, title = ?, opendate= ?, content = ? where seq = ?";
				} else {
					sql = "update tblnotice set nindex = ?, title = ?, opendate= ? where seq = ?";
				}
				pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, dto.getNindex());
				pstat.setString(2, dto.getTitle());
				pstat.setString(3, dto.getOpendate());
				if(dto.getContent()!=null) {
					pstat.setString(4, dto.getContent());
					pstat.setString(5, dto.getSeq());
				} else {
					pstat.setString(4, dto.getSeq());
				}
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.getNindex()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public NoticeDTO getselect(String noticeseq) {
			try {
				
				String sql = "select * from tblnotice where seq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, noticeseq);
				rs = pstat.executeQuery();
				if(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					dto.setContent(rs.getString("content"));
					dto.setNindex(rs.getString("nindex"));
					dto.setNview(rs.getString("nview"));
					dto.setOpendate(rs.getString("opendate").substring(0,10));
					dto.setRegdate(rs.getString("regdate"));
					dto.setSeq(noticeseq);
					dto.setTitle(rs.getString("title"));
					return dto;
				}
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.getselect()");
				e.printStackTrace();
			}
			return null;
		}

		public int deleteNotice(String[] noticeseq) {
			try {
				int result = 0;
				for(int i=0;i<noticeseq.length;i++) {
					String sql = "delete tblnotice where seq = ?";
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, noticeseq[i]);
					result+=pstat.executeUpdate();
				}
				
				if(result == noticeseq.length) {
					return 1;
				} else {
					return 0;
				}
				
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.deleteNotice()");
				e.printStackTrace();
			}
			return 0;
		}

		public NoticeDTO getNotice(String noticeseq) {
			try {
				
				String sql = "select * from tblNotice where seq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, noticeseq);
				rs = pstat.executeQuery();
				if(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					dto.setSeq(rs.getString("seq"));
					dto.setNindex(rs.getString("nindex"));
					dto.setTitle(rs.getString("title"));
					dto.setOpendate(rs.getString("opendate").substring(0,10));
					dto.setContent(rs.getString("content"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setNview(rs.getString("nview"));
					return dto;
				}
				
			} catch (Exception e) {
				System.out.println("NoticeDAO.getNotice()");
				e.printStackTrace();
			}
			return null;
		}

		
}












