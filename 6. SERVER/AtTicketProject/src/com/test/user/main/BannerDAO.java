package com.test.user.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.test.admin.banner.LogoDTO;
import com.test.atticket.DBUtil;

public class BannerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BannerDAO() {//생성자 생성
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
	
	public HashMap<String,String> mainlist(String slider) {
		
		try {
			
			String sql = "SELECT NAME, IMG FROM TBLBANNER WHERE NAME LIKE '%' || ? || '%'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, slider);
			
			rs = pstat.executeQuery();
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			while (rs.next()) {
				
				map.put(rs.getString("name"), rs.getString("img"));
				
			}
			
			rs.close();
			pstat.close();
			
			return map;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<BannerDTO> mainrank() {
		
		try {
			
			String sql = "SELECT SEQ, TITLE, POSTER, GENRE FROM (SELECT ROWNUM AS RNUM, A.* FROM "
					+ "(SELECT * FROM VWRANK) A) WHERE ROWNUM <= 3";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BannerDTO> rank = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				
				rank.add(dto);
				
			}
			
			rs.close();
			stat.close();
			
			return rank;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<BannerDTO> mainmusical() {
		
		try {
			
			String sql = "SELECT * FROM (SELECT ROWNUM, SEQ, TITLE, POSTER, GENRE FROM (SELECT * FROM TBLSHOW "
					+ "WHERE DELFLAG = 0 AND GENRE = 'musical' OR GENRE = 'theater' ORDER BY AGENCYSEQ) A) WHERE ROWNUM <= 6";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BannerDTO> musical = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				
				musical.add(dto);
				
			}
			
			rs.close();
			stat.close();
			
			return musical;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<BannerDTO> mainconcert() {
		
		try {
			
			String sql = "SELECT * FROM (SELECT ROWNUM, SEQ, TITLE, POSTER, GENRE FROM (SELECT * FROM TBLSHOW "
					+ "WHERE DELFLAG = 0 AND GENRE = 'concert' OR GENRE = 'classic' ORDER BY AGENCYSEQ) A) WHERE ROWNUM <= 6";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BannerDTO> concert = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				
				concert.add(dto);
				
			}
			
			rs.close();
			stat.close();
			
			return concert;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<BannerDTO> mainexhibition() {
		
		try {
			
			String sql = "SELECT * FROM (SELECT ROWNUM, SEQ, TITLE, POSTER, GENRE FROM (SELECT * FROM TBLSHOW "
					+ "WHERE DELFLAG = 0 AND GENRE = 'exhibition' ORDER BY AGENCYSEQ) A) WHERE ROWNUM <= 6";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BannerDTO> exhibition = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				
				exhibition.add(dto);
				
			}
			
			rs.close();
			stat.close();
			
			return exhibition;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public BannerDTO banner(String page) {
		
		try {
			
			String sql = "SELECT * FROM TBLBANNER WHERE NAME LIKE '%' || ? || '%'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, page);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setLink(rs.getString("link"));
				dto.setBackcolor(rs.getString("backcolor"));
				
				return dto;
				
			}
			
			rs.close();
			pstat.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	public ArrayList<BannerDTO> concertrank() {
		
		try {
			
			String sql = "SELECT RNUM, SEQ, TITLE, POSTER, GENRE, STARTDATE, ENDDATE, HALL, THEATER"
					+ " FROM (SELECT ROWNUM AS RNUM, A.* FROM "
					+ "(SELECT * FROM VWRANK WHERE GENRE = 'concert') A) WHERE ROWNUM <= 5";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BannerDTO> rank = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				dto.setStartdate(rs.getString("startdate").substring(0, 10));
				dto.setEnddate(rs.getString("enddate").substring(0, 10));
				dto.setHall(rs.getString("hall"));
				dto.setTheater(rs.getString("theater"));
				
				rank.add(dto);
				
			}
			
			rs.close();
			stat.close();
			
			return rank;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	
	public ArrayList<BannerDTO> concertregion(String regionname) {
		
		try {
			
			String sql = "SELECT * FROM VWREGION WHERE ROWNUM = 1 AND REGION = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, regionname);
			
			rs = pstat.executeQuery();
			
			ArrayList<BannerDTO> region = new ArrayList<BannerDTO>();
			
			if (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setRegion(rs.getString("region"));
				dto.setHall(rs.getString("name"));
				
				region.add(dto);
				
			}
			
			rs.close();
			pstat.close();
			
			return region;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<BannerDTO> mainhot(String whatshot) {
		
		try {
			
			String where = "";

			
			if (!whatshot.equals("")) {
				where = String.format("and genre = \'%s\'", whatshot);
			}
			
			String sql = String.format("SELECT ROWNUM AS RNUM, A.* FROM "
					+ "(SELECT SEQ, TITLE, POSTER, GENRE FROM TBLSHOW WHERE DELFLAG = 0 %s ORDER BY STARTDATE) A "
					+ "WHERE ROWNUM <= 7", where);
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BannerDTO> list = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				
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
	
	public ArrayList<BannerDTO> getslider(String page) {
		
		try {
			
			String sql = "SELECT * FROM TBLBANNER WHERE NAME LIKE '%' || ? || '%'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, page);
			
			rs = pstat.executeQuery();
			
			ArrayList<BannerDTO> list = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				BannerDTO dto = new BannerDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setIntro1(rs.getString("intro1"));
				dto.setIntro2(rs.getString("intro2"));
				dto.setIntro3(rs.getString("intro3"));
				dto.setFontcolor(rs.getString("fontcolor"));
				
				list.add(dto);
			}
			
			rs.close();
			pstat.close();
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public BannerDTO getbanner(String page) {
		
		try {
			
			String sql = "SELECT * FROM TBLBANNER WHERE NAME LIKE '%' || ? || '%'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, page);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				BannerDTO dto = new BannerDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setLink(rs.getString("link"));
				dto.setBackcolor(rs.getString("backcolor"));
				
				return dto;
			}
			
			rs.close();
			pstat.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public LogoDTO getlogo() {
		
		try {
			
			String sql = "SELECT * FROM TBLLOGO";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				LogoDTO dto = new LogoDTO();
				
				dto.setCompany(rs.getString("company"));
				dto.setAddress(rs.getString("address"));
				dto.setOwner(rs.getString("owner"));
				dto.setManager(rs.getString("manager"));
				dto.setEmail(rs.getString("email"));
				dto.setLicense(rs.getString("license"));
				dto.setSimg(rs.getString("simg"));
				dto.setImg(rs.getString("img"));
				
				return dto;
			}
			
			rs.close();
			stat.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<BannerDTO> atspick(String whatshot) {
		
		try {
			
			String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM "
					+ "(SELECT TITLE, POSTER, GENRE FROM TBLSHOW WHERE DELFLAG = 0 AND GENRE = ?) A) "
					+ "WHERE RNUM IN (6, 2, 14, 8, 11, 9)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, whatshot);
			
			rs = pstat.executeQuery();
			
			ArrayList<BannerDTO> list = new ArrayList<BannerDTO>();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				
				dto.setSeq(rs.getString("rnum"));
				dto.setName(rs.getString("title"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				
				list.add(dto);
				
			}
			rs.close();
			pstat.close();
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public int setMainBg(BannerDTO dto) {
		
		try {
			
			String sql = "UPDATE TBLBANNER SET IMG = ?, INTRO1 = ?, INTRO2 = ?, INTRO3 = ?, FONTCOLOR = ? WHERE NAME = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getImg());
			pstat.setString(2, dto.getIntro1());
			pstat.setString(3, dto.getIntro2());
			pstat.setString(4, dto.getIntro3());
			pstat.setString(5, dto.getFontcolor());
			pstat.setString(6, dto.getName());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	public int setBanner(BannerDTO dto2) {
		
		try {
			
			String sql = "UPDATE TBLBANNER SET IMG = ?, LINK = ?, BACKCOLOR = ? WHERE NAME = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getImg());
			pstat.setString(2, dto2.getLink());
			pstat.setString(3, dto2.getBackcolor());
			pstat.setString(4, dto2.getName());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	public int setLogo(LogoDTO dto3) {
		
		try {
			
			String sql = "UPDATE TBLLOGO SET COMPANY = ?, ADDRESS = ?, OWNER = ?, MANAGER = ?, EMAIL = ?, LICENSE = ?, IMG = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto3.getCompany());
			pstat.setString(2, dto3.getAddress());
			pstat.setString(3, dto3.getOwner());
			pstat.setString(4, dto3.getManager());
			pstat.setString(5, dto3.getEmail());
			pstat.setString(6, dto3.getLicense());
			pstat.setString(7, dto3.getImg());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	public int setConcertBg(HashMap<Integer, String> map) {
		
		try {
			
			String sql = "UPDATE TBLBANNER SET IMG = ? WHERE NAME = ?";
			
			for (int i=1; i<=map.size(); i++) {
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, map.get(i));
				pstat.setString(2, "concertslider0"+i);
				pstat.executeQuery();
				pstat.close();
			}
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<BannerDTO> mainopen() {
		
		try {
			
			String sql = "SELECT * FROM TBLSHOW WHERE DELFLAG = 0 AND STARTDATE > SYSDATE";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<BannerDTO> list = new ArrayList<BannerDTO>();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			
			while (rs.next()) {
				
				BannerDTO dto = new BannerDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("title"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setImg(rs.getString("poster"));
				dto.setGenre(rs.getString("genre").toUpperCase());
				
				Date open = format.parse(rs.getString("opendate"));
				long diffDay = (today.getTime() - open.getTime()) / (24*60*60*1000);
				
				dto.setOpendate(Long.toString(diffDay));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
