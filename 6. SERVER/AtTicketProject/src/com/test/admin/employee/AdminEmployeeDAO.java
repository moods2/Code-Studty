package com.test.admin.employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;


import com.test.atticket.DBUtil;

public class AdminEmployeeDAO {
	//db 담당
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AdminEmployeeDAO() {
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
	
	public ArrayList<AdminEmployeeDTO> getList(HashMap<String,String> map) {
		
		
		try {
			//목록 or 검색
			String where = "";
			
			if (map.get("search") != null && map.get("search") != "") {
				//즉 search한게 무엇이라도 있을 경우에 이 구문에 들어오는 것이다 해당 구문에 들어있는걸 찾아주는 역할을 수행한다
				//해당 검색어에 있는것을 필터링 걸어서 찾아주면 된다.
				where = String.format("where (delflag = 0 and name like '%%%s%%' or jikwi like '%%%s%%' or salary like '%%%s%%' or ssn like '%%%s%%' or tel like '%%%s%%' or tn like '%%%s%%')",map.get("search"),map.get("search"),map.get("search"),map.get("search"),map.get("search"),map.get("search"));	
			} else {
				where = "where delflag = 0";
			}
			
			//페이징 조건이 여기서 들어가게 된다.
			String sql = String.format("select a.* from (select rownum as rnum, v.* from vwCempInfoJam v  %s) a where rnum >= %s and rnum <= %s order by %s"
					, where,map.get("begin"), map.get("end"),map.get("sort"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<AdminEmployeeDTO> list = new ArrayList<AdminEmployeeDTO>();//여기서 위에 해당하는 조건을 만족하는 직원들의 정보를 모두 리스트에 담을것이다.
			
			//System.out.println(map.get("sort"));
			
			//쿼리 날린것을 기반으로 돌아온 데이터를 처리할 것이다.
			while (rs.next()) {
				
				AdminEmployeeDTO dto = new AdminEmployeeDTO();//객체를 만들어서 리스트에 넣어줄 것이다.
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setJikwi(rs.getString("jikwi"));
				dto.setSalary(rs.getString("salary"));
				dto.setSsn(rs.getString("ssn"));
				dto.setTel(rs.getString("tel"));
				dto.setBuseo(rs.getString("tn"));
				dto.setDelflag(rs.getString("delflag"));
				
				list.add(dto);//위의 조건을 모두 만족하는 dto 객체를 넣는다.
				
			}
			
			return list;
			


			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//페이징을 해줄 메소드라고 생각하면 된다.
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search") != null) {
				//즉 search한게 무엇이라도 있을 경우에 이 구문에 들어오는 것이다. 해당 구문에 들어있는걸 찾아주는 역할을 수행한다
				//해당 검색어에 있는것을 필터링 걸어서 찾아주면 된다.
				//where = String.format("where name like '%%%s%%' or jikwi like '%%%s%%' or salary like '%%%s%%' or ssn like '%%%s%%' or tel like '%%%s%%' or tn like '%%%s%%'",map.get("search"),map.get("search"),map.get("search"),map.get("search"),map.get("search"),map.get("search"));	
				where = String.format("where delflag = 0 and name like '%%%s%%' or jikwi like '%%%s%%' or salary like '%%%s%%' or ssn like '%%%s%%' or tel like '%%%s%%' or tn like '%%%s%%'",map.get("search"),map.get("search"),map.get("search"),map.get("search"),map.get("search"),map.get("search"));	
				
			} else {
				where = "where delflag = 0";
			}
			
			String sql = String.format("select count(*) as cnt from vwemployeeinfo %s",where);//현재 해당 조건을 만족하는 데이터의 행이 몇개인지 받아오는 작업을 수행함.
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}
	
	//직원을 추가해준다.
	public void empadd(AdminEmployeeDTO dto) {
		
		try {
			
			//String sql = String.format("insert into tblEmployee values (employeeSeq.nextVal,%s,%s,%s,%s,%s,%s,0)",dto.getName(),dto.getJikwi(),dto.getSalary(),dto.getSsn(),dto.getTel(),dto.getBuseo());
			//String sql = "insert into tblEmployee values (employeeSeq.nextVal,'김옥녀','대리','4500000','860123-1057987','010-7894-1246',4,0)"; 
			String sql = "insert into tblEmployee values (employeeSeq.nextVal,?,?,?,?,?,?,0)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getJikwi());
			pstat.setString(3, dto.getSalary());
			pstat.setString(4, dto.getSsn());
			pstat.setString(5, dto.getTel());
			pstat.setString(6, dto.getBuseo());
			
			pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
						
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void empdel(String[] list) {
		
		
		try {
			
			for (int i = 0; i < list.length; i++) {
				//String sql = "delete from tblEmployee where seq = ?";//delete 하면 안된다.
				String sql = "update tblEmployee set delflag = 1 where seq = ?";//delflag 를 1로만들어서 퇴사처리를 하면 된다!.
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, list[i]);
				
				pstat.executeUpdate();
				
			}
			
			pstat.close();
			conn.close();
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public AdminEmployeeDTO editObj(String editnumber) {
		
		try {
			
			AdminEmployeeDTO dto = new AdminEmployeeDTO();//dto 객체 새롭게 생성.
			
			String sql = "select * from tblEmployee where seq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, editnumber);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setJikwi(rs.getString("jikwi"));
				dto.setSalary(rs.getString("salary"));
				dto.setSsn(rs.getString("ssn"));
				dto.setTel(rs.getString("tel"));
				dto.setBuseo(rs.getString("buseoseq"));
			}
			
			rs.close();
			pstat.close();
			conn.close();
			
			return dto;
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	public void empedit(AdminEmployeeDTO dto) {
		
		//여기서 수정 처리를 시켜준다.
		try {
			
			String sql = "update tblEmployee set name = ?,jikwi = ?,salary = ?,ssn = ?,tel = ?,buseoseq = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(7, dto.getSeq());
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getJikwi());
			pstat.setString(3, dto.getSalary());
			pstat.setString(4, dto.getSsn());
			pstat.setString(5, dto.getTel());
			pstat.setString(6, dto.getBuseo());
			
			
			rs = pstat.executeQuery();
			
			
			rs.close();
			pstat.close();
			conn.close();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
