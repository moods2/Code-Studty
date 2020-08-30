package com.test.codestudy.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.codestudy.DBUtil;

//DB 작업 담당 객체
// - 서블릿X
// - 일반 클래스O
public class MemberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
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

	
	//RegisterOk 서블릿이 MemberDTO를 주면서 회원 가입 시켜주세요..위임
	public int add(MemberDTO dto) {
		
		try {

			String sql = "insert into tblMember (seq, id, name, email, pw, pic, regdate) values (seqMember.nextVal, ?, ?, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getPw());
			pstat.setString(5, dto.getPic());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("MemberDAO.add()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//Login 서블릿이 아이디와 암호를 줄테니 이사람이 회원이 맞는지 검사?
	public int login(MemberDTO dto) {
		
		try {

			String sql = "select count(*) as cnt from tblMember where id=? and pw=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("MemberDAO.login()");
			e.printStackTrace();
		}
		
		return 0;
	}

	//Login 서블릿이 아이디를 줄테니 회원 정보 전부를 다오.
	public MemberDTO getMember(String id) {
		
		try {

			String sql = "select * from tblMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				//DTO -> Data Transfer Object
				//VO -> Value Object
				MemberDTO dto = new MemberDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPic(rs.getString("pic"));
				dto.setRegdate(rs.getString("regdate"));
				
				return dto;	
			}

		} catch (Exception e) {
			System.out.println("MemberDAO.getMember()");
			e.printStackTrace();
		}
		
		return null;
	}

	
	//Auth 서블릿 -> 회원 번호 전달 + 카운트 반환
	public HashMap<String, Integer> getCount(String seq) {
		
		try {

			String sql = "select (select count(*) as bcnt from tblBoard where mseq = ?) as bcnt, (select count(*) as ccnt from tblComment where mseq = ?) as ccnt from dual";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, seq);
			
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				map.put("bcnt", rs.getInt("bcnt"));
				map.put("ccnt", rs.getInt("ccnt"));
			}
			
			return map;

		} catch (Exception e) {
			System.out.println("MemberDAO.getCount()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MemberDTO> listMember(String seq) {
		
		try {

			String sql = "select seq, id, name from tblMember "
						+ "where seq <> ? order by name asc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			ArrayList<MemberDTO> mlist = new ArrayList<MemberDTO>();
			
			while (rs.next()) {
				//레코드 1줄 -> DTO 1개
				MemberDTO dto = new MemberDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				
				mlist.add(dto);
			}
			
			return mlist;

		} catch (Exception e) {
			System.out.println("MemberDAO.listMember()");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int send(MessageDTO dto) {
		
		try {
			
			int result = 0;

			String sql = "insert into tblMessage (seq, smseq, rmseq, content, regdate, state) values (seqMessage.nextVal, ?, ?, ?, default, default)";
			pstat = conn.prepareStatement(sql);
			
			for (String rmseq : dto.getRmseq()) {
				pstat.setString(1, dto.getSmseq());
				pstat.setString(2, rmseq);
				pstat.setString(3, dto.getContent());
				
				result += pstat.executeUpdate();
			}
			
			return result;

		} catch (Exception e) {
			System.out.println("MemberDAO.send()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<MessageDTO> listMessage(String rmseq) {
		
		try {

			String sql = "select m.*, (select name from tblMember where seq = m.smseq) as sname from tblMessage m where rmseq = ? order by seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, rmseq);
			rs = pstat.executeQuery();
			
			ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
			
			while (rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setSmseq(rs.getString("smseq"));
				dto.setRmseq(new String[] {rs.getString("rmseq")});
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setState(rs.getString("state"));
				
				dto.setSname(rs.getString("sname"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("MemberDAO.listMessage()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int countMessage(String mseq) {
		
		try {

			String sql = "select count(*) as cnt from tblMessage where rmseq = ? and state = 0";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("MemberDAO.countMessage()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public void updateState(String rmseq) {
		
		try {

			String sql = "update tblMessage set state = 1 where rmseq = ? and state = 0";//확인 안함 -> 확인함
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, rmseq);
			
			pstat.executeUpdate();			

		} catch (Exception e) {
			System.out.println("MemberDAO.updateState()");
			e.printStackTrace();
		}
		
	}

	public MessageDTO getMessage(String seq) {
		
		try {
			
			String sql = "select m.*, (select name from tblMember where seq = m.smseq) as sname from tblMessage m where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			MessageDTO dto = new MessageDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSname(rs.getString("sname"));
				dto.setState(rs.getString("state"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public void updateRead(String seq) {
		
		try {

			String sql = "update tblMessage set state = 2 where seq = ?";//안읽음 -> 읽음
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();			

		} catch (Exception e) {
			System.out.println("MemberDAO.updateState()");
			e.printStackTrace();
		}
		
	}

	public int deleteMessage(String[] cbDelete) {
		
		try {
			
			String sql = "delete from tblMessage where seq = ?";
			pstat = conn.prepareStatement(sql);
			
			int result = 0;
			
			for (String seq : cbDelete) {
				pstat.setString(1, seq);
				result += pstat.executeUpdate();
			}
			
			return result;
			//중간에 실패할수도 있으니까 원래라면 autocommit 처리 해야함
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
	
}








