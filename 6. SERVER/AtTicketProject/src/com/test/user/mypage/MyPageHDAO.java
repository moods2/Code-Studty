package com.test.user.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import com.test.atticket.DBUtil;

public class MyPageHDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MyPageHDAO() {
		
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

	public ArrayList<MyReDTO> getlistB(HashMap<String, String> map) {
		
		try {
			String sql = "select b.* from(select a.*, rownum as rnum from (select * from vwmyreservation where cusseq = ? and bookdate >= ? and to_char(bookdate,'yyyy-mm-dd') <= ? order by bookdate desc) a) b where rnum >=? and rnum <=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("from"));
			pstat.setString(3, map.get("to"));
			pstat.setString(4, map.get("begin"));
			pstat.setString(5, map.get("end"));	
			/*
			 * System.out.println(map.get("cusseq")); System.out.println(map.get("from"));
			 * System.out.println(map.get("to")); System.out.println(map.get("begin"));
			 * System.out.println(map.get("end"));
			 */
		
			rs = pstat.executeQuery();
			ArrayList<MyReDTO> list = new ArrayList<MyReDTO>();
			while(rs.next()) {
				MyReDTO dto = new MyReDTO();
				dto.setBdate(rs.getString("bdate").substring(0,10));
				dto.setBookdate(rs.getString("bookdate").substring(0,10));
				dto.setBookseq(rs.getString("bookseq"));
				dto.setBookstate(rs.getString("bookstate"));
				dto.setCnt(rs.getString("cnt"));
				dto.setShowtitle(rs.getString("showtitle"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getlist()");
			e.printStackTrace();
		}
		return null;
	}

	public int deleteReservation(String[] bookseq) {
		try {
			int result = 0;
			String sql = "update tblbooking set delflag = 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			for(int i=0;i<bookseq.length;i++) {
				
				pstat.setString(1,bookseq[i]);
				result += pstat.executeUpdate();
				return result;
			}
		} catch (Exception e) {
			System.out.println("MyPageHDAO.deleteReservation()");
			e.printStackTrace();
		}
		return 0;
	}

	public int getTotalCount(HashMap<String, String> map) {
		try {
			/*
			 * String sql = "select count(*) as cnt from vwmyreservation where cusseq = ?";
			 * pstat = conn.prepareStatement(sql); pstat.setString(1, cusseq);
			 */
			String sql = "select count(*) as cnt from(select a.*, rownum as rnum from (select * from vwmyreservation where cusseq = ? and bookdate >= ? and bookdate <= ? order by bookseq desc) a) b where rnum >=? and rnum <=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("from"));
			pstat.setString(3, map.get("to"));
			pstat.setString(4, map.get("begin"));
			pstat.setString(5, map.get("end"));	
			rs = pstat.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				return cnt;
			}
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getTotalCount()");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<MyWaDTO> getlistV(HashMap<String, String> map) {
		
		try {
			String sql = "select b.* from (select a.*,rownum as rnum from (select * from vwmyView where bdate = ? and cusseq = ? order by bookdate desc) a) b where rnum >= ? and rnum <= ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("now"));
			pstat.setString(2, map.get("cusseq"));
			pstat.setString(3, map.get("begin"));
			pstat.setString(4, map.get("end"));
			ArrayList<MyWaDTO> vlist = new ArrayList<MyWaDTO>();
			rs = pstat.executeQuery();
			while(rs.next()) {
				MyWaDTO dto = new MyWaDTO();
				dto.setBdate(rs.getString("bdate"));
				dto.setBookseq(rs.getString("bookseq"));
				dto.setCusseq(rs.getString("cusseq"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPayseq(rs.getString("payseq"));
				dto.setRoundseq(rs.getString("roundseq"));
				dto.setShowaddr(rs.getString("showaddr"));
				dto.setShowposter(rs.getString("showposter"));
				dto.setShowseq(rs.getString("showseq"));
				dto.setShowtitle(rs.getString("showtitle"));
				dto.setStartdate(rs.getString("startdate"));
				vlist.add(dto);
			}
			return vlist;
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getlistView()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getTotalCountV(HashMap<String, String> map) {
		
		try {
			
			String sql = "select count(*) as cnt from (select a.*,rownum as rnum from (select * from vwmyView where bdate = ? and cusseq = ? order by bookseq desc) a) b";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("now"));
			pstat.setString(2, map.get("cusseq"));
			rs = pstat.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				return cnt;
			}
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getTotalCountV()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<MyWaDTO> getGenre(HashMap<String, String> map) {
		try {
			String sql = "";
			if(map.get("genre").equals("default")) {
				sql = "select b.* from (select a.*,rownum as rnum from (select * from vwmyView where bdate >= ? and bdate <= ? and cusseq = ? order by bookseq desc) a) b where rnum >= ? and rnum <= ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, map.get("from"));
				pstat.setString(2, map.get("to"));	
				pstat.setString(3, map.get("cusseq"));
				pstat.setString(4, map.get("begin"));			
				pstat.setString(5, map.get("end"));		
			} else {
				sql = "select b.* from (select a.*,rownum as rnum from (select * from vwmyView where bdate >= ? and bdate <= ? and cusseq = ? and genre = ? order by bookseq desc) a) b where rnum >= ? and rnum <= ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, map.get("from"));
				pstat.setString(2, map.get("to"));
				pstat.setString(3, map.get("cusseq"));
				pstat.setString(4, map.get("genre"));			
				pstat.setString(5, map.get("begin"));			
				pstat.setString(6, map.get("end"));		
			}
//			System.out.println(map.get("from"));
//			System.out.println(map.get("to"));
//			System.out.println(map.get("cusseq"));
//			System.out.println(map.get("begin"));
//			System.out.println(map.get("end"));
			rs = pstat.executeQuery();
			ArrayList<MyWaDTO> glist = new ArrayList<MyWaDTO>();
			while(rs.next()) {
				MyWaDTO dto = new MyWaDTO();
				dto.setBookseq(rs.getString("bookseq"));
				dto.setCusseq(rs.getString("cusseq"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPayseq(rs.getString("payseq"));
				dto.setRoundseq(rs.getString("roundseq"));
				dto.setShowaddr(rs.getString("showaddr"));
				dto.setShowposter(rs.getString("showposter"));
				dto.setShowseq(rs.getString("showseq"));
				dto.setShowtitle(rs.getString("showtitle"));
				dto.setBdate(rs.getString("bdate").substring(0,10));
				glist.add(dto);
			}
			
			return glist;
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getGenre()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<MyWaDTO> getTitle(HashMap<String, String> map) {
		
		try {
			
			String sql = "select b.* from (select a.*,rownum as rnum from (select * from vwmyView where showtitle like '%' || ? || '%' and cusseq = ? order by bookseq desc) a) b where rnum >= ? and rnum <= ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("showtitle"));
			pstat.setString(2, map.get("cusseq"));
			pstat.setString(3, map.get("begin"));
			pstat.setString(4, map.get("end"));			
				
			rs = pstat.executeQuery();
			ArrayList<MyWaDTO> tlist = new ArrayList<MyWaDTO>();
			while(rs.next()) {
				MyWaDTO dto = new MyWaDTO();
				dto.setBookseq(rs.getString("bookseq"));
				dto.setCusseq(rs.getString("cusseq"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPayseq(rs.getString("payseq"));
				dto.setRoundseq(rs.getString("roundseq"));
				dto.setShowaddr(rs.getString("showaddr"));
				dto.setShowposter(rs.getString("showposter"));
				dto.setShowseq(rs.getString("showseq"));
				dto.setShowtitle(rs.getString("showtitle"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setBdate(rs.getString("bdate").substring(0,10));
				tlist.add(dto);
			}
			return tlist;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getTitle()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getTotalCountG(HashMap<String, String> map) {
		String sql = "";
		try {
			if(map.get("genre").equals("default")) {
				sql = "select count(*) as cnt from (select a.*,rownum as rnum from (select * from vwmyView where bdate >= ? and bdate <= ? and cusseq = ? order by bookseq desc) a) b";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, map.get("from"));
				pstat.setString(2, map.get("to"));	
				pstat.setString(3, map.get("cusseq"));
				
			} else {
				sql = "select count(*) as cnt from (select a.*,rownum as rnum from (select * from vwmyView where bdate >= ? and bdate <= ? and cusseq = ? and genre = ? order by bookseq desc) a) b";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, map.get("from"));
				pstat.setString(2, map.get("to"));
				pstat.setString(3, map.get("cusseq"));
				pstat.setString(4, map.get("genre"));			
				
			}
			rs = pstat.executeQuery();
			if(rs.next()) {		
				int cnt = rs.getInt("cnt");
				return cnt;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("MyPageHDAO.getTotalCountG()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getTotalCountT(HashMap<String, String> map) {
		String sql = "select count(*) as cnt from (select a.*,rownum as rnum from (select * from vwmyView where showtitle like '%' || ? || '%' and cusseq = ? order by bookseq desc) a) b";	
	
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("showtitle"));
			pstat.setString(2, map.get("cusseq"));
			
			rs = pstat.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				return cnt;
			}
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getTotalCountT()");
			e.printStackTrace();
		}
	
		return 0;
	}

	public int getTotalCountR(HashMap<String, String> map) {
		try {
			
			String sql = "select count(*) as cnt from(select a.*, rownum as rnum from (select * from vwmyreservation where cusseq = ? and bookdate >= ? and bookdate <= ? order by bookseq desc) a) b";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("from"));
			pstat.setString(3, map.get("to"));
			
			/*
			 * System.out.println(map.get("cusseq")); System.out.println(map.get("from"));
			 * System.out.println(map.get("to")); System.out.println(map.get("begin"));
			 * System.out.println(map.get("end"));
			 */
			System.out.println();
			rs = pstat.executeQuery();
			ArrayList<MyReDTO> list = new ArrayList<MyReDTO>();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				return cnt;
			}
			
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getTotalCountR()");
			e.printStackTrace();
		}
		return 0;
	}

	public MyCusDTO getCus(String cusseq) {
		
		try {
			Calendar now = Calendar.getInstance();
			String sql = "select * from tblcustomer where seq = ? and delflag <> 1";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,cusseq);
			rs = pstat.executeQuery();
			if(rs.next()) {
				MyCusDTO dto = new MyCusDTO();
				dto.setAddr(rs.getString("addr"));
				dto.setAge(String.valueOf(now.get(Calendar.YEAR)-(Integer.parseInt(rs.getString("ssn").substring(0,2))+1900)+1));
				dto.setEmail(rs.getString("email"));
				dto.setGrade(rs.getString("grade"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setPhoto(rs.getString("photo"));
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getCus()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MyQDTO> getQus(String cusseq) {
		try {
			
			String sql = "select * from vwQna where cusseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cusseq);
			rs = pstat.executeQuery();
			ArrayList<MyQDTO> qlist = new ArrayList<MyQDTO>();
			while(rs.next()) {
				MyQDTO qdto = new MyQDTO();
				qdto.setAnswerdate(rs.getString("answerdate"));
				qdto.setQseq(rs.getString("qseq"));
				qdto.setTag(rs.getString("tag"));
				qlist.add(qdto);
			}
			return qlist;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getQus()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<MyReviewDTO> getReview(String cusseq) {
		
		try {
			
			String sql = "select * from vwreview where cusseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cusseq);
		
			rs = pstat.executeQuery();
			ArrayList<MyReviewDTO> rlist = new ArrayList<MyReviewDTO>();
			while(rs.next()) {
				MyReviewDTO dto = new MyReviewDTO();
				dto.setRseq(rs.getString("rseq"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setRview(rs.getString("rview"));
				dto.setRtitle(rs.getString("rtitle"));
				rlist.add(dto);
			}
			return rlist;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getReview()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<MyTicketDTO> getDenTicket(HashMap<String, String> map) {
		try {
			
			String sql = "select * from vwmyTicket where cusseq = ? and bookdate = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,map.get("cusseq"));
			pstat.setString(2, map.get("month1"));
			
			ArrayList<MyTicketDTO> tlist = new ArrayList<MyTicketDTO>();
			rs = pstat.executeQuery();
			while(rs.next()) {
				MyTicketDTO dto = new MyTicketDTO();
				dto.setBookdate(rs.getString("bookdate"));
				dto.setCnt(rs.getString("cnt"));
				dto.setShowgenre(rs.getString("showgenre"));
				
				tlist.add(dto);
			}
			return tlist;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getDenTicket()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<MyBuyDTO> getBuy(HashMap<String, String> map) {
		
		try {
			
			String sql = "select * from vwBuyTicket where cusseq = ? and to_char(bookdate,'mm') = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("month1"));
			rs = pstat.executeQuery();
			ArrayList<MyBuyDTO> blist = new ArrayList<MyBuyDTO>();
			while(rs.next()) {
				MyBuyDTO dto = new MyBuyDTO();
				dto.setBookdate(rs.getString("bookdate").substring(0,10));
				dto.setShowaddr(rs.getString("showaddr"));
				dto.setShowprice(rs.getString("showprice"));
				dto.setState(rs.getString("state"));
				dto.setTitle(rs.getString("title"));
				blist.add(dto);
			}
			
			return blist;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getBuy()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MyPostDTO> getPoster(HashMap<String, String> map) {
		try {
			
			String sql = "select * from vwmyposter where cusseq = ? and to_char(bookdate,'mm') = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("month1"));
			rs = pstat.executeQuery();
			ArrayList<MyPostDTO> list = new ArrayList<MyPostDTO>();
			while(rs.next()) {
				MyPostDTO dto = new MyPostDTO();
				dto.setPoster(rs.getString("poster"));
				dto.setCusseq(rs.getString("cusseq"));
				dto.setBookdate(rs.getString("bookdate").substring(0,10));
				dto.setShowaddr(rs.getString("showaddr"));
				dto.setShowtitle(rs.getString("showtitle"));
				list.add(dto);
				System.out.println(rs.getString("poster"));
			}
		
			return list;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getPoster()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<MyPointDTO> getPoint(HashMap<String, String> map) {
		try {
			
			String sql = "select * from vwmypoint where cusseq = ? and to_char(bookdate,'mm') = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("month2"));
			rs = pstat.executeQuery();
			ArrayList<MyPointDTO> plist = new ArrayList<MyPointDTO>();
			while(rs.next()) {
				MyPointDTO dto = new MyPointDTO();
				dto.setBookdate(rs.getString("bookdate"));
				dto.setEgg(rs.getString("egg"));
				plist.add(dto);
			}
			
			return plist;
			
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getPoint()");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<MyBdateDTO> getBdate(HashMap<String, String> map) {
		try {
			String sql = "select * from vwmybdate where cusseq = ? and to_char(bookdate,'mm') = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("cusseq"));
			pstat.setString(2, map.get("month3"));
			
			rs = pstat.executeQuery();
			ArrayList<MyBdateDTO> blist = new ArrayList<MyBdateDTO>();
			while(rs.next()) {
				MyBdateDTO dto = new MyBdateDTO();
				dto.setBookdate(rs.getString("bookdate"));
				dto.setCnt(rs.getString("cnt"));
				blist.add(dto);
			}
			return blist;
		} catch (Exception e) {
			System.out.println("MyPageHDAO.getBdate()");
			e.printStackTrace();
		}
		return null;
	}
	
}












