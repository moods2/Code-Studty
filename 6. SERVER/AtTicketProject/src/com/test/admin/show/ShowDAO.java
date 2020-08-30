package com.test.admin.show;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.atticket.DBUtil;

public class ShowDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ShowDAO() {
		//DB 연결
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}//close()

	//Show 서블릿 -> 공연 목록 불러오기
	public ArrayList<ShowDTO> getList(HashMap<String, String> map) {
		
		try {
			//목록 or 검색
			String where = "";
			
			if(map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				where = String.format("and title like '%%%s%%' or genre like '%%%s%%'",map.get("search"),map.get("search"));
			}
			
			String sql = String.format("select a.* from (select rownum as rnum, s.* from (select * from tblShow where delflag = 0 %s order by seq) s) a where rnum >= %s and rnum <= %s and delflag=0 order by %s"
					,where ,map.get("begin"), map.get("end"),map.get("sort"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<ShowDTO> list = new ArrayList<ShowDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				ShowDTO dto = new ShowDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setGenre(rs.getString("genre"));
				
				//date 시간 잘라서 넣기
				String[] date = rs.getString("startdate").split(" ");
				dto.setStartDate(date[0]);
				date = rs.getString("enddate").split(" ");
				dto.setEndDate(date[0]);

				list.add(dto);
			}

			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}//getList()
	
	//show 서블릿 -> 페이징
	public int getTotalCount(HashMap<String, String> map) {
		try {
			String where = "";

			if (map.get("search") != null) {
				// 이름 & 제목 & 내용 - 포괄 검색
				where = String.format("and title like '%%%s%%' or genre like '%%%s%%'",
						map.get("search"), map.get("search"));
			}

			String sql = String.format("select count(*) as cnt from tblShow where delflag = 0 %s", where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//showadd 서블릿 -> 공연 테이블 추가
	public int addShow(ShowDTO dto) {
		try {
			String sql = "insert into tblShow (seq,title,startdate,enddate,price,poster,content,opendate,age,genre,agencyseq,delflag,theaterSeq) values (showSeq.nextVal, ?, to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?,?,?,to_date(?,'yyyy-mm-dd'),?,?,?,default,?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getStartDate());
			pstat.setString(3, dto.getEndDate());
			pstat.setString(4, dto.getPrice());
			pstat.setString(5, dto.getPoster());
			pstat.setString(6, dto.getContent());
			pstat.setString(7, dto.getOpenDate());
			pstat.setString(8, dto.getAge());
			pstat.setString(9, dto.getGenre());
			pstat.setString(10, dto.getAgency());
			pstat.setString(11, dto.getPlace());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//ShowHall 서블릿
	public ArrayList<HallDTO> hist(String region) {
		try {
			String sql = "select * from tblHall where region=? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, region);
			rs = pstat.executeQuery();
			
			ArrayList<HallDTO> hlist = new ArrayList<HallDTO>();
			
			while(rs.next()) {
				HallDTO dto = new HallDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setRegion(rs.getString("region"));
				
				hlist.add(dto);
			}
			
			return hlist;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//AdminShowTheater
	public ArrayList<TheaterDTO> tlist(String hseq) {
		try {
			String sql = "select * from tblTheater where delflag = 0 and hallSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, hseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<TheaterDTO> list = new ArrayList<TheaterDTO>();
			
			while(rs.next()) {
				TheaterDTO dto = new TheaterDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setHallSeq(rs.getString("hallSeq"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//adminShowAddOK -> 상영관 번호 찾기
	public int loadTheater(String theater) {
		try {
			String sql = "select seq from tblTheater where name = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, theater);
			rs = pstat.executeQuery();
			if(rs.next()) {
				return rs.getInt("seq");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public String searchSeq() {
		try {
			String sql = "select max(seq) as seq from tblShow";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int addRound(ShowDTO dto) {
		
		try {
			
			
			String sql = "insert into tblRoundInfo (seq, startDate, endDate, showSeq, delflag) values (roundInfoSeq.nextVal,?,?,?,default)";
			
			int showmin = dto.getMin();
			String[] times = dto.getTime().split(":");
			int hour = Integer.parseInt(times[0]);
			int min = Integer.parseInt(times[1]);
			
			min += showmin;
			if(min >= 60) {
				hour++;
				min = min - 60;
			}
			
			String endTime = hour+":"+min;
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTime());
			pstat.setString(2, endTime);
			pstat.setString(3, dto.getSeq());
			
			int result = pstat.executeUpdate();
			
			
			if(dto.getRound2() != null || !dto.getRound2().equals("")) {
				sql = "insert into tblRoundInfo (seq, startDate, endDate, showSeq, delflag) values (roundInfoSeq.nextVal,?,?,?,default)";
				
				showmin = dto.getMin();
				times = dto.getTime2().split(":");
				hour = Integer.parseInt(times[0]);
				min = Integer.parseInt(times[1]);
				
				min += showmin;
				if(min >= 60) {
					hour++;
					min = min - 60;
				}
				
				endTime = hour+":"+min;
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getTime2());
				pstat.setString(2, endTime);
				pstat.setString(3, dto.getSeq());
				
				pstat.executeUpdate();
				
			} else if (dto.getRound3() != null || !dto.getRound3().equals("")) {
				sql = "insert into tblRoundInfo (seq, startDate, endDate, showSeq, delflag) values (roundInfoSeq.nextVal,?,?,?,default)";

				showmin = dto.getMin();
				times = dto.getTime3().split(":");
				hour = Integer.parseInt(times[0]);
				min = Integer.parseInt(times[1]);

				min += showmin;
				if (min >= 60) {
					hour++;
					min = min - 60;
				}

				endTime = hour + ":" + min;

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getTime3());
				pstat.setString(2, endTime);
				pstat.setString(3, dto.getSeq());
				
				pstat.executeUpdate();
			}
			
			return result;
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//AdminShowView 서블릿
	public ShowDTO loadview(String seq) {
		
		try {
			String sql = "select count(*) as cnt" + 
					" from tblShow s left outer join tblAgency a on s.agencySeq = a.seq" + 
					" inner join tbltheater t on s.theaterSeq = t.seq" + 
					" inner join tblHall h on t.hallSeq = h.seq\r\n" + 
					" inner join tblRoundInfo r on s.seq = r.showSeq" + 
					" where r.delflag = 0 and s.delflag = 0 and s.seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			int cnt = 0;
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			ShowDTO dto = new ShowDTO();
			String[] rseqs = new String[10];
			String[] startTimes = new String[10];
			
			if(cnt > 1) {
				sql = "select r.seq, r.startdate " + 
						"from tblShow s left outer join tblAgency a on s.agencySeq = a.seq " + 
						"inner join tbltheater t on s.theaterSeq = t.seq " + 
						"inner join tblHall h on t.hallSeq = h.seq " + 
						"inner join tblRoundInfo r on s.seq = r.showSeq " + 
						"where r.delflag = 0 and s.delflag = 0 and s.seq=? " + 
						"order by seq desc";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, seq);
				rs = pstat.executeQuery();
				
				int i=0;
				
				while(rs.next()) {
					rseqs[i] = rs.getString("seq");
					startTimes[i] = rs.getString("startdate");
					i++;
				}
				
				
			}
			
			sql = "select s.seq, s.title, to_char(s.startdate,'yyyy-mm-dd') as startdate,to_char(s.enddate,'yyyy-mm-dd') as enddate,s.poster, s.content, to_char(s.opendate,'yyyy-mm-dd') as opendate, s.age, s.genre,s.price, s.delflag " + 
					",a.host, t.name as tname, h.name as hname, h.addr as addr, r.seq as rseq, r.startDate as rstart, r.endDate as rend, h.region " + 
					"from tblShow s left outer join tblAgency a on s.agencySeq = a.seq " + 
					"inner join tbltheater t on s.theaterSeq = t.seq " + 
					"inner join tblHall h on t.hallSeq = h.seq " + 
					"inner join tblRoundInfo r on s.seq = r.showSeq " + 
					"where r.delflag = 0 and s.delflag = 0 and s.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			
			if(rs.next()) {
				//소요시간 계산하기
				String start = rs.getString("rstart");
				String end = rs.getString("rend");
				
				String[] str = start.split(":");
				int shour = Integer.parseInt(str[0]);
				int smin = Integer.parseInt(str[1]);
				String[] str2 = end.split(":");
				int ehour = Integer.parseInt(str2[0]);
				int emin = Integer.parseInt(str2[1]);
				
				int thour = 0;
				int tmin = 0;
				
				if(emin > smin) {
					tmin = emin-smin;
				}else {
					ehour--;
					emin += 60;
					tmin = emin-smin;
				}
				thour = ehour-shour;
				
				if(thour >= 1) {
					tmin += thour * 60;
				}
				
				dto.setAge(rs.getString("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setAgencyName(rs.getString("host"));
				dto.setContent(rs.getString("content"));
				dto.setEndDate(rs.getString("enddate"));
				dto.setGenre(rs.getString("genre"));
				dto.setHallName(rs.getString("hname"));
				dto.setOpenDate(rs.getString("opendate"));
				dto.setPoster(rs.getString("poster"));
				dto.setPrice(rs.getString("price"));
				dto.setRound(rs.getString("rseq"));
				dto.setSeq(rs.getString("seq"));
				dto.setStartDate(rs.getString("startdate"));
				dto.setTheaterName(rs.getString("tname"));
				dto.setTime(rs.getString("rstart"));
				dto.setTitle(rs.getString("title"));
				dto.setPlace(rs.getString("region"));
				dto.setMin(tmin);
				
				if(rseqs[1] != null) {
					dto.setRound2(rseqs[0]);
					dto.setTime2(startTimes[0]);
				} else if(rseqs[2] != null) {
					dto.setRound3(rseqs[2]);
					dto.setTime3(startTimes[2]);
				}
				
			}
			
			return dto;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//공연 수정
	public int editShow(ShowDTO dto) {
		try {
			
			String sql = "update tblShow set title=?,startdate = to_date(?,'yyyy-mm-dd'),enddate = to_date(?,'yyyy-mm-dd'),price=?, poster=?, content=?, opendate = to_date(?,'yyyy-mm-dd'), "
					+ "age=?, genre=?, agencyseq=?, theaterSeq=? where seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getStartDate());
			pstat.setString(3, dto.getEndDate());
			pstat.setString(4, dto.getPrice());
			pstat.setString(5, dto.getPoster());
			pstat.setString(6, dto.getContent());
			pstat.setString(7, dto.getOpenDate());
			pstat.setString(8, dto.getAge());
			pstat.setString(9, dto.getGenre());
			pstat.setString(10, dto.getAgency());
			pstat.setString(11, dto.getPlace());
			pstat.setString(12, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//회차 수정
	public int editRound(ShowDTO dto) {
		try {
			
			String sql = "update tblRoundInfo set delflag = 1 where showSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			pstat.executeUpdate();
			
			return addRound(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//공연 삭제
	public int deleteShow(String seq) {
		
		try {
			String sql = "update tblShow set delflag = 1 where seq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//회차 삭제
	public int deleteRound(String seq) {
		try {
			
			String sql = "update tblRoundInfo set delflag = 1 where showSeq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//태그 추가
	public int addTag(TagDTO tdto) {
		
		try {
			int addcnt = 0;
			
			for(String tag: tdto.getTags()) {
				String sql = "insert into tblTag (seq,name,showSeq,delflag) values (tagSeq.nextVal, ?,?,default)";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, tag);
				pstat.setString(2, tdto.getShowSeq());
				
				addcnt += pstat.executeUpdate();
			}
			
			if(addcnt == tdto.getTags().length) {
				return 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public TagDTO loadTag(String seq) {
		
		try {
			
			TagDTO tdto = new TagDTO();
			
			int index = 0;
			
			String sql = "select count(*) as cnt from tblTag where showseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				index = rs.getInt("cnt");
			}
						
			String[] tags = new String[index];
			
			sql = "select * from tblTag where showseq = ? and delflag = 0";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			int i=0;
			while(rs.next()) {
				tags[i] = rs.getString("name"); 
				i++;
			}
			tdto.setShowSeq(seq);
			tdto.setTags(tags);
			
			return tdto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int editTag(TagDTO tdto) {
		try {
			
			//삭제 -> 다시 추가
			String sql = "delete from tblTag where showSeq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, tdto.getShowSeq());
			pstat.executeUpdate();
			
			return addTag(tdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteTag(TagDTO tdto) {
		try {

			// 삭제 -> 다시 추가
			String sql = "delete from tblTag where showSeq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, tdto.getShowSeq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}






	
}
