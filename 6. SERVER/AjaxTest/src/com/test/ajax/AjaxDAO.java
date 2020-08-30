package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AjaxDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;	
	
	public AjaxDAO() {
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

	//Ex01 서블릿 -> 설문조사 1건 반환 위임
	public ResearchDTO getResearch(String seq) {
		
		try {

			String sql = "select * from tblResearch where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);			
			rs = pstat.executeQuery();
			
			ResearchDTO dto = new ResearchDTO();
			
			if (rs.next()) {
				//레코드 1줄 -> DTO 1개 옮기기
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
				dto.setItem1(rs.getString("item1"));
				dto.setItem2(rs.getString("item2"));
				dto.setItem3(rs.getString("item3"));
				dto.setItem4(rs.getString("item4"));
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
				dto.setCnt3(rs.getInt("cnt3"));
				dto.setCnt4(rs.getInt("cnt4"));
				
				return dto;
			}

		} catch (Exception e) {
			System.out.println("AjaxDAO.getResearch()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<BoardDTO> list() {
		
		try {

			String sql = "select seq, subject, regdate from tblBoard where rownum <= 20";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				//레코드 1줄 -> DTO 1개
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);//
			}
			
			return list;//
			

		} catch (Exception e) {
			System.out.println("AjaxDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int check(String id) {
		
		try {

			String sql = "select count(*) as cnt from tblMember where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //1, 0
			}

		} catch (Exception e) {
			System.out.println("AjaxDAO.check()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<ZipcodeDTO> ziplist(String search) {
		
		try {

			//dong like '%?%'
			//dong like '%' || ? || '%'
			String sql = "select * from zipcode where dong like '%' || ? || '%' order by seq asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, search);
			
			rs = pstat.executeQuery();
			
			ArrayList<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
			
			while (rs.next()) {
				ZipcodeDTO dto = new ZipcodeDTO();				
				dto.setSeq(rs.getString("seq"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setBunji(rs.getString("bunji"));				
				list.add(dto);//
			}			
			return list;//
			

		} catch (Exception e) {
			System.out.println("AjaxDAO.ziplist()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<CatDTO> catlist() {
		
		try {

			String sql = "select * from tblCat";
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			ArrayList<CatDTO> list = new ArrayList<CatDTO>();
			
			while (rs.next()) {
				CatDTO dto = new CatDTO();	
				dto.setSeq(rs.getString("seq"));
				dto.setCatid(rs.getString("catid"));
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));
				list.add(dto);//
			}			
			return list;//
			

		} catch (Exception e) {
			System.out.println("AjaxDAO.ziplist()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int editCat(CatDTO dto) {
		
		try {

			String sql = "update tblCat set x = ?, y = ? where catid = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getX());
			pstat.setString(2, dto.getY());
			pstat.setString(3, dto.getCatid());
			
			return pstat.executeUpdate();			

		} catch (Exception e) {
			System.out.println("AjaxDAO.editCat()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<String> searchlist(String word) {
		
		try {

			String sql = "select word from tblSearch"
					+ " where word like ? || '%' order by word asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, word);
			
			rs = pstat.executeQuery();
			
			ArrayList<String> list = new ArrayList<String>();
			
			while (rs.next()) {
				//레코드 1줄 -> DTO 1개
				list.add(rs.getString("word"));
			}
			
			return list;			

		} catch (Exception e) {
			System.out.println("AjaxDAO.searchlist()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<String> buseolist() {
		
		try {
			
			String sql = "select distinct buseo from tblInsa order by buseo";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<String> list = new ArrayList<String>();
			
			while (rs.next()) {
				list.add(rs.getString("buseo"));
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public ArrayList<BuseoDTO> jikwilist(String buseo) {
		
		try {
			
			String sql = "select jikwi, count(*) as cnt from tblInsa where buseo = ? group by jikwi";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, buseo);
			
			rs = pstat.executeQuery();
			
			ArrayList<BuseoDTO> list = new ArrayList<BuseoDTO>();
			
			while (rs.next()) {
				
				BuseoDTO dto = new BuseoDTO();
				dto.setJikwi(rs.getString("jikwi"));
				dto.setCnt(rs.getString("cnt"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

}









