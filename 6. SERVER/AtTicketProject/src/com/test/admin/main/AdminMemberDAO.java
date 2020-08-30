package com.test.admin.main;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.atticket.AdminMemberDTO;
import com.test.atticket.DBUtil;

public class AdminMemberDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AdminMemberDAO() {//생성자 생성
		//DB 연결
		
		DBUtil util = new DBUtil();
		conn = util.open();//연결 완료
		
	}
	
	//로그인 하기 위한 작업
	public int login(AdminMemberDTO dto) {
		try {
			
			String sql = "select count(*) as cnt from tblAdmin where id = ? and pw = ?"; 
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());//첫번째 ?에 집어넣는것
			pstat.setString(2, dto.getPw());//두번째 ? 에 집어넣는것
			
			rs = pstat.executeQuery();//쿼리 실행
			
			if (rs.next()) {
				return rs.getInt("cnt");//1아니면 0이 반환될것이다. -> 위의 cnt 를 말하는 것이다! alias
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	public AdminMemberDTO getMember(String id) {
		
		try {
			
			String sql = "select * from tblAdminMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				AdminMemberDTO dto = new AdminMemberDTO();
				
				dto.setSeq(rs.getInt("seq"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				
				
				
				
				return dto;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	//관리자의 seq 를 가져온다.
	public int getAdminSeq(String id, String pw) {
		
		try {
			
			String sql = "select seq from tblAdmin where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			pstat.setString(2, pw);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("seq");
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		
		return -1;
	}
	
	
	
}
