package com.test.codestudy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.codestudy.DBUtil;

public class Dummy {

	public static void main(String[] args) {
		
		//게시판 더미 데이터
		//seq, subject, content, regate, readcount, mseq, thread, depth
		//자동, 난수,   고정,    자동,   , 자동,  , 난수, 증가,   고정
		
		String[] subject = { "게시판 테스트입니다.", "페이징 처리를 구현합니다.", "키보드를 샀어요~", "JSP 수업중입니다.", "데이터베이스가 어려워요;;", "졸려요;;", "배가 고픕니다. 밥주세요.", "이건 몇번째 페이지입니까?", "이클리스가 너무 무겁습니다.", "그냥 테스트용 게시물입니다." };
		String[] mseq = { "5", "6", "21" }; //본인 회원들
		
		Connection conn = null;
		PreparedStatement pstat = null;
		DBUtil util = new DBUtil();
		Random rnd = new Random();
		
		try {
			
			conn = util.open();
			
			String sql = "insert into tblBoard(seq, subject, content, regdate, readcount, mseq, thread, depth) "
					+ "values (seqBoard.nextVal, ?, '내용입니다.', default, default, ?, ?, 0)";
			
			pstat = conn.prepareStatement(sql);
			
			for (int i=0; i<175; i++) {
				
				pstat.setString(1, subject[rnd.nextInt(subject.length)]);
				pstat.setString(2, mseq[rnd.nextInt(mseq.length)]);
				pstat.setInt(3, (i+1) * 1000);
				
				System.out.println(i + ":" + pstat.executeUpdate());
				
			}
			
			pstat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		
		
	}
	
}








