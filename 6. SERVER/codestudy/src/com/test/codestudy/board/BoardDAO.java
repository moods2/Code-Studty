package com.test.codestudy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.codestudy.DBUtil;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
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

	//WriteOk 서블릿 -> 글쓰기 위임
	public int write(BoardDTO dto) {
		
		try {

			//- \r\n 삭제
			//- 마지막 ; 삭제
			String sql = "insert into tblBoard (seq, subject, content, regdate, readcount, mseq, thread, depth) values (seqBoard.nextVal, ?, ?, default, default, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getMseq());
			
			pstat.setInt(4, dto.getThread());
			pstat.setInt(5, dto.getDepth());
			
			return pstat.executeUpdate();			

		} catch (Exception e) {
			System.out.println("BoardDAO.write()");
			e.printStackTrace();
		}
		return 0;
	}

	
	//List 서블릿 -> 게시판 목록 주세요.
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			//목록 or 검색
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("and (name like '%%%s%%' or subject like '%%%s%%' or content like '%%%s%%')"
										, map.get("search"), map.get("search"), map.get("search"));
			}
			
			String sql = String.format("select * from (select a.*, rownum as rnum "
										+ "from (select * from vwBoard order by thread desc) a) "
										+ "where rnum >= %s and rnum <= %s %s order by %s desc"
										, map.get("begin"), map.get("end"), where, map.get("sort"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				//레코드 1줄 -> BoardDTO 1개
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setHeart(rs.getInt("heart"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				
				dto.setGap(rs.getInt("gap"));
				
				dto.setCommentcount(rs.getInt("commentcount"));
				
				dto.setDepth(rs.getInt("depth"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//View 서블릿 -> 글번호를 주고 게시물 1개를 반환받기 위해 위임
	public BoardDTO get(BoardDTO dto2) {
		
		try {
			
			String sql = "select a.*, (select name from tblMember where seq = a.mseq) as name, (select id from tblMember where seq = a.mseq) as id, (select count(*) from tblHeart where bseq = a.seq and mseq = ?) as heart from tblBoard a where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getMseq()); //회원번호
			pstat.setString(2, dto2.getSeq()); //글번호
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setHeart(rs.getInt("heart"));//
				dto.setMseq(rs.getString("mseq"));
				
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));
				
				
				return dto;				
			}

		} catch (Exception e) {
			System.out.println("BoardDAO.get()");
			e.printStackTrace();
		}
		
		return null;
	}

	//View 서블릿 -> 글번호를 줄테니 조회수를 1 증가시켜달라고
	public void updateReadcount(String seq) {
		
		try {

			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			

		} catch (Exception e) {
			System.out.println("BoardDAO.updateReadcount()");
			e.printStackTrace();
		}
		
	}

	//EditOk 서블릿 -> 글 수정 위임
	public int edit(BoardDTO dto) {
		
		try {

			String sql = "update tblBoard set subject = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.edit()");
			e.printStackTrace();
		}
		
		return 0;
	}

	//DeleteOk 서블릿 -> 글번호 줄테니 삭제해주세요..
	public int delete(String seq) {
		
		try {

			String sql = "delete from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.delete()");
			e.printStackTrace();
		}
		
		return 0;
	}

	//DeletOk 서블릿 -> 글쓴이 확인
	public boolean isOwner(BoardDTO dto) {
		
		try {

			String sql = "select count(*) as cnt from tblBoard a where (select id from tblMember where seq = a.mseq) = ? and seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getSeq());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt") == 1 ? true : false;
			}

		} catch (Exception e) {
			System.out.println("BoardDAO.isOwner()");
			e.printStackTrace();
		}
		
		return false;
	}

	//View 서블릿 -> 댓글 쓰기 위임
	public int writeComment(CommentDTO dto) {
		
		try {

			String sql = "insert into tblComment (seq, commentContent, mseq, regdate, bseq) values (seqComment.nextVal, ?, ?, default, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getCommentContent());
			pstat.setString(2, dto.getMseq());
			pstat.setString(3, dto.getBseq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.writeComment()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<CommentDTO> listComment(String seq) {
		
		try {

			String sql = "select a.*, (select name from tblMember where seq = a.mseq) as name, (select id from tblMember where seq = a.mseq) as id from tblComment a where bseq = ? order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();
			
			while (rs.next()) {
				//레코드 1줄 -> DTO 1개
				CommentDTO dto = new CommentDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCommentContent(rs.getString("commentContent"));
				dto.setMseq(rs.getString("mseq"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setBseq(rs.getString("bseq"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				
				clist.add(dto);				
			}
			
			return clist;

		} catch (Exception e) {
			System.out.println("BoardDAO.listComment()");
			e.printStackTrace();
		}
		
		return null;
	}

	//DeleteComment 서블릿 -> 댓글 삭제 위임 
	public int deleteComment(String seq) {
		
		try {

			String sql = "delete from tblComment where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.deleteComment()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//Heart 서블릿 -> 추천수 증가 위임
	public int addHeart(HeartDTO dto) {
		
		try {

			String sql = "insert into tblHeart (seq, mseq, bseq) values (seqHeart.nextVal, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getMseq());
			pstat.setString(2, dto.getBseq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.addHeart()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//Heart 서블릿 -> 이사람이 현재글에 추천을 눌렀는지 확인?
	public boolean checkHeart(HeartDTO dto) {
		
		try {

			String sql = "select count(*) as cnt from tblHeart where bseq = ? and mseq = ?";
			
			System.out.println(dto.getBseq());
			System.out.println(dto.getMseq());
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getBseq());
			pstat.setString(2, dto.getMseq());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt") == 1 ? true : false;
			}

		} catch (Exception e) {
			System.out.println("BoardDAO.checkHeart()");
			e.printStackTrace();
		}
		
		return false;
	}

	public int removeHeart(HeartDTO dto) {
		
		try {

			String sql = "delete from tblHeart where mseq = ? and bseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getMseq());
			pstat.setString(2, dto.getBseq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.addHeart()");
			e.printStackTrace();
		}
		
		return 0;
	}

	//WriteOk 서블릿 -> 가장 큰 thread 반환
	public int getThread() {
		
		try {

			String sql = "select nvl(max(thread), 0) + 1000 as thread from tblBoard";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("thread");
			}

		} catch (Exception e) {
			System.out.println("BoardDAO.getThread()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//WriteOk 서블릿 -> 답변 업무 일부 위임
	public void updateThread(HashMap<String, Integer> map) {
		
		try {

			String sql = "update tblBoard set thread = thread - 1 where thread < ? and thread > ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, map.get("parentThread"));
			pstat.setInt(2, map.get("previousThread"));
			
			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.updateThread()");
			e.printStackTrace();
		}
		
	}

public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("where (name like '%%%s%%' or subject like '%%%s%%' or content like '%%%s%%')"
						, map.get("search"), map.get("search"), map.get("search"));
			}

			String sql = String.format("select count(*) as cnt from tblBoard %s", where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			

		} catch (Exception e) {
			System.out.println("BoardDAO.getTotalCount()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
}










