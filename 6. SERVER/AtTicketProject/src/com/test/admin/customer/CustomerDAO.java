package com.test.admin.customer;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import com.test.atticket.DBUtil;

public class CustomerDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CustomerDAO() {
			
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
		

		public int getTotalCount(HashMap<String, String> map) {
			try {
				String where = "";
				
				if(map.get("search")!=null) {
					where = String.format("and (seq like '%%%s%%' or name like '%%%s%%' or id like '%%%s%%' or tel like '%%%s%%' or ssn like '%%%s%%')",map.get("search"), map.get("search"),map.get("search"),map.get("search"),map.get("search"));
				} 
				String sql = String.format("select count(*) as cnt from tblcustomer where delflag <> 1 %s", where);
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				if(rs.next()) {
					return rs.getInt("cnt");
				}
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getTotalCount()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public ArrayList<CustomerDTO> list(HashMap<String, String> map) {
			try {
				
//				System.out.println("begin " + map.get("begin"));
//				System.out.println("end " + map.get("end"));
				
				String where = "";
			
				if(map.get("search")!=null && map.get("search")!="") {
					where = String.format("where (seq like '%%%s%%' or name like '%%%s%%' or id like '%%%s%%' or tel like '%%%s%%' or ssn like '%%%s%%') and delflag <> 1",map.get("search"), map.get("search"),map.get("search"),map.get("search"),map.get("search"));
				} else {
					where = "where delflag <> 1";
				}
				String sql = String.format("select * from (select a.*, rownum as rnum from (select * from tblCustomer %s order by seq desc) a ) where rnum > = %s and rnum <= %s  order by seq desc",where,map.get("begin"),map.get("end"));
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				ArrayList<CustomerDTO> list = new ArrayList<CustomerDTO>();
				
				while(rs.next()) {
					CustomerDTO dto = new CustomerDTO();
					

					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setId(rs.getString("id"));
					dto.setSsn(rs.getString("ssn"));
					dto.setPw(rs.getString("pw"));
					dto.setEgg(rs.getString("egg"));
					dto.setAddr(rs.getString("addr"));
					dto.setEmail(rs.getString("email"));
					dto.setGrade(rs.getString("grade"));
					dto.setTel(rs.getString("tel"));
					dto.setPhoto(rs.getString("photo"));
					
					list.add(dto);
				}
				
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.list()");
				e.printStackTrace();
			}
			return null;
		}

		public int delete(String seq, String[] cb) {
			try {
				
				for(int i=0;i<cb.length;i++) {
					String sql = "update tblCustomer set delflag = 1 where seq = ?";
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, cb[i]);
					pstat.executeUpdate();
				}
				return 1;
			} catch (Exception e) {
				System.out.println("CustomerDAO.delete()");
				e.printStackTrace();
			}
			return 0;
		}

		public int write(CustomerDTO dto) {
			String sql = null;
			try {
				if(dto.getPhoto()!=null) {
				 sql = "insert into tblCustomer values (customerSeq.nextVal,?,?,?,?,?,?,?,?,?,default,?,default)";
				} else {
				 sql = "insert into tblCustomer values (customerSeq.nextVal,?,?,?,?,?,?,?,?,?,default, default,default)";
				}
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getName());
				pstat.setString(2, dto.getSsn());
				
				pstat.setString(3, dto.getId());
				pstat.setString(4, dto.getPw());
				pstat.setString(5, dto.getEgg());
				pstat.setString(6, dto.getAddr());
				pstat.setString(7, dto.getTel());
				pstat.setString(8, dto.getEmail());
				pstat.setString(9, dto.getGrade());
				if(dto.getPhoto()!=null) {
					pstat.setString(10, dto.getPhoto());
				}
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.Insert()");
				e.printStackTrace();
			}
			return 0;
		}

		public CustomerDTO get(CustomerDTO dto2) {
			try {
				
				String sql = "select * from tblCustomer where seq = ? and delflag <> 1";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto2.getSeq()); // 고객 번호
				
				rs = pstat.executeQuery();
				
				if(rs.next()) {
					CustomerDTO dto = new CustomerDTO();
					dto.setAddr(rs.getString("addr"));
					dto.setEgg(rs.getString("egg"));
					dto.setEmail(rs.getString("email"));
					dto.setGrade(rs.getString("grade"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPw(rs.getString("pw"));
					dto.setSeq(rs.getString("seq"));
					dto.setSsn(rs.getString("ssn"));
					dto.setTel(rs.getString("tel"));
				
					return dto;
				}
				
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.get()");
				e.printStackTrace();
			}
			return null;
		}

		public int edit(CustomerDTO dto) {
			String sql = null;
			try {
				
				if(dto.getPhoto()!=null) {
					sql = "update tblCustomer set name = ?, id = ? , ssn = ?, tel = ?, addr = ?, egg = ?, pw = ?, grade = ?, email = ?, photo = ? where seq = ?";
					} else {
						sql = "update tblCustomer set name = ?, id = ? , ssn = ?, tel = ?, addr = ?, egg = ?, pw = ?, grade = ?, email = ? where seq = ?";
					}
			
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getName());
				pstat.setString(2, dto.getId());
				pstat.setString(3, dto.getSsn());
				pstat.setString(4, dto.getTel());
				pstat.setString(5, dto.getAddr());
				pstat.setString(6, dto.getEgg());
				pstat.setString(7, dto.getPw());
				pstat.setString(8, dto.getGrade());
				pstat.setString(9, dto.getEmail());
				
				if(dto.getPhoto()!=null) {
					pstat.setString(10, dto.getPhoto());
					pstat.setString(11, dto.getSeq());
				} else {
					pstat.setString(10, dto.getSeq());
				}
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.edit()");
				e.printStackTrace();
			}
			return 0;
		}

		public ArrayList<CusBookDTO> getBook(String seq) {
			String sql = null;
			try {
				
				sql = "select * from vwcusbook where cusseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);
				rs = pstat.executeQuery();
				ArrayList<CusBookDTO> list = new ArrayList<CusBookDTO>();
				
				while(rs.next()) {
					CusBookDTO bookdto = new CusBookDTO();
					bookdto.setShowtitle(rs.getString("showtitle"));
					bookdto.setBdate(rs.getString("bdate").substring(0,10));
					bookdto.setBookdate(rs.getString("bookdate").substring(0,10));
					bookdto.setBookseq(rs.getString("bookseq"));
					bookdto.setBookstate(rs.getString("bookstate"));
					bookdto.setCusseq(rs.getString("cusseq"));
					list.add(bookdto);
				}
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getBook()");
				e.printStackTrace();
			}
			
			return null;
		}

		public ArrayList<CusPointDTO> getPoint(String seq) {
			String sql = null;
			try {
				
				sql = "select * from vwpoint where cusseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);
				rs = pstat.executeQuery();
				ArrayList<CusPointDTO> list = new ArrayList<CusPointDTO>();
				
				while(rs.next()) {
					CusPointDTO pointdto = new CusPointDTO();
					pointdto.setBookseq(rs.getString("bookseq"));
					pointdto.setShowtitle(rs.getString("showtitle"));
					pointdto.setPointdate(rs.getString("pointdate"));
					pointdto.setEgg(rs.getString("egg"));
					pointdto.setValid(rs.getString("valid"));
					pointdto.setType(rs.getString("type"));
					list.add(pointdto);
				}
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getPoint()");
				e.printStackTrace();
			}
			
			return null;
		}

		public ArrayList<CusMyShowDTO> getInterest(String seq) {
			String sql = null;
			try {
				
				sql = "select * from vwMyShow where cusseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);
				rs = pstat.executeQuery();
				ArrayList<CusMyShowDTO> list = new ArrayList<CusMyShowDTO>();
				
				while(rs.next()) {
					CusMyShowDTO showview = new CusMyShowDTO();
					showview.setShowtitle(rs.getString("showtitle"));
					showview.setEnddate(rs.getString("enddate"));
					showview.setShowaddr(rs.getString("showaddr"));
					showview.setStartdate(rs.getString("startdate"));
					showview.setMyshowseq(rs.getString("myshowseq"));
					list.add(showview);
				}
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getInterest()");
				e.printStackTrace();
			}
			
			return null;
		}

		public ArrayList<CusShowViewDTO> getViewShow(String seq) {
			String sql = null;
			try {
				
				sql = "select * from vwshowView where cusseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);
				rs = pstat.executeQuery();
				ArrayList<CusShowViewDTO> list = new ArrayList<CusShowViewDTO>();
				
				while(rs.next()) {
					CusShowViewDTO showview = new CusShowViewDTO();
					showview.setShowtitle(rs.getString("showtitle"));
					showview.setEnddate(rs.getString("enddate").substring(0,11));
					showview.setStartdate(rs.getString("startdate").substring(0,11));
					showview.setShowaddr(rs.getString("showaddr"));
					showview.setBookseq(rs.getString("bookseq"));
					showview.setPayseq(rs.getString("payseq"));
					list.add(showview);
				}
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getViewShow()");
				e.printStackTrace();
			}
			
			return null;
		}

		public ArrayList<CusCouponDTO> getCoupon(String seq) {
			String sql = null;
			try {
				
				sql = "select * from vwcoupon where cusseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);
				rs = pstat.executeQuery();
				ArrayList<CusCouponDTO> list = new ArrayList<CusCouponDTO>();
				
				while(rs.next()) {
					CusCouponDTO showcoupon = new CusCouponDTO();
					showcoupon.setDiscount(rs.getString("discount"));
					showcoupon.setTerms(rs.getString("terms"));
					showcoupon.setStartdate(rs.getString("startdate"));
					showcoupon.setEnddate(rs.getString("enddate"));
					showcoupon.setFirstdate(rs.getString("firstdate"));
					showcoupon.setCuscouponseq(rs.getString("cuscouponseq"));
					list.add(showcoupon);
				}
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getCoupon()");
				e.printStackTrace();
			}
			return null;
		}

		public CusBookDTO getBook(CusBookDTO dto2) {
				try {
				
				String sql = "select * from vwcusbook where cusseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto2.getBookseq()); // 고객 번호
				
				rs = pstat.executeQuery();
				
				if(rs.next()) {
					CusBookDTO dto = new CusBookDTO();
					dto.setCusseq(rs.getString("cusseq"));
					dto.setBdate(rs.getString("bdate").substring(0,10));
					dto.setBookseq(rs.getString("bookseq"));
					dto.setBookstate(rs.getString("bookstate"));
					dto.setBookdate(rs.getString("bookdate").substring(0,10));
					dto.setBookstate(rs.getString("bookstate"));
					dto.setShowtitle(rs.getString("showtitle"));
					return dto;
				}
				
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getBook()");
				e.printStackTrace();
			}
			
			return null;
		}

		public int bookupdate(CusBookDTO dto) {
			
			try {
//				conn.setAutoCommit(false);
				
				String sql = "update tblbooking set bdate = ?, bookdate = ?, roundseq = ?, state = ? where seq = ?";
				pstat = conn.prepareStatement(sql);
	
				pstat.setString(1, dto.getBdate());
				//String bdate = dto.getBdate().substring(2,4)+"/"+dto.getBdate().substring(5,7)+"/"+dto.getBdate().substring(8);
				
				pstat.setString(2, dto.getBookdate());
				//String bookdate = dto.getBookdate().substring(2,4)+"/"+dto.getBookdate().substring(5,7)+"/"+dto.getBookdate().substring(8);
				
				pstat.setString(3, dto.getShowtitle());
				pstat.setString(4, dto.getBookstate());
				pstat.setString(5, dto.getBookseq());
				
				int result = pstat.executeUpdate();
				
//				sql = "update tblshow set title = ? where seq = (select ri.showseq from tblbooking b inner join tblroundinfo ri on ri.seq = b.roundseq where b.seq = ?)";
//				pstat = conn.prepareStatement(sql);
//				
//				pstat.setString(1, dto.getShowtitle());
//				pstat.setString(2, dto.getBookseq());
				
//				result+=pstat.executeUpdate();
//				System.out.println(result);
//				if(result==2) {
//					conn.commit();
//				} else {
//					conn.rollback();
//				}
				return result;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.bookupdate()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public int bookinsert(CusBookDTO dto) {
			try {
				String sql = "insert into tblbooking (bookingSeq.nextVal, ?,?,?,?,?,default)";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getBookdate());
				pstat.setString(2, dto.getBookseq());
				pstat.setString(3, dto.getShowtitle());
				pstat.setString(4, dto.getBdate());
				pstat.setString(5, dto.getBookstate());
				return pstat.executeUpdate(sql);
			} catch (Exception e) {
				System.out.println("CustomerDAO.bookinsert()");
				e.printStackTrace();
			}
			return 0;
		}

		public ArrayList<ShowDTO> getShow() {
			try {
				String sql = "select * from vwshowRound";
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				ArrayList<ShowDTO> list = new ArrayList<ShowDTO>();
				
				while(rs.next()) {
					ShowDTO dto = new ShowDTO();
					dto.setShowseq(rs.getString("showseq"));
					dto.setShowtitle(rs.getString("showtitle"));
					dto.setEnddate(rs.getString("enddate"));
					dto.setStartdate(rs.getString("startdate"));
					dto.setRoundseq(rs.getString("roundseq"));
					dto.setAddr(rs.getString("addr"));
					dto.setTheatername(rs.getString("theatername"));
					list.add(dto);
				}
				
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getShow()");
				e.printStackTrace();
			}
			return null;
		}

		public int bookdelete(String[] cb1) {
			String sql = "update tblbooking set delflag = 1 where seq = ?";
			boolean loop = false;
			int result = -1;
			try {
				pstat = conn.prepareStatement(sql);
				for(int i=0;i<cb1.length;i++) {
					pstat.setString(1, cb1[i]);
		
					result = pstat.executeUpdate();
					if(result == 1) {
						loop = true;
					} else {
						loop = false;
					}
				}
				if(loop) {
					result = 1;
				}
				return result;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.bookdelete()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public CusPointDTO getPoint(CusPointDTO dto2) {
			
			try {
				
				String sql = "select * from vwPoint where bookseq = ?";
				pstat = conn.prepareStatement(sql);
				System.out.println(dto2.getBookseq());
				pstat.setString(1, dto2.getBookseq());
				rs = pstat.executeQuery();
				if(rs.next()) {
					CusPointDTO dto = new CusPointDTO();
					dto.setBookseq(rs.getString("bookseq"));
					dto.setCusseq(rs.getString("cusseq"));
					dto.setEgg(rs.getString("egg"));
					dto.setPointdate(rs.getString("pointdate"));
					dto.setShowtitle(rs.getString("showtitle"));
					dto.setType(rs.getString("type"));
					dto.setValid(rs.getString("valid"));
					return dto;
				}
				
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getPoint()");
				e.printStackTrace();
			}
			
			return null;
		}

		public int pointupdate(CusPointDTO dto) {
			String sql = "update tblcustomer set egg = ?, type = ? where seq = ?";
			try {
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getEgg());
				pstat.setString(2, dto.getType());
				pstat.setString(3, dto.getCusseq());
				
				return pstat.executeUpdate();
			} catch (Exception e) {
				System.out.println("CustomerDAO.pointupdate()");
				e.printStackTrace();
			}
			return 0;
		}

		public int showinsert(CusInShowDTO dto) {
		
			try {
			
//				String sql = "select addr from vwshowaddr where showseq = ?";
//				pstat = conn.prepareStatement(sql);
//				pstat.setString(1, dto.getShowseq());
//				rs = pstat.executeQuery();
//				String addr = null;
//				if(rs.next()) {
//					addr = rs.getString("addr");
//				}
				String sql = "insert into tblmyshow values(myShowSeq.nextVal,to_char(sysdate,'yy/mm/dd'),?,?,default)";
				pstat=conn.prepareStatement(sql);
				pstat.setString(1,dto.getShowseq());
				pstat.setString(2, dto.getCusseq());
				int result = pstat.executeUpdate();
				return result;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.showinsert()");
				e.printStackTrace();
			}
			return 0;
		}

		public CusMyShowDTO getMyShow(String showseq) {
			try {
				String sql = "select * from vwmyshow where myshowseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, showseq);
				rs = pstat.executeQuery();
				if(rs.next()) {
					CusMyShowDTO dto = new CusMyShowDTO();
					dto.setCusseq(rs.getString("cusseq"));
					dto.setEnddate(rs.getString("enddate"));
					dto.setMyshowseq(rs.getString("myshowseq"));
					dto.setShowaddr(rs.getString("showaddr"));
					dto.setShowtitle(rs.getString("showtitle"));
					dto.setStartdate(rs.getString("startdate"));
					
					return dto;
				}
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getMyShow()");
				e.printStackTrace();
			}
			
			return null;
		}

		public int myshowupdate(CusInShowDTO dto) {
			
			try {
				String sql = "update tblmyshow set showseq = ? where seq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getShowseq());
				pstat.setString(2,dto.getMyshowseq());
				
				return pstat.executeUpdate();
				
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.myshowupdate()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public int myshowdelete(String[] myshowseq) {
			boolean loop = false;
			int result = 0;
			try {
				int cnt = 0;
				for(int i=0;i<myshowseq.length;i++) {
				
					String sql = String.format("update tblmyshow set delflag = 1 where seq = %s",myshowseq[i]);
					stat = conn.createStatement();				
					
					result = stat.executeUpdate(sql);
					
					if(result == 1) {
						loop = true;
					} else {
						loop = false;
					}
				}
				if(loop) {
					result = 1;
				}
				return result;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.myshowdelete()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public CusShowViewDTO getShowView(String bookseq) {
			try {
				String sql = "select * from vwshowView where bookseq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, bookseq);
				rs = pstat.executeQuery();
				if(rs.next()) {
					CusShowViewDTO dto = new CusShowViewDTO();
					dto.setBookseq(rs.getString("bookseq"));
					dto.setCusseq(rs.getString("cusseq"));
					dto.setEnddate(rs.getString("enddate").substring(0,10));
					dto.setStartdate(rs.getString("startdate").substring(0,10));
					dto.setShowaddr(rs.getString("showaddr"));
					dto.setShowtitle(rs.getString("showtitle"));
					dto.setRoundseq(rs.getString("roundseq"));
					return dto;
				}
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getShowView()");
				e.printStackTrace();
			}
			return null;
		}

		public int viewupdate(CusShowViewDTO dto) {
			
			try {
				String sql = "update tblroundinfo set showseq = ? where seq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getShowseq());
				pstat.setString(2, dto.getRoundseq());
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.viewupdate()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public ArrayList<CouponDTO> getInfoCoupon() {
			try {
				String sql = "select * from tblcoupon where enddate > to_char(sysdate,'yy/mm/dd') and delflag <> 1";
				stat = conn.prepareCall(sql);
				rs = stat.executeQuery(sql);
				ArrayList<CouponDTO> list = new ArrayList<CouponDTO>();
				while(rs.next()) {
					CouponDTO dto = new CouponDTO();
					dto.setDiscount(rs.getString("discount"));
					dto.setEnddate(rs.getString("enddate"));
					dto.setImg(rs.getString("img"));
					dto.setSeq(rs.getString("seq"));
					dto.setShowseq(rs.getString("showseq"));
					dto.setStartdate(rs.getString("startdate"));
					dto.setTitle(rs.getString("title"));
					list.add(dto);
				}
				return list;
				
					
			} catch (Exception e) {
				System.out.println("CustomerDAO.getInfoCoupon()");
				e.printStackTrace();
			}
			return null;
		}

		public int couponinsert(CusCouponDTO2 dto) {
			
			try {
				String sql = "insert into tblcuscoupon values(cuscouponSeq.nextVal,to_char(sysdate,'yy/mm/dd'),?,?,default)";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getCouponseq());
				pstat.setString(2, dto.getCusseq());
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.couponinsert()");
				e.printStackTrace();
			}
			
			return 0;
		}

		public int couponupdate(CusCouponDTO2 dto) {
			try {
				
				String sql = "update tblcusCoupon set couponseq = ? where seq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getCouponseq());
				pstat.setString(2, dto.getSeq());
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.couponupdate()");
				e.printStackTrace();
			}
			return 0;
		}

		public int cuscoupondelete(String[] cuscouponseq) {
			try {
				int result = 0;
				boolean loop = false;
				for (int i = 0; i < cuscouponseq.length; i++) {
					String sql = "update tblcuscoupon set delflag = 1 where seq = ?";
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, cuscouponseq[i]);

					result = pstat.executeUpdate();

					if (result == 1) {
						loop = true;
					} else {
						loop = false;
					}
				}
				
				if (loop) {
					result = 1;
				}
				return result;

			} catch (Exception e) {
				System.out.println("CustomerDAO.cuscoupondelete()");
				e.printStackTrace();
			}
			return 0;
		}

		public int cusviewdelete(String[] bookseq) {
			try {
				conn.setAutoCommit(false);
				
				int result = 0;
				boolean loop = false;
				
				for(int i=0;i<bookseq.length;i++) {
					String sql = "update tblbooking set delflag = 1 where seq = ?";
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, bookseq[i]);
					result = pstat.executeUpdate();

					if (result == 1) {
						loop = true;
					} else {
						loop = false;
					}
				}
				
				for(int i=0;i<bookseq.length;i++) {
					String sql = "update tblpay set delflag = 1 where bookseq = ?";
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, bookseq[i]);
					result = pstat.executeUpdate();

					if (result == 1) {
						loop = true;
					} else {
						loop = false;
					}
				}
					
				if(loop) {
					conn.commit();
					return 1;
				} else {
					conn.rollback();
					return 0;
				}
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.cusviewdelete()");
				e.printStackTrace();
			}
			return 0;
		}

		public ArrayList<String> getGrade() {
			try {
				
				String sql = "select distinct grade from tblcustomer group by grade";
				stat = conn.createStatement();
				
				rs = stat.executeQuery(sql);
				ArrayList<String> list = new ArrayList<String>();
				while(rs.next()) {
					list.add(rs.getString("grade"));
				}
				return list;
				
			} catch (Exception e) {
				System.out.println("CustomerDAO.getGrade()");
				e.printStackTrace();
			}
			return null;
		}
		


}








