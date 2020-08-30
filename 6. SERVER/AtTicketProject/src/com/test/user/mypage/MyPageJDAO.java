package com.test.user.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.admin.customerqna.DBUtil;

public class MyPageJDAO {

	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MyPageJDAO() {
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

	public ArrayList<MypageJDTO> couponList(HashMap<String, String> map) {
		
		
		try {

			String sql = "";
			

				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwcuscoupon where userseq = %s order by couponRegistration desc) a) where rnum >= %s and rnum <=%s", 
					map.get("userseq"), map.get("begin"), map.get("end"));


			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> list = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setCouponSeq(rs.getString("couponSeq"));
				dto.setCouponName(rs.getString("couponName"));
				dto.setCouponDiscount(rs.getString("couponDiscount"));
				dto.setCouponStart(rs.getString("couponStart"));
				dto.setCouponEnd(rs.getString("couponEnd"));
				dto.setCouponRegistration(rs.getString("couponRegistration"));
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MypageJDTO.list()");
			
		}
		
		
		
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			

			String sql = String.format("select count(*) as cnt from vwcuscoupon where userseq = %s", map.get("userseq"));

			
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

	public int couponOk(MypageJDTO dto) {
		
		try {
			
			String sql = "insert into tblcuscoupon values (cuscouponSEQ.nextval, default, ?, ?, default)";
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getCouponSeq());
			pstat.setString(2, dto.getUserSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("write()");
		}
		
		return 0;
	}

	public ArrayList<MypageJDTO> myShowList(HashMap<String, String> map) {
		
		try {

			String sql = "";
			

				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwmypageshow where userseq = %s order by bookdate desc) a) where rnum >= %s and rnum <= %s", 
					map.get("userseq"), map.get("begin"), map.get("end"));


			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> list = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setBookdate(rs.getString("bookdate"));
				dto.setRinfoseq(rs.getString("rinfoseq"));
				dto.setShowseq(rs.getString("showseq"));
				dto.setShowtitle(rs.getString("showtitle"));
				dto.setShowgenre(rs.getString("showgenre"));
				dto.setShowstart(rs.getString("showstart"));
				dto.setShowend(rs.getString("showend"));
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MypageJDTO.myShowList()");
			
		}
		
		
		
		return null;
	}

	public int getMyShowTotalCount(HashMap<String, String> map) {
		try {
			

			String sql = String.format("select count(*) as cnt from vwmypageshow where userseq = %s", map.get("userseq"));

			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyShowTotalCount");
		}
		return 0;
	}

	public ArrayList<MypageJDTO> myShowListSearch(HashMap<String, String> map) {
		try {

			String sql = "";
			String title = "";
			String genre = "";
			
			if(map.get("reqshowtitle") != null) {
				
				title = String.format("and LOWER(showtitle) like LOWER('%%%s%%')", map.get("reqshowtitle"));
				
			}
			
			String defaultt = map.get("reqshowgenre");
			
			if(!defaultt.equals("default")) {
				
				genre = String.format("and showgenre = '%s'", map.get("reqshowgenre"));
				
			}
			

				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwmypageshow where userseq = %s and bookdate >= '%s' and bookdate <= '%s' %s %s order by bookdate desc) a) where rnum >= %s and rnum <= %s", 
					map.get("userseq"), map.get("bookdateFrom"), map.get("bookdateTo"), title, genre,  map.get("begin"), map.get("end"));
				
				System.out.println(sql);

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> list = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setBookdate(rs.getString("bookdate"));
				dto.setRinfoseq(rs.getString("rinfoseq"));
				dto.setShowseq(rs.getString("showseq"));
				dto.setShowtitle(rs.getString("showtitle"));
				dto.setShowgenre(rs.getString("showgenre"));
				dto.setShowstart(rs.getString("showstart"));
				dto.setShowend(rs.getString("showend"));
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MypageJDTO.myShowListSearch()");
			
		}
		return null;
	}
	
	
	public int getMyShowTotalCountSearch(HashMap<String, String> map) {
		try {
			
			String sql = "";
			String title = "";
			String genre = "";
			
			if(map.get("reqshowtitle") != null) {
				
				title = String.format("and LOWER(showtitle) like LOWER('%%%s%%')", map.get("reqshowtitle"));
				
			}
			
			String defaultt = map.get("reqshowgenre");
			
			if(!defaultt.equals("default")) {
				
				genre = String.format("and showgenre = '%s'", map.get("reqshowgenre"));
				
			}
			

				sql = String.format("select count(*) as cnt from (select a.*, rownum as rnum from (select * from vwmypageshow where userseq = %s and bookdate >= '%s' and bookdate <= '%s' %s %s order by bookdate desc) a) where rnum >= %s and rnum <= %s", 
					map.get("userseq"), map.get("bookdateFrom"), map.get("bookdateTo"), title, genre,  map.get("begin"), map.get("end"));

				System.out.println("====="+sql);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyShowTotalCountSearch");
		}
		return 0;
	}

	public ArrayList<MypageJDTO> myPageShowList(HashMap<String, String> map) {
		try {

			String sql = "";
			
				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwmyShow where userseq = %s order by myShowRegistration desc) a) where rnum >= %s and rnum <= %s", 
					map.get("userseq"),  map.get("begin"), map.get("end"));

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> list = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setMsseq(rs.getString("msseq"));
				dto.setMyShowseq(rs.getString("myShowseq"));
				dto.setMyShowTitle(rs.getString("myShowTitle"));
				dto.setMyShowPoster(rs.getString("myShowPoster"));
				dto.setMyShowstart(rs.getString("myShowstart"));
				dto.setMyShowend(rs.getString("myShowend"));
				dto.setMyShowRegistration(rs.getString("myShowRegistration"));
				dto.setMyShowTheater(rs.getString("myShowTheater"));
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MypageJDTO.myShowListSearch()");
			
		}
		return null;
	}

	public int getMyPageShowTotalCount(HashMap<String, String> map) {
		try {
			

			String sql = String.format("select count(*) as cnt from vwmyShow where userseq = %s", map.get("userseq"));

			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyPageShowTotalCount");
		}
		
		return 0;
	}

	public int deleteMyShow(String[] cbDelete) {
		
		try {

			String sql = "update tblMyShow set delflag = 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			
			int result = 0;
			
			for (String seq : cbDelete) {
				pstat.setString(1, seq);
				result += pstat.executeUpdate();
			}
			
			System.out.println(result);
			return result;

		} catch (Exception e) {
			System.out.println("deleteMyShow()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<MypageJDTO> myShowSearchList(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwMyPageShowSearch where LOWER(showTitle) like LOWER('%%%s%%') order by showseq desc) a) where rnum >= %s and rnum <= %s"
					, map.get("search"), map.get("begin"), map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> list = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setShowseq(rs.getString("showseq"));
				dto.setShowtitle(rs.getString("showTitle"));
				dto.setShowPoster(rs.getString("showPoster"));
				dto.setShowstart(rs.getString("showstart"));
				dto.setShowend(rs.getString("showend"));
				dto.setShowTheater(rs.getString("showTheater"));
				
				list.add(dto);
			}
			
			return list;
					
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("myShowSearchList");
		}
		
		return null;
	}

	public int getMyShowSearchTotalCount(HashMap<String, String> map) {
		try {
			

			String sql = String.format("select count(*) as cnt from vwMyPageShowSearch where LOWER(showTitle) like LOWER('%%%s%%')"
									, map.get("search"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			//System.out.println("==="+sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyShowSearchTotalCount");
		}
		return 0;
	}

	public int AddMyShow(String[] cbAdd, String userseq) {
		
		try {

			String sql = "insert into tblmyshow values (myshowSEQ.nextval, sysdate, ?, ? , 0)";
			pstat = conn.prepareStatement(sql);
			
			int result = 0;
			
			for (String seq : cbAdd) {
				pstat.setString(1, seq);
				pstat.setString(2, userseq);
				result += pstat.executeUpdate();
			}
			
			System.out.println(result);
			return result;

		} catch (Exception e) {
			System.out.println("deleteMyShow()");
			e.printStackTrace();
		}
				
		return 0;
	}

	public ArrayList<MypageJDTO> myPagePersonalizeList(HashMap<String, String> map) {
		try {

			String sql = "";
			
				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwMyAlarmShow where userseq = %s order by myShowRegistration desc) a) where rnum >= %s and rnum <= %s", 
					map.get("userseq"),  map.get("begin"), map.get("end"));

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> list1 = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setMsseq(rs.getString("msseq"));
				dto.setMyShowseq(rs.getString("myShowseq"));
				dto.setMyShowTitle(rs.getString("myShowTitle"));
				dto.setMyShowPoster(rs.getString("myShowPoster"));
				dto.setMyShowstart(rs.getString("myShowstart"));
				dto.setMyShowend(rs.getString("myShowend"));
				dto.setMyShowRegistration(rs.getString("myShowRegistration"));
				dto.setMyShowTheater(rs.getString("myShowTheater"));
				
				list1.add(dto);
			}
			
			return list1;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MypageJDTO.myPagePersonalizeList()");
			
		}
		return null;
	}

	public int getMyPagePersonalizeTotalCount(HashMap<String, String> map) {
		try {
			

			String sql = String.format("select count(*) as cnt from vwMyAlarmShow where userseq = %s", map.get("userseq"));

			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyPagePersonalizeTotalCount");
		}
		return 0;
	}

	public int deleteMyPersonalize(String[] cbDelete) {
		
		try {

			String sql = "update tblMyAlarmShow set delflag = 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			
			int result = 0;
			
			for (String seq : cbDelete) {
				pstat.setString(1, seq);
				result += pstat.executeUpdate();
			}
			
			System.out.println(result);
			return result;

		} catch (Exception e) {
			System.out.println("deleteMyShow()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int AddMyAlarmShow(String[] cbAdd, String userseq) {
		
		try {

			String sql = "insert into tblMyAlarmShow values (myshowSEQ.nextval, sysdate, ?, ? , 0)";
			pstat = conn.prepareStatement(sql);
			
			int result = 0;
			
			for (String seq : cbAdd) {
				pstat.setString(1, seq);
				pstat.setString(2, userseq);
				result += pstat.executeUpdate();
			}
			
			System.out.println(result);
			return result;

		} catch (Exception e) {
			System.out.println("deleteMyShow()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public ArrayList<MypageJDTO> myticketVellList(HashMap<String, String> map2) {
		
		try {

			String sql = "";
			
				sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwticketVellReal where userseq = %s order by vellopenDate desc) a) where rnum >= %s and rnum <= %s", 
					map2.get("userseq"),  map2.get("begin"), map2.get("end"));

				
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> list = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setVellseq(rs.getString("vellseq"));
				dto.setVellshowseq(rs.getString("vellshowseq"));
				dto.setVelltitle(rs.getString("velltitle"));
				dto.setVellopenDate(rs.getString("vellopenDate"));
				dto.setVelldate(rs.getString("velldate"));
				dto.setNoticeseq(rs.getString("noticeseq"));
				
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MypageJDTO.myticketVellList()");
			
		}
		
		return null;
	}

	public int getMyticketVellTotalCount(HashMap<String, String> map2) {
		
		try {
			

			String sql = String.format("select count(*) as cnt from vwticketVellReal where userseq = %s", map2.get("userseq"));

			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyPagePersonalizeTotalCount");
		}
		
		return 0;
	}

	public int deleteMyVell(String[] cbDelete) {
		try {

			String sql = "update tblMybell set delflag = 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			
			int result = 0;
			
			for (String seq : cbDelete) {
				pstat.setString(1, seq);
				result += pstat.executeUpdate();
			}
			
			System.out.println(result);
			return result;

		} catch (Exception e) {
			System.out.println("deleteMyVell()");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<MypageJDTO> seqAllGet(String userseq) {
		try {

			String sql = "";
			

				sql = String.format("select couponseq from vwcuscoupon where userseq = %s", userseq);


			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			
			ArrayList<MypageJDTO> seqAllGet = new ArrayList<MypageJDTO>();
			
			while (rs.next()) {
				MypageJDTO dto = new MypageJDTO();
				
				dto.setCouponSeq(rs.getString("couponSeq"));
				
				seqAllGet.add(dto);
			}
			
			return seqAllGet;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MypageJDTO.seqAllGet()");
			
		}
		return null;
	}


	
	
	
}
