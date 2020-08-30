package com.test.user.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.atticket.DBUtil;
import com.test.user.mypage.MyReDTO;
import com.test.user.mypage.MyWaDTO;

public class MyHDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MyHDAO() {
		
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

	/*
	 * public ArrayList<MyReDTO> getBook(String cusseq) { try {
	 * 
	 * String sql = "select * from vwmybook where cusseq = ?";
	 * 
	 * pstat = conn.prepareStatement(sql); pstat.setString(1, cusseq); rs =
	 * pstat.executeQuery(); ArrayList<MyReDTO> rlist = new ArrayList<MyReDTO>();
	 * while(rs.next()) { MyReDTO dto = new MyReDTO();
	 * dto.setBdate(rs.getString("cusseq"));
	 * dto.setBookdate(rs.getString("bookdate").substring(0,10));
	 * dto.setBookseq(rs.getString("bookseq")); dto.setCnt(rs.getString("cnt"));
	 * dto.setShowtitle(rs.getString("showtitle")); rlist.add(dto); } return rlist;
	 * } catch (Exception e) { System.out.println("MyHDAO.getBook()");
	 * e.printStackTrace(); } return null; }
	 */
	
	public ArrayList<MyReDTO> getlistB(HashMap<String, String> map) {
		
		try {
			String sql = "select b.* from(select a.*, rownum as rnum from (select * from vwmyreservation where cusseq = ? and to_char(bookdate,'yy/mm/dd') <= to_char(sysdate,'yy/mm/dd') and bookdate>=(to_char(add_months(sysdate,-3),'yy/mm/dd')) order by bookdate desc) a) b where rnum >=? and rnum <=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("begin"));
			pstat.setString(3, map.get("end"));	
			/*
			 * System.out.println(map.get("cusseq")); System.out.println(map.get("from"));
			 * System.out.println(map.get("to")); System.out.println(map.get("begin"));
			 * System.out.println(map.get("end"));
			 */
		
			rs = pstat.executeQuery();
			ArrayList<MyReDTO> list = new ArrayList<MyReDTO>();
			while(rs.next()) {
				MyReDTO dto = new MyReDTO();
				dto.setBdate(rs.getString("bdate").substring(0,10));
				dto.setBookdate(rs.getString("bookdate").substring(0,10));
				dto.setBookseq(rs.getString("bookseq"));
				dto.setBookstate(rs.getString("bookstate"));
				dto.setCnt(rs.getString("cnt"));
				if(rs.getString("showtitle").length()>20) {
					dto.setShowtitle(rs.getString("showtitle").substring(0,20)+"...");
				} else {
					dto.setShowtitle(rs.getString("showtitle"));
				}
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getlist()");
			e.printStackTrace();
		}
		return null;
	}
	
	public int getTotalCount(String cusseq) {
		try {
			/*
			 * String sql = "select count(*) as cnt from vwmyreservation where cusseq = ?";
			 * pstat = conn.prepareStatement(sql); pstat.setString(1, cusseq);
			 */
			String sql = "select count(*) as cnt from(select a.*, rownum as rnum from (select * from vwmyreservation where cusseq = ? and bookdate <= to_char(sysdate,'yy/mm/dd') and bookdate>(to_char(add_months(sysdate,-3),'yy/mm/dd')) order by bookseq desc) a) b";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cusseq);
				
			rs = pstat.executeQuery();
			int cnt = 0;
			while(rs.next()) {
				 cnt = rs.getInt("cnt");
			}
			return cnt;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getTotalCount()");
			e.printStackTrace();
		}
		return 0;
	}

	/*
	 * public ArrayList<MyWaDTO> getWatch(String cusseq) { try {
	 * 
	 * String sql =
	 * "select b.* from (select a.*,rownum as rnum from (select * from vwmyView where cusseq = ? order by bookseq desc) a) b where rnum >= ? and rnum <= ?"
	 * ; pstat = conn.prepareStatement(sql); pstat.setString(1, cusseq);
	 * pstat.setString(2, cusseq); pstat.setString(3, cusseq); rs =
	 * pstat.executeQuery(); ArrayList<MyWaDTO> wlist = new ArrayList<MyWaDTO>();
	 * while(rs.next()) { MyWaDTO dto = new MyWaDTO();
	 * dto.setShowtitle(rs.getString("showtitle"));
	 * dto.setBdate(rs.getString("bdate").substring(0,10));
	 * dto.setBookseq(rs.getString("bookseq"));
	 * dto.setShowaddr(rs.getString("showaddr")); wlist.add(dto); } return wlist; }
	 * catch (Exception e) { System.out.println("MyHDAO.getWatch()");
	 * e.printStackTrace(); } return null; }
	 */
	/*
	 * public ArrayList<MyWaDTO> getlistV(HashMap<String, String> map) { try {
	 * 
	 * String sql =
	 * "select b.* from (select a.*,rownum as rnum from (select * from vwmyView where cusseq = ? order by bookseq desc) a) b where rnum >= ? and rnum <= ?"
	 * ; pstat = conn.prepareStatement(sql); pstat.setString(1, map.get("cusseq"));
	 * pstat.setString(2, map.get("begin")); pstat.setString(3, map.get("end"));
	 * ArrayList<MyWaDTO> vlist = new ArrayList<MyWaDTO>(); rs =
	 * pstat.executeQuery(); while(rs.next()) { MyWaDTO dto = new MyWaDTO();
	 * dto.setBdate(rs.getString("bdate")); dto.setBookseq(rs.getString("bookseq"));
	 * dto.setCusseq(rs.getString("cusseq"));
	 * dto.setEnddate(rs.getString("enddate"));
	 * dto.setPayseq(rs.getString("payseq"));
	 * dto.setRoundseq(rs.getString("roundseq"));
	 * dto.setShowaddr(rs.getString("showaddr"));
	 * dto.setShowposter(rs.getString("showposter"));
	 * dto.setShowseq(rs.getString("showseq"));
	 * dto.setShowtitle(rs.getString("showtitle"));
	 * dto.setStartdate(rs.getString("startdate")); vlist.add(dto); } return vlist;
	 * 
	 * } catch (Exception e) { System.out.println("MyHDAO.getlistV()");
	 * e.printStackTrace(); } return null; }
	 */

	public int getTotalCountW(String cusseq) {
		try {
			
			String sql = "select count(*) as cnt from (select a.*,rownum as rnum from (select * from vwmyView where cusseq = ? order by bookseq desc) a) b";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cusseq);
			rs = pstat.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				return cnt;
			}
			
		} catch (Exception e) {
			System.out.println("MyHDAO.getTotalCountW()");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<MyWaDTO> getWatch(HashMap<String, String> map) {
		try {
			
			String sql = "";
			sql = "select b.* from (select a.*,rownum as rnum from (select * from vwmyView where cusseq = ? order by bookseq desc) a) b where rnum >= ? and rnum <= ?";
			pstat = conn.prepareStatement(sql);
		
			pstat.setString(1, map.get("cusseq"));		
			pstat.setString(2, map.get("beginW"));			
			pstat.setString(3, map.get("endW"));		

			rs = pstat.executeQuery();
			ArrayList<MyWaDTO> wlist = new ArrayList<MyWaDTO>();
			while(rs.next()) {
				MyWaDTO dto = new MyWaDTO();
				dto.setBookseq(rs.getString("bookseq"));
				dto.setCusseq(rs.getString("cusseq"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPayseq(rs.getString("payseq"));
				dto.setRoundseq(rs.getString("roundseq"));
				dto.setShowaddr(rs.getString("showaddr"));
				dto.setShowposter(rs.getString("showposter"));
				dto.setShowseq(rs.getString("showseq"));
				if(rs.getString("showtitle").length()>20) {
					dto.setShowtitle(rs.getString("showtitle").substring(0,20)+"...");
				} else {
					dto.setShowtitle(rs.getString("showtitle"));
				}
				dto.setBdate(rs.getString("bdate").substring(0,10));
				wlist.add(dto);
			}
			
			return wlist;
			
		} catch (Exception e) {
			System.out.println("MyHDAO.getWatch()");
			e.printStackTrace();
		}
		return null;
	}


}
