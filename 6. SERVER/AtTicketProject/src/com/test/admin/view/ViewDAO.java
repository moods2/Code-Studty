package com.test.admin.view;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ViewDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;	
	
	public ViewDAO() {
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

	//실시간 공연 예매
	public ArrayList<ViewDTO> rTime() {
		
		try {
			
			String sql = "select * from vwrTime";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery(sql);
			
			ArrayList<ViewDTO> rTime = new ArrayList<ViewDTO>();
			
			while (rs.next()) {
				
				ViewDTO dto = new ViewDTO();
				
				dto.setGenre(rs.getString("genre"));
				dto.setPoster(rs.getString("poster"));
				dto.setRate(rs.getFloat("rate"));
				dto.setTitle(rs.getString("title"));
				dto.setShowseq(rs.getString("showseq"));
				
				rTime.add(dto);
				
			}
			
			return rTime;
			
			
		} catch (Exception e) {
			System.out.println("ViewDAO().rTime()");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public ArrayList<ViewDTO> visitor() {
		
		try {
			
			String sql = "select * from vwvisitor";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery(sql);
			
			ArrayList<ViewDTO> visitor = new ArrayList<ViewDTO>();
			
			while (rs.next()) {
				
				ViewDTO dto = new ViewDTO();
				
				dto.setVdate(rs.getString("vdate"));
				dto.setVcnt(rs.getFloat("vcnt"));
				dto.setVdate(rs.getString("vdate"));
				
				visitor.add(dto);
				
			}
			
			return visitor;
			
			
		} catch (Exception e) {
			System.out.println("ViewDAO().visitor()");
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	public ArrayList<ViewDTO> dbTime() {
		
		try {
			
			String sql = "select * from vwdbTime";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery(sql);
			
			ArrayList<ViewDTO> dbTime = new ArrayList<ViewDTO>();
			
			while (rs.next()) {
				
				ViewDTO dto = new ViewDTO();
				
				dto.setDbdate(rs.getString("dbdate"));
				dto.setDbrate(rs.getFloat("dbrate"));
				
				
				dbTime.add(dto);
				
			}
			
			return dbTime;
			
			
		} catch (Exception e) {
			System.out.println("ViewDAO().dbTime()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<ViewDTO> gTime() {
		try {
			
			String sql = "select * from vwgenreRate";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery(sql);
			
			ArrayList<ViewDTO> gTime = new ArrayList<ViewDTO>();
			
			while (rs.next()) {
				
				ViewDTO dto = new ViewDTO();
				
				dto.setGgenre(rs.getString("genre"));
				dto.setGrate(rs.getFloat("grate"));
				
				
				gTime.add(dto);
				
			}
			
			return gTime;
			
			
		} catch (Exception e) {
			System.out.println("ViewDAO().dbTime()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ViewDTO> abTime() {
		try {
			
			String sql = "select * from vwGenderRate";
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery(sql);
			
			ArrayList<ViewDTO> abTime = new ArrayList<ViewDTO>();
			
			while (rs.next()) {
				
				ViewDTO dto = new ViewDTO();
				
				dto.setAge(rs.getString("agegroup"));
				dto.setMan(rs.getFloat("man"));
				dto.setWoman(rs.getFloat("Woman"));
				
				abTime.add(dto);
				
			}
			
			return abTime;
			
			
		} catch (Exception e) {
			System.out.println("ViewDAO().abTime()");
			e.printStackTrace();
		}
		return null;
	}

}
