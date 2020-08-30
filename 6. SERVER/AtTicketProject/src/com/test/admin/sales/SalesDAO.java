package com.test.admin.sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.atticket.DBUtil;

public class SalesDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public SalesDAO() {
		//DB 연결
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}//close()

	//총 매출액 구하기
	public int getTotalSales(SalesDTO dto) {
		
		try {
			String sql = "select sum(s.price) as total " + 
					"from tblPay p inner join tblBooking b on p.bookseq = b.seq " + 
					"inner join tblRoundInfo r on b.roundSeq = r.seq " + 
					"inner join tblShow s on r.showSeq = s.seq " + 
					"where b.bookdate >= ? and b.bookdate <= ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSdate());
			pstat.setString(2, dto.getEdate());
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("total");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//장르별 매출액 구하기
	public ArrayList<SalesDTO> getGenreSales(SalesDTO dto) {
		
		try {
			String sql = "select s.genre, sum(s.price * b.cnt) as sum " + 
					"from tblShow s inner join tblRoundInfo r on s.seq=r.showseq " + 
					"inner join tblbooking b on r.seq=b.roundseq " + 
					"inner join tblPay p on b.seq=p.bookseq " + 
					"where b.bookdate >= ? and b.bookdate <= ? " + 
					"group by s.genre";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSdate());
			pstat.setString(2, dto.getEdate());
			
			rs = pstat.executeQuery();
			
			ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
			
			while(rs.next()) {
				SalesDTO dto2 = new SalesDTO();
				dto2.setGenre(rs.getString("genre"));
				dto2.setSales(rs.getInt("sum"));
				dto2.setStrSales(dto2.getSales());
				
				list.add(dto2);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//AdminBank 서블릿 -> 현재 개설된 계좌 목록 불러오기
	public ArrayList<BankDTO> getBank() {
		
		try {
			String sql = "select * from tblaccount order by seq";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BankDTO> list = new ArrayList<BankDTO>();
			
			while(rs.next()) {
				BankDTO dto = new BankDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("bank"));
				dto.setAccount(rs.getString("accountnumber"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//AdminBankAddOk 서블릿 -> 새로운 은행 계좌 insert
	public int insertBank(BankDTO dto) {
		try {
			String sql = "insert into tblAccount (seq,bank,accountnumber) values (accountSeq.nextval, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAccount());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//AdminBankEdit 서블릿 -> 불러오기
	public BankDTO getBank(String seq) {
		
		try {
			String sql = "select * from tblAccount where seq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			BankDTO dto = new BankDTO();
					
			if(rs.next()) {
				dto.setName(rs.getString("bank"));
				dto.setAccount(rs.getString("accountnumber"));
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//AdminBankEditOk 서블릿 -> update
	public int editBank(BankDTO dto) {
		try {
			String sql = "update tblAccount set bank=?, accountnumber=? where seq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAccount());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//AdminBankDelete 서블릿 -> delete
	public int deleteBank(String seq) {
		try {
			String sql = "delete from tblAccount where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	
	
}
