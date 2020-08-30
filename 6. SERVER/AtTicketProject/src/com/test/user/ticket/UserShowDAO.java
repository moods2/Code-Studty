package com.test.user.ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Set;

import com.test.atticket.DBUtil;

public class UserShowDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	public UserShowDAO() {//생성자 생성
		//DB 연결
		DBUtil util = new DBUtil();
		conn = util.open();//연결 완료
		
	}
	

	//기본적인 공연에 대한 정보를 불러온다
	public UserShowDTO getShowInfo(String conSeq) {

		try {
			
			String sql = "select * from tblshow where seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, conSeq);
			
			rs = pstat.executeQuery();
			
			UserShowDTO dto = new UserShowDTO();
			
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStartDate(rs.getString("startdate").substring(0,10));
				dto.setEndDate(rs.getString("endDate").substring(0,10));
				dto.setPrice(rs.getString("price"));
				dto.setPoster(rs.getString("poster"));
				dto.setContent(rs.getString("content"));
				dto.setOpenDate(rs.getString("opendate").substring(0,10));
				dto.setAge(rs.getString("age"));
				dto.setGenre(rs.getString("genre"));
				dto.setAgencySeq("agencyseq");
				dto.setDelflag(rs.getString("delflag"));
				dto.setTheaterSeq(rs.getString("theaterseq"));
			}
			
			//이거 해줘야 되는지는 잘 모르겠네
			//rs.close();
			//conn.close();
			
			return dto;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//show 객체에 대한  공연건물이름,공연장소에 대한 데이터를 불러온다.
	public List<String> getPlace(String conSeq) {
		
		
		try {
			
			String sql = "select name,addr from tblhall where seq =(select hallseq from tbltheater where seq = (select theaterseq from tblshow where seq= ?))";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, conSeq);
			
			rs = pstat.executeQuery();
			
			List<String> list = new ArrayList<String>();
			
			if (rs.next()) {
				
				list.add(rs.getString("name"));
				list.add(rs.getString("addr"));
				
				
			}
			
			//rs.close();
			//conn.close();
			
			return list;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	//show 의 term 을 확인한다.
	public String getShowTerm(String conSeq) {
		
		try {
			 
			String sql = "select startdate,enddate from tblroundinfo where showseq = (select seq from tblshow where seq=?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, conSeq);
			
			rs = pstat.executeQuery();
			
			int startH = 0;//show 시작시간
			int startM = 0;//show 시작분
			
			int endH = 0;//show 마침시간.
			int endM = 0;//show 마침분
			 //System.out.println(rs.getFetchSize());
			
			while(rs.next()) {
				String[] start = rs.getString("startdate").split(":");
				startH = Integer.parseInt(start[0]);
				startM = Integer.parseInt(start[1]);
				
				String[] end = rs.getString("enddate").split(":");
				endH = Integer.parseInt(end[0]);
				endM = Integer.parseInt(end[1]);
			}
			
			return "" + (endH*60 + endM - (startH*60 + startM));//두 시각의 차를 구해준다.
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	//좋아요 수 가져오기
	public String getLikes(String conSeq) {
		
		
		try {
			
			String sql = "select count(*) as cnt from tblmyshow where showseq = ? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, conSeq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getString("cnt");
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//주최 기획사정보 전화번호 가져오기
	public List<String> getAgencyInfo(String conSeq) {
		
		try {
			
			String sql = "select host, management, tel from tblagency where seq = (select agencyseq from tblshow where seq=?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, conSeq);
			
			rs = pstat.executeQuery();
			
			List<String> agencyInfo = new ArrayList<String>();
			
			if (rs.next()) {
				
				agencyInfo.add(rs.getString("host"));
				agencyInfo.add(rs.getString("management"));
				agencyInfo.add(rs.getString("tel"));
				
			}
			
			return agencyInfo;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	//내가 이미 좋아요를 누른 데이터인지 확인한다
	public int getLikeTrue(String conSeq,int mySeq) {
		
		try {
			
			String sql = "select * from tblMyShow where cusseq = ? and showseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, mySeq);
			pstat.setString(2, conSeq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("delflag");
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return -1;
	}

	//해당 show에 대하여 내가 좋아요를 누른적이 있는지 없는지 판단해주는 도구라고 생각하면 된다.
	public int likecheck(String conSeq,int mySeq) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMyShow where cusseq = ? and showseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, mySeq);
			pstat.setString(2, conSeq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return -1;
	}

	//heart insert 작업
	public void insertHeart(int mySeq, String showSeq) {
		
		
		try {
			
			String sql = "insert into tblMyShow values (myshowSeq.nextVal,to_date(sysdate,'yyyy/mm/dd'),?,?,0)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, showSeq);
			pstat.setInt(2, mySeq);
			
			pstat.executeUpdate();
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	//좋아요한 공연을 좋아요 상태를 바꾸는 작업.
	public void updateLikeState(String showSeq, int mySeq, int state) {
		
		try {
			String sql = "update tblmyshow set delflag=? where cusseq = ? and showseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, state);
			pstat.setInt(2,mySeq);
			pstat.setString(3, showSeq);
			
			pstat.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	//해당 공연에 해당하는 쿠폰을 발급해주기 위함.
	public List<UserShowCouponDTO> getCouponList(String conSeq) {
		
		try {
			
			String sql = "select * from tblCoupon where showseq = ? and delflag = 0";
			
			List<UserShowCouponDTO> cpList = new ArrayList<UserShowCouponDTO>();
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, conSeq);
			
			rs = pstat.executeQuery();
			
			
			while(rs.next()) {
				UserShowCouponDTO dto = new UserShowCouponDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStartDate(rs.getString("startdate").substring(0,10));
				dto.setEndDate(rs.getString("enddate").substring(0,10));
				dto.setDiscount(rs.getString("discount"));
				dto.setShowSeq(rs.getString("showseq"));
				
				//여기서 중요한건 날짜를 체크해주는 것이다 오늘 날짜 기준으로 -> 이 쿠폰이 오늘 쓸 수 있는 쿠폰인지 
				String[] startDateList = dto.getStartDate().split("-");
				String[] endDateList = dto.getEndDate().split("-");
				
				//쿠폰 시작일
				Calendar c1 = Calendar.getInstance();
				c1.set(Integer.parseInt(startDateList[0]), Integer.parseInt(startDateList[1])-1,Integer.parseInt(startDateList[2]));
				long c1tick = c1.getTimeInMillis();
				
				//쿠폰 종료일
				Calendar c2 = Calendar.getInstance();
				c2.set(Integer.parseInt(endDateList[0]), Integer.parseInt(endDateList[1])-1,Integer.parseInt(endDateList[2]));
				long c2tick = c2.getTimeInMillis();
				
				//현재시간
				Calendar c3 = Calendar.getInstance();
				long c3tick = c3.getTimeInMillis();
				
				//시간이 맞으면 list 에 넣어준다.
				if ((c1tick < c3tick) && (c2tick > c3tick)) {
					cpList.add(dto);
				}
				
			}
			
			return cpList;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//회원이 보유하고 있는 쿠폰인지 아닌지 알려준다.
	public int getCheckCoupon(int userSeq, String couponSeq) {
		
		try {
			
			String sql = "select count(*) as cnt from tblCusCoupon where cusseq = ? and couponseq = ? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, userSeq);
			pstat.setString(2, couponSeq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				return rs.getInt("cnt");
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	//고객에게 쿠폰을 지급한다.
	public void downCoupon(int userSeq, String couponSeq) {
		try {
			
			String sql = "insert into tblCusCoupon values (cuscouponSeq.nextVal,default,?,?,0)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, couponSeq);
			pstat.setInt(2, userSeq);
			
			rs = pstat.executeQuery();
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	//더 빠르게! -> 새 five 이미지 가져오기
	public List<UserShowTopFive> getFiveImgList(String genre) {
		
		try {
			
			String sql = "select seq,poster from vwfivepic where genre = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, genre);
			rs = pstat.executeQuery();
			
			List<UserShowTopFive> bigFiveImgList = new ArrayList<UserShowTopFive>();
			
			int count = 0;
			
			while (rs.next()) {
				count++;
				
				if (count > 5) break;
				
				UserShowTopFive topFive = new UserShowTopFive();
				topFive.setSeq(rs.getInt("seq"));
				topFive.setImgName(rs.getString("poster"));
				
				bigFiveImgList.add(topFive);
				
			}
			
			return bigFiveImgList;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//공연에 대한 회차정보 객체를 돌려주는 메서드
	public List<UserShowRoundDTO> getRoundInfo(String showSeq) {
		
		try {
			
			String sql = "select * from tblRoundInfo where showseq = ? and delflag = 0 order by startdate";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, showSeq);
			rs = pstat.executeQuery();
			
			List<UserShowRoundDTO> dtoList = new ArrayList<UserShowRoundDTO>();
			
			while(rs.next()) {
				
				UserShowRoundDTO dto = new UserShowRoundDTO();
				
				dto.setRseq(rs.getString("seq"));
				dto.setRstartTime(rs.getString("startdate"));
				dto.setRendTime(rs.getString("enddate"));
				dto.setShowSeq(rs.getString("showseq"));
				dto.setDelflag(rs.getString("delflag"));
				
				
				dtoList.add(dto);
				
			}
			
			return dtoList;
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	//이미 예약된 좌석에 대한 정보를 돌려줄것이다.
	public List<UserShowTicktAllDTO> getUsedSeat(String showSeq, String showRoundSeq, String conDate) {
		
		try {
			
			String sql = "select distinct ts.seq,ts.floor,ts.area,ts.seatrow,ts.seatcol from tblTheater tt inner join tblSeat ts on tt.seq = ts.thSeq inner join TBLTICKET tk on tk.seat = ts.seq inner join tblBooking tbb on tbb.seq = tk.bookingseq inner join tblshow tsh on tsh.theaterseq = tt.seq where tsh.seq = ? and tbb.roundSeq = ? and tbb.bdate = ? and tt.delflag = 0 and tbb.delflag = 0 and tsh.delflag = 0 order by seq";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, showSeq);
			pstat.setString(2, showRoundSeq);
			pstat.setString(3, conDate);
			
			rs = pstat.executeQuery();
			
			List<UserShowTicktAllDTO> usedSeatList = new ArrayList<UserShowTicktAllDTO>();
			
			while(rs.next()) {
				
				UserShowTicktAllDTO dto = new UserShowTicktAllDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setFloor(rs.getString("floor"));
				dto.setArea(rs.getString("area"));
				dto.setSeatrow(rs.getString("seatrow"));
				dto.setSeatcol(rs.getString("seatcol"));
				
				
				usedSeatList.add(dto);
				
			}
			
			return usedSeatList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	//해당 유저의 쿠폰목록을 가져올것
	public List<UserShowCouponDTO> getMyCouponList(int userSeq, String showSeq) {
		try {
			
			String sql  = "select tcc.seq,tc.title,tc.startdate,tc.enddate,tc.discount,tc.showseq from tblCusCoupon tcc inner join tblCoupon tc on tcc.couponSeq = tc.seq where tc.showSeq = ? and tcc.cusSeq = ? and tcc.delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, showSeq);
			pstat.setInt(2, userSeq);
			
			rs = pstat.executeQuery();
			
			List<UserShowCouponDTO> hasCouponList = new ArrayList<UserShowCouponDTO>();
			
			while(rs.next()) {
				UserShowCouponDTO dto = new UserShowCouponDTO();	
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStartDate(rs.getString("startdate").substring(0,10));
				dto.setEndDate(rs.getString("enddate").substring(0,10));
				dto.setDiscount(rs.getString("discount"));
				dto.setShowSeq(rs.getString("showseq"));
				
				hasCouponList.add(dto);
				
			}
			
			return hasCouponList;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	//티켓 가격
	public int getTicketPrice(String showSeq) {
		try {
			
			String sql = "select price from tblShow where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1,showSeq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("price");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	
	//UserShowFinal 서블릿
	public int insertBook(BookDTO dto) {
		
		try {
			int result = 0;
			
			String sql = "insert into tblBooking (seq, bookdate,bdate,state,cnt,roundSeq,delflag) values (bookingSeq.nextVal,sysdate,to_date(?,'yyyy.mm.dd'),'완료',?,?,default)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getInputDate());
			pstat.setString(2, dto.getTicketNum());//문제
			pstat.setString(3, dto.getShowroundSeq());
			
			result += pstat.executeUpdate();
			
			//예매 번호 가져오기
			sql = "select max(seq) as seq from tblBooking";
			stat = conn.createStatement();
			stat.execute(sql);
			rs = stat.executeQuery(sql);
			String bookseq = "";
			if(rs.next()) {
				bookseq = rs.getString("seq");
			}
			
			//결제 테이블 insert
			sql = "insert into tblPay (Seq,opseq, bookseq, cusseq, delflag) values (paySeq.nextVal,3,?,?,default)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, bookseq);
			pstat.setInt(2, dto.getCusseq());
			
			result += pstat.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//회원이 가지고 있는 쿠폰을 없애준다.
	public void removeUserCoup(String couponUserSeq) {
		try {
			
			
			String sql = "update tblCusCoupon set delflag = 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, couponUserSeq);
			
			rs = pstat.executeQuery();//쿼리를 날려준다...
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	//유저가 쓰고 남은 egg money 를 넣어줄것이다.
	public void removeEggMoney(int cseq, int remainEgg) {
		try {
			
			String sql = "update tblCustomer set egg = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, remainEgg);
			pstat.setInt(2, cseq);
			
			rs = pstat.executeQuery();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	

	
	
	
}
