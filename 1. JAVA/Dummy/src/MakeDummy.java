import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

public class MakeDummy {
	static Random rnd;
	
	static {
		rnd = new Random();
	}

	public static void main(String[] args) {
//		insertMember();
//		insertTeacher();
//		adminAttend();
//		adminfever();
//		employment();
//		support();
//		score();
		
		
	}
	
	private static void support() {
	      Connection conn = null; // DB연결된 상태(세션)을 담은 객체
	        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
	        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
	        
	       
	      
	        String[] temp1 = {"취성패","내일배움","재직자","자비"};
	        
	        
	        try {
	        	
	           conn = DBConnection.getConnection();
	           
	           for (int i = 0; i < 7; i++) {
	        	   
	              Calendar cal = Calendar.getInstance();
	              cal.set(Calendar.DAY_OF_MONTH,1);
	              cal.add(Calendar.MONTH, -6 +i);
	              
	              for (int j=1; j<247; j++) {
	              
		              String depDate = String.format("%tF", cal);
		              
		              String type = temp1[rnd.nextInt(temp1.length)];
		              String quary = "INSERT INTO TBL_SUPPORT VALUES (SUPPORT_SEQ.NEXTVAL,\'" + type + "\',\'" + depDate + "\'," + j + ")";
		              System.out.println(quary);
		              
		              
		              pstm = conn.prepareStatement(quary);
		              pstm.executeUpdate();
		              pstm.close();
	            	  
	              }
	              
		           System.out.println("Insert 완료");
	           
	           }
	           
	           conn.close();
	           
	           
	        } catch (Exception e) {
	           e.printStackTrace();
	        }
	        
	      
	   }

	private static void score() {
		
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        PreparedStatement pstm2 = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
        ResultSet rs2 = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
        
        try {
        	conn = DBConnection.getConnection();
        	
        	String subQuery = "SELECT SEQ FROM TBL_OPEN_SUBJECT";
        	String appQuery = "SELECT SEQ FROM TBL_APPLY";
        	
        	pstm = conn.prepareStatement(subQuery);
        	pstm2 = conn.prepareStatement(appQuery);
        	rs = pstm.executeQuery();
        	rs2 = pstm2.executeQuery();
        	
        	while(rs.next() && rs2.next()) {
        		
        		String subseq = rs.getString(1);
        		String appseq = rs2.getString(1);
        		
        		int write = rnd.nextInt(30) + 71;
        		int performance = rnd.nextInt(50) + 51;
        		int attend = rnd.nextInt(20) + 81;
        		
        		String quary = "INSERT INTO TBL_SCORE VALUES (SCORE_SEQ.NEXTVAL," + write + "," + performance + "," + attend + 
        				"," + subseq + "," + appseq + ")";
        		System.out.println(quary);
        		
//        		pstm = conn.prepareStatement(quary);
//        		pstm.executeUpdate();
        		
        		
        	}
        	
        	
        	conn.close();
        } catch (Exception e) {
        	e.printStackTrace();
		}
		
	}

	private static void employment() {
		
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
        
        try {
        	conn = DBConnection.getConnection();
        	String query = "SELECT SEQ, STATUS FROM TBL_APPLY";

        	System.out.println(query);
        	pstm = conn.prepareStatement(query);
        	rs = pstm.executeQuery();
        	while(rs.next()) {
        		
        		String salary = "";
        		String seq = rs.getString(1);
        		String tmp = rs.getString(2);
        		System.out.println(seq);
        		System.out.println(tmp);
        		
        		if (tmp == null) {
        			
        			String[] companyArray = {"NULL", "(주)네오위즈", "NULL", "NULL", "(주)티맥스소프트",
        					"NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",
	            			"NULL", "아프리카TV", "NULL", "(주)코스알엑스", "NULL", "NULL", "NULL", "NULL",
	            			"지에스리테일", "NULL", "넷마블게임즈", "NULL", "한국가스공사", "NULL", "NULL",
	            			"NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",
	            			"애플코리아", "NULL", "삼성전자", "NULL", "현대모비스", "NULL", "빙그레", "농심",
	            			"NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",
	            			"NULL", "컴투스", "NULL", "NULL", "NULL", "한화케미칼", "세스코", "NULL",
	            			"NULL", "카페24", "NULL", "NULL", "NULL", "신세계", "NULL", "NULL", "NULL",
	            			"하이트진로", "NULL"};
	            	String[] salaryArray = {"2600", "2700", "2800", "2900", "3000", "3100", "3200", "3300", "3600"};
	            	String company = companyArray[rnd.nextInt(companyArray.length)];
	            	if (company.equals("NULL")) {
	            		salary = "NULL";
	            	} else {
	            		salary = salaryArray[rnd.nextInt(salaryArray.length)];
	            	}
	            	
	            	String quary = "INSERT INTO TBL_EMPLOYMENT VALUES (EMPLOYMENT_SEQ.NEXTVAL," 
	            	+ (company.equals("NULL") ? company : "\'" + company + "\'") + "," + salary + "," + seq + ")";
	            	System.out.println(quary);
	            	System.out.println("수강중");
            		pstm = conn.prepareStatement(quary);
            		pstm.executeUpdate();
        			
        			
        		} else {
				
	        		String[] companyArray = {"한국수자원공사", "(주)네오위즈", "(주)홈앤쇼핑", "(주)티맥스소프트",
	            			"에스케이넥실리스(주)", "아프리카TV", "(주)코스알엑스", "NULL", "한국관광공사",
	            			"주식회사 앱코", "NULL", "(주)현대홈쇼핑", "카카오", "JYP Ent.", "오뚜기", "LG",
	            			"NAVER", "구글코리아", "한국철도시설공단", "위메프", "쿠팡", "한국전력공사", "엔씨소프트",
	            			"NULL", "현대그린푸드", "새마을금고중앙회", "한국토지주택공사", "로엔",
	            			"지에스리테일", "넷마블게임즈", "서울도시가스", "한국가스공사", "삼성바이오로직스",
	            			"애플코리아", "삼성전자", "NULL", "현대모비스", "포스코", "빙그레", "농심",
	            			"NULL", "컴투스", "한독모터스", "제일기획", "한화케미칼", "세스코", "에스케이텔레콤",
	            			"금호타이어", "카페24", "NULL", "유신", "코스트코코리아", "신세계", "LF", "NULL",
	            			"하이트진로", "테스"};
	            	String[] salaryArray = {"2600", "2700", "2800", "2900", "3000", "3100", "3200", "3300", "3600"};
	            	String company = companyArray[rnd.nextInt(companyArray.length)];
	            	if (company.equals("NULL")) {
	            		salary = "NULL";
	            	} else {
	            		salary = salaryArray[rnd.nextInt(salaryArray.length)];
	            	}
	            	
	            	
	            	String quary = "INSERT INTO TBL_EMPLOYMENT VALUES (EMPLOYMENT_SEQ.NEXTVAL," 
	    	            	+ (company.equals("NULL") ? company : "\'" + company + "\'") + "," + salary + "," + seq + ")";
	            	System.out.println(quary);
	            	System.out.println("수료");
            		pstm = conn.prepareStatement(quary);
            		pstm.executeUpdate();
            	
        		}
        		pstm.close();
        	}
        	
 
        	conn.close();
        	
        } catch (Exception e) {
        	e.printStackTrace();
		}
		
		
	}

	private static void adminfever() {
		
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
        
        try {
     
        	for(int i=300; i<326; i++) {
        	conn = DBConnection.getConnection();
        	     
        			
        			// 36.2 ~37.3
			String[] amfeverarray = {"36.2", "36.3", "36.4", "36.5", "36.6", "36.7", "36.8", "36.9", "37.0", "37.1", "37.2"};
			String[] pmfeverarray = {"36.2", "36.3", "36.4", "36.5", "36.6", "36.7", "36.8", "36.9", "37.0", "37.1", "37.2"};
			String amfever = amfeverarray[rnd.nextInt(amfeverarray.length)];
			String pmfever = pmfeverarray[rnd.nextInt(pmfeverarray.length)];
			
			String quary = "INSERT INTO TBL_COVID19_ADMIN VALUES (COVID19_ADMIN_SEQ.NEXTVAL," + amfever + "," + pmfever + "," + i + ")";
			System.out.println(quary);
//        	pstm = conn.prepareStatement(quary);
//        	pstm.executeUpdate();
				
        		
        	conn.close();
        	
        	}
        	} catch (Exception e) {
        	e.printStackTrace();
        }       
		
	}

	private static void adminAttend() {
		
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
        
        try {
        	conn = DBConnection.getConnection();
        	
        		int i = 5;
        		
        		Calendar c = Calendar.getInstance();
        		c.add(Calendar.DATE, -1);
        		
        		for (int j = 1; j<=91; j++) {
        			
        			if (c.get(Calendar.DAY_OF_WEEK) != 1 && c.get(Calendar.DAY_OF_WEEK) != 7) {
        			
        			String date = String.format("%tF", c);
        			String[] inTimearray = {"08:50", "08:51", "08:52", "08:53", "08:54", "08:55"
        					, "08:56", "08:57", "08:58", "08:59", "09:00"};
        			String inTime = inTimearray[rnd.nextInt(inTimearray.length)];
        			System.out.println(inTime);
        			String[] outTimearray = {"18:30", "18:31",
        					"18:32", "18:33",
        					"18:34", "18:35",
        					"18:36", "18:37",
        					"18:38", "18:39",
        					"18:40", "18:41"};
        			String outTime = outTimearray[rnd.nextInt(outTimearray.length)];
        			
        			String quary = "INSERT INTO TBL_ATTEND_ADMIN VALUES (ATTEND_ADMIN_SEQ.NEXTVAL,\'" + date + "\'," + 
	        					"TO_DATE(\'" + (date + " " + inTime) + "\', \'YY-MM-DD HH24:MI\')" + "," + 
	        					"TO_DATE(\'" + (date + " " + outTime) + "\', \'YY-MM-DD HH24:MI\')" + ",NULL" + "," + i + ")";
        			System.out.println(quary);
//        			pstm = conn.prepareStatement(quary);
//        			pstm.executeUpdate();
        			c.add(Calendar.DATE, -1);
        			
        			} else {
        				c.add(Calendar.DATE, -1);
        			}
        			
				}
        		
        		conn.close();
        	
        	
        	} catch (Exception e) {
        	e.printStackTrace();
        }       
        
        
	}

	private static void insertTeacher() {
		
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체   
       
     
        try {
        	conn = DBConnection.getConnection();
        	for (int i = 0; i < 10; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_TEACHER(SEQ, NAME, ID, SSN, TEL) VALUES (TEACHER_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
                
                
			}
        	System.out.println("Insert 완료");
        	conn.close();
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
		
	}

	private static String makeAccount() {
//		110-423-918684
		String account = "";
		account += rnd.nextInt(900) + 100;
		account += "-";
		account += String.format("%03d", rnd.nextInt(1000));
		account += "-";
		account += String.format("%06d", rnd.nextInt(1000000));
				
		return account;
	}

	public static void insertMember() {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
        

        
        try {
        	conn = DBConnection.getConnection();
        	
//        	for (int i = 0; i < 26; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', SYSDATE)";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2020-04-07\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2020-02-15\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//            
//        	for (int i = 0; i < 26; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2020-01-27\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2020-03-02\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2020-01-05\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
            
        	
        	
        	
        	
        	
        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-07-25\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 26; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-09-07\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-11-14\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 26; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-08-23\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-02-23\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 26; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-05-22\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-06-14\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 26; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-02-07\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 30; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-01-04\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
//        	
//        	for (int i = 0; i < 26; i++) {
//        		String name = makeName();
//        		String id = makeId();
//        		String ssn = makeSsn();
//        		String tel = makeTel();
//        		String account = makeAccount();
//        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-03-11\')";
//        		pstm = conn.prepareStatement(quary);
//                pstm.executeUpdate();
//			}
        	
        	
        	
        	
        	
        	
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-04-15\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-05-20\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-06-01\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-07-14\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-01-18\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-08-20\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2018-10-07\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
        	for (int i = 0; i < 30; i++) {
        		String name = makeName();
        		String id = makeId();
        		String ssn = makeSsn();
        		String tel = makeTel();
        		String account = makeAccount();
        		String quary = "INSERT INTO TBL_STUDENT(SEQ, NAME, ID, SSN, TEL, ACCOUNT, REGDATE) VALUES (STUDENT_SEQ.NEXTVAL,\'" + name + "\',\'" + id + "\',\'" + ssn + "\',\'"+ tel +"\', \'"+ account +"\', \'2019-12-11\')";
        		pstm = conn.prepareStatement(quary);
                pstm.executeUpdate();
			}
        	
            System.out.println("Insert 완료");
            conn.close();
          
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}

	private static String makeTel() {
		String tel = "";
		tel += "010-";
		tel += String.format("%04d", rnd.nextInt(9000)+1000);
		tel += "-";
		tel += String.format("%04d", rnd.nextInt(10000));
		return tel;
	}

	private static String makeSsn() {
		String ssn = "";
		ssn += rnd.nextInt(10) +  85 + "";								// 년도
		int month = rnd.nextInt(12) + 1;  
		ssn += String.format("%02d", month);							// 월
		int[] maxDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		int day = rnd.nextInt(maxDays[month-1]) + 1;
		ssn += String.format("%02d", day);								// 일
		ssn += "-";
		ssn += rnd.nextInt(1) + 1;
		ssn += String.format("%06d", rnd.nextInt(1000000));
		
		return ssn;
	}

	private static String makeName() {
		  String[] name1 = { "김", "이", "박", "최", "백", "권", "윤", "장", "정", "신" };
		String[] name2 = { "동", "현", "지", "호", "진", "영", "태", "성", "민", "승", "환", "종", "선", "찬", "우", "식", "윤", "예",
				"혜", "대" };
		
		String name =name1[rnd.nextInt(name1.length)] + name2[rnd.nextInt(name2.length)] + name2[rnd.nextInt(name2.length)];
		return name;
	}

	private static String makeId() {
		String name = "";
		for (int i = 0; i < rnd.nextInt(4) + 3; i++) {
			name += (char) (rnd.nextInt(26) + 97);
		}
		for (int i = 0; i < rnd.nextInt(10); i++) {
			name += rnd.nextInt(10);
		}
		if (name.length() <= 4 && name.length() >= 17)
			name = makeId();
		return name;
	}

}