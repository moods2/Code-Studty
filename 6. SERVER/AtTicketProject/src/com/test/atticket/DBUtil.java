package com.test.atticket;

import java.sql.Connection;
import java.sql.DriverManager;


/**
 * 
 * @author 신승환
 * 오라클 연결 클래스 입니다.
 *
 */
// / * * 하고 엔터누르면 된다!
public class DBUtil {
	
	private Connection conn = null;
	
	
	// 아래의 주석은 public 에게 많이 단다!
	// java doc 라고 부른다! 자바 도큐먼트 주석!
	
	/**
	 * 서버에 연결 합니다
	 * @return 연결 객체를 반환합니다!
	 */
	public Connection open() {//서버를 열어주는 메서드라고 생각하면 편하다 -> 로컬 계정을 열때 사용하는 메서드
		
		
		String url = "jdbc:oracle:thin:@yoginolja.ccyezlxmksh2.ap-northeast-2.rds.amazonaws.com:1521:orcl";
		String id = "Atticket";
		String pw = "java1234";
		
		
	try {
			//DB 작업 > 외부환경 > 예외처리 필수
			//설치된 JDBC 드라이버 로딩(상투적인 구문) 일단 써주고 시작한다고 생각하면 편하다!
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//접속(DB 연결 + connection 객체 생성 반환) -> 접속버튼 누른거와 같은 행동이 되는것이다!
			conn = DriverManager.getConnection(url,id,pw);
			return conn;//접속성공
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return null;//접속실패

	}//open
	
	/**
	 * 서버에 연결합니다
	 * @param host 서버주소
	 * @param id 계정명
	 * @param pw 비밀번호
	 * @return 연결객체를 반환합니다.
	 */
	/*
	 * public Connection open(String host, String id, String pw) {//서버를 열어주는 메서드라고
	 * 생각하면 된다 -> 로컬 호스트가 아닌 다른 컴퓨터로 직접 연결해주는 메서드
	 * 
	 * 
	 * String url = "jdbc:oracle:thin:@" + host + ":1521:xe";
	 * 
	 * try { //DB 작업 > 외부환경 > 예외처리 필수 //설치된 JDBC 드라이버 로딩(상투적인 구문) 일단 써주고 시작한다고 생각하면
	 * 편하다! Class.forName("oracle.jdbc.driver.OracleDriver");
	 * 
	 * //접속(DB 연결 + connection 객체 생성 반환) -> 접속버튼 누른거와 같은 행동이 되는것이다! conn =
	 * DriverManager.getConnection(url,id,pw); return conn;//접속성공
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return null;//접속실패
	 * 
	 * }//open
	 */	
	
	//쓸일 없는 메서드임
	

	

	
	
	
	
	/**
	 * 연결을 종료합니다.
	 */
	public void close() {
		
		try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
