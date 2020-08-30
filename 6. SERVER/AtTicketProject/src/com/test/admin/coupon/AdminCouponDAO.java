package com.test.admin.coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.atticket.DBUtil;

public class AdminCouponDAO {
	
	//DB 담당
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public AdminCouponDAO() {
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
	//페이징을 해줄 메소드라고 생각하면 된다. -> 총 몇페이지나 나오는지 알려줄것임.
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";//쿼리에 들어갈 where문.
			
			if (map.get("search") != null) {
				where = String.format("where delflag = 0 and title like '%%%s%%' or startdate like '%%%s%%' or enddate like '%%%s%%' or discount like '%%%s%%'",map.get("search"),map.get("search"),map.get("search"),map.get("search"));
			} else {
				where = "where delflag = 0";
			}
			
			String sql = String.format("select count(*) as cnt from tblCoupon %s",where);//현재 해당 조건을 만족하는 데이터의 행이 몇개인지 받아오는 작업을 수행함.
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");//갯수를 리턴해 줄것이다.
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return 0;
	}
	
	public ArrayList<AdminCouponDTO> getList(HashMap<String, String> map) {
		
		try {
			//목록 or 검색
			String where = "";
			
			if (map.get("search") != null && map.get("search") != "") {
				//즉 search한게 무엇이라도 있을 경우에 이 구문에 들어오는 것이다 해당 구문에 들어있는걸 찾아주는 역할을 수행한다
				//해당 검색어에 있는것을 필터링 걸어서 찾아주면 된다.
				where = String.format("where (delflag = 0 and title like '%%%s%%' or startdate like '%%%s%%' or enddate like '%%%s%%' or discount like '%%%s%%')",map.get("search"),map.get("search"),map.get("search"),map.get("search"));	
			} else {
				where = "where delflag = 0";
			}
			
			//페이징 조건이 여기서 들어가게 된다.
			String sql = String.format("select a.* from (select rownum as rnum, v.* from vwCoupons v  %s) a where rnum >= %s and rnum <= %s order by %s"
					, where,map.get("begin"), map.get("end"),map.get("sort"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<AdminCouponDTO> list = new ArrayList<AdminCouponDTO>();//여기서 위에 해당하는 조건을 만족하는 직원들의 정보를 모두 리스트에 담을것이다.
			
			//System.out.println(map.get("sort"));
			
			//쿼리 날린것을 기반으로 돌아온 데이터를 처리할 것이다.
			while (rs.next()) {
				
				AdminCouponDTO dto = new AdminCouponDTO();//객체를 만들어서 리스트에 넣어줄 것이다.
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				
				String startDate = rs.getString("startdate").substring(0,10);
				String endDate = rs.getString("enddate").substring(0,10);
				
				dto.setStartDate(startDate);
				dto.setEndDate(endDate);
				dto.setDiscount(rs.getString("discount"));
				dto.setImg(rs.getString("img"));
				dto.setShowSeq(rs.getString("showseq"));
				dto.setDelflag(rs.getString("delflag"));
				
				System.out.println(rs.getString("seq"));
				System.out.println(rs.getString("title"));
				System.out.println(rs.getString("startdate"));
				System.out.println(rs.getString("enddate"));
				System.out.println(rs.getString("discount"));
				System.out.println(rs.getString("img"));
				System.out.println(rs.getString("showseq"));
				System.out.println(rs.getString("delflag"));
				
				
				list.add(dto);//위의 조건을 모두 만족하는 dto 객체를 넣는다.
				
			}
			
			return list;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	//공연 정보를 받아올 것이다.
	public ArrayList<AdminShowDTO> getShowList() {
		
		try {
			
			ArrayList<AdminShowDTO> list = new ArrayList<AdminShowDTO>();
			
			String sql = "select seq,title,startdate,enddate from tblShow where delflag = 0";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			while (rs.next()) {
				
				//System.out.println(rs.getString("seq"));
				AdminShowDTO dto = new AdminShowDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				
				String startDate = rs.getString("startdate").substring(0,10);
				String endDate = rs.getString("enddate").substring(0,10);
				
				dto.setStartDate(startDate);
				dto.setEndDate(endDate);
				
				list.add(dto);
			}
			
			
			rs.close();
			return list;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	//선택된 공연의 기간을 받아오는 역할수행한다.
	//매개변수로는 공연의 primary key를 받아오면 된다.
	public List<String> getShowTerm(String showSeq) {
		
		try {
			
			String sql = "select startdate,enddate from tblShow where seq=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, showSeq);
			
			rs = pstat.executeQuery();
			
			List<String> timeList = new ArrayList<String>();
			
			while(rs.next()) {
				timeList.add(rs.getString("startdate"));
				timeList.add(rs.getString("enddate"));
				//System.out.println(rs.getString("startdate"));
				//System.out.println();
			}
			
			return timeList;
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	//쿠폰을 새로 추가
	public void insertCoupon(List<String> list) {
		
		try {
			
			String sql = "insert into tblcoupon values(couponSeq.nextVal,?,TO_DATE(?,'yyyy/mm/dd'),TO_DATE(?,'yyyy/mm/dd'),?,'coupon.jpg',?,0)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, list.get(0));//쿠폰 명 기입
			pstat.setString(2, list.get(1));//시작일
			pstat.setString(3, list.get(2));//종료일
			pstat.setString(4, list.get(3));//차감액
			pstat.setString(5, list.get(4));//공연 seq
			
			pstat.executeUpdate();
			
			pstat.close();
			//conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	//쿠폰 지워주기
	public void deleteCoupon(String[] nums) {
		
		try {
			
			for (int i = 0; i < nums.length; i++) {
				
				String sql = "update tblcoupon set delflag = 1 where seq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, nums[i]);
				
				pstat.executeUpdate();
			}
			

			
			pstat.close();
			//conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	//쿠폰 수정할때 필요한 쿠폰에 연결된 공연 기간 정보를 받아오기 위함.
	public List<String> getSeqShowTerm(String editNum) {
		
		try {
			
			String sql = "select ts.startdate,ts.enddate from tblcoupon tc inner join tblShow ts on ts.seq = tc.showSeq where tc.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, editNum);
			
			rs = pstat.executeQuery();
			
			List<String> retunList = new ArrayList<String>();
			
			while(rs.next()) {
				
				String startdate = rs.getString("startdate").substring(0,10).replace("/", "-");
				String enddate = rs.getString("enddate").substring(0,10).replace("/", "-");
				
				retunList.add(startdate);
				retunList.add(enddate);
			}
			
			
			pstat.close();
			//conn.close();
			rs.close();
			
			return retunList;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//쿠폰 수정 -> 쿠폰에 엮여있는 공연 seq 가져오기
	public String getShowNum(String editNum) {
		
		try {
			
			String sql = "select ts.seq from tblcoupon tc inner join tblShow ts on ts.seq = tc.showSeq where tc.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, editNum);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
			pstat.close();
			rs.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	//쿠폰 수정을 위한 쿠폰명,기간,할인금액을 받아올것
	public List<String> getCouponInfoList(String editNum) {
		
		
		try {
			
			String sql = "select title,startdate,enddate,discount from tblCoupon where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, editNum);
			
			rs = pstat.executeQuery();
			
			
			List<String> returnList = new ArrayList<String>();
			
			while(rs.next()) {
				
//				System.out.println(rs.getString("title"));
//				System.out.println(rs.getString("startdate"));
//				System.out.println(rs.getString("enddate"));
//				System.out.println(rs.getString("discount"));
				
				returnList.add(rs.getString("title"));
				
				String startdate = rs.getString("startdate").substring(0,10).replace("/", "-");
				String enddate = rs.getString("enddate").substring(0,10).replace("/", "-");
				
				returnList.add(startdate);
				returnList.add(enddate);
				returnList.add(rs.getString("discount"));
				
			}
			
			
			return returnList;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	//진짜 쿠폰을 수정해준다.
	public void editCoupon(List<String> list) {
		try {
			
			//String sql = "insert into tblcoupon values(couponSeq.nextVal,?,TO_DATE(?,'yyyy/mm/dd'),TO_DATE(?,'yyyy/mm/dd'),?,'coupon.jpg',?,0)";
			String sql = "update tblcoupon set title = ?, startdate = TO_DATE(?,'yyyy/mm/dd'), enddate = TO_DATE(?,'yyyy/mm/dd'), discount = ?, showseq = ? where seq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(6, list.get(0));//쿠폰 seq
			pstat.setString(1, list.get(1));//쿠폰 명 기입
			pstat.setString(2, list.get(2));//시작일
			pstat.setString(3, list.get(3));//종료일
			pstat.setString(4, list.get(4));//차감액
			pstat.setString(5, list.get(5));//공연 seq
			
			pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			rs.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
}
