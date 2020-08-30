package com.test.user.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.atticket.DBUtil;
import com.test.atticket.UserDTO;

public class UserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO() {//생성자 생성
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
	
	//로그인 하기 위한 작업 -> 삭제된 회원에 대한 처리도 해줘야하는데?
	public int userLogin(UserDTO dto) {
		try {
			
			String sql = "select count(*) as cnt from tblCustomer where id = ? and pw = ? and delflag = 0"; 
			//delflag = 0 처리는 탈퇴한 회원은 다시 로그인 할 수 없으므로 로그인 하지 못하게 처리한다.
			
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
	
	//UserLoginEnd.java에서 넘어옴 -> 로그인 완료가 되면 해당 회원의 모든 정보를 세션에 넘겨주는 작업을 수행할 것이다.
	public UserDTO getMember(String id) {
		
		try {
			
			String sql = "select * from tblCustomer where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();//쿼리 날리기
			
			if (rs.next()) {
				UserDTO dto = new UserDTO();
				
				dto.setSeq(rs.getInt("seq"));
				dto.setName(rs.getString("name"));
				dto.setSsn(rs.getString("ssn"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setEggMoney(rs.getInt("egg"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setGrade(rs.getString("grade"));
				
				
				return dto;
				
			}//if
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	
	//UserCreateEnd.java에서 넘어옴 -> 회원가입 완료 시 회원의 모든 정보를 DB에 저장.
	public int userCreate(UserDTO dto) {
		
		try {
			
			String sql = "INSERT INTO TBLCUSTOMER (SEQ, NAME, SSN, ID, PW, EGG, ADDR, TEL, EMAIL, GRADE, DELFLAG) "
					+ "VALUES (CUSTOMERSEQ.NEXTVAL, ?, ?, ?, ?, 2000, ?, ?, ?, DEFAULT, DEFAULT)";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getSsn());
			pstat.setString(3, dto.getId());
			pstat.setString(4, dto.getPw());
			pstat.setString(5, dto.getAddr());
			pstat.setString(6, dto.getTel());
			pstat.setString(7, dto.getEmail());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	//MemberInfoFixEnd.java에서 넘어옴 -> 회원정보 수정 시 수정된 정보를 DB에 저장.
	public void userUpdate(UserDTO dto) {
		
		try {
			
			String sql = "UPDATE TBLCUSTOMER SET NAME = ?, ADDR = ?, TEL = ?, EMAIL = ? WHERE SEQ = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAddr());
			pstat.setString(3, dto.getTel());
			pstat.setString(4, dto.getEmail());
			pstat.setInt(5, dto.getSeq());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//MemberInfoDeleteEnd.java에서 넘어옴 -> 회원 탈퇴.
	public void userDelete(int seq) {
		
		try {
			
			String sql = "UPDATE TBLCUSTOMER SET DELFLAG = 1 WHERE SEQ = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//UserCheckId.java에서 넘어옴 -> 아이디 중복 확인
	public int checkid(String id) {
		
		try {
			
			String sql = "SELECT COUNT(*) AS CNT FROM TBLCUSTOMER WHERE ID = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //1,0
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	//UserCheckId.java에서 넘어옴 -> 주민번호 중복 확인 (회원가입 두번 방지)
	public int checkssn(String ssn) {
		
		try {
			
			String sql = "SELECT COUNT(*) AS CNT FROM TBLCUSTOMER WHERE SSN = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, ssn);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //1,0
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	//UserMypage.java에서 넘어옴 -> 쿠폰 매수 확인
	public ArrayList<CouponDTO> getCoupon(int seq) {
		
		try {
			
			String sql = "SELECT * FROM TBLCUSCOUPON WHERE DELFLAG = 0 AND CUSSEQ = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<CouponDTO> clist = new ArrayList<CouponDTO>();
			
			while (rs.next()) {
				CouponDTO dto = new CouponDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCouponseq(rs.getInt("couponseq"));
				dto.setCusseq(rs.getInt("cusseq"));
				
				clist.add(dto);
			}
			
			return clist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	//UserMypage.java에서 넘어옴 -> 이벤트 확인
	public ArrayList<EventDTO> getEvent() {
		
		try {
			
			String sql = "SELECT * FROM TBLEVENT WHERE DELFLAG = 0 AND STARTDATE < SYSDATE AND ENDDATE > SYSDATE ORDER BY STARTDATE";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<EventDTO> elist = new ArrayList<EventDTO>();
			
			while (rs.next()) {
				EventDTO dto = new EventDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setEindex(rs.getString("eindex"));
				dto.setBanner(rs.getString("banner"));
				dto.setContent(rs.getString("content"));
				dto.setShowseq(rs.getInt("showseq"));
				
				elist.add(dto);
			}
			
			return elist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}


}
