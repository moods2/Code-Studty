package com.test.spring;

import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

//@Autowired에 의해서 객체를 생성하겠습니다. -자격 부여
//@Repository - 데이터 저장소
@Repository 
public class MemoDAO implements IMemo{
	
	//JDBC -> Spring JDBC 사용
	
	private DriverManagerDataSource dataSource; //Connection 역할
	private JdbcTemplate template; //Statement + ResultSet 역할
	
	public MemoDAO() {
		//DB 연결
		this.dataSource = new DriverManagerDataSource();
		this.dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		this.dataSource.setUrl("jdbc:oracle:thin:@yoginolja.ccyezlxmksh2.ap-northeast-2.rds.amazonaws.com:1521:orcl");
		this.dataSource.setUsername("yoginolja");
		this.dataSource.setPassword("1234");
		
		//template 생성
		this.template = new JdbcTemplate(this.dataSource);
		
//		try {
//			System.out.println(this.dataSource.getConnection().isClosed());
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}

	@Override
	public int add(MemoDTO dto) {

		//Spring JDBC 방식 -> PreparedStatement 방식 + 업그레이드
		String sql = "insert into tblMemo (seq, name, memo, regdate) values (seqMemo.nextVal, ?, ?, default)";
		
		//SQL 실행
		//stat.executeUpdate() -> template.update()
		//stat.executeQuery() -> template.query()
		
//		Object[] args = new Object[2];
//		args[0] = dto.getName();
//		args[1] = dto.getMemo();
//		
//		int result = this.template.update(sql,args);
//		
//		return result;
		
		return this.template.update(sql, new Object[] {dto.getName(), dto.getMemo() });
	}

	@Override
	public List<MemoDTO> list() {
		
		//메모 목록보기
		String sql = "select * from tblMemo order by seq desc";
		
		//기존 방식
		//1. Statement -> executeQuery()
		//2. ResultSet -> While (rs.next()) -> List<MemoDTO> + MemoDTO + setXXX(rs.getXXX)
		
		//BeanPropertyRowMapper
		//BeanProperty + Row + Mapper
		// -> Bean : 자바 객체(인스턴스) -> MemoDTO
		// -> Property : setter, getter
		// -> Row : DB 레코드
		// -> Mapper : 연결시켜주는 작업
		
		
		return this.template.query(sql, new BeanPropertyRowMapper<MemoDTO>(MemoDTO.class));
		
	}

	@Override
	public int edit(MemoDTO dto) {

		String sql =  "update tblMemo set name = ?, memo = ? where seq = ?";
		
		return this.template.update(sql, new Object[] {dto.getName(), dto.getMemo(), dto.getSeq()});
	}

	@Override
	public int del(String seq) {
		
		String sql = "delete from tblMemo where seq = ?";
		
			
		return this.template.update(sql, new Object[] {seq});
		
	}

	@Override
	public MemoDTO get(String seq) {
		
		String sql = "select * from tblMemo where seq = ?";
		
		//Spring JDBC
		//1. 인자값 -> new Object[]
		//2. 반환값
		//	a. query() -> List<DTO> 반환
		//	b. queryForObject() -> DTO 반환
		//	c. queryForInt() -> 정수 1개 반환
		
		return this.template.queryForObject(sql, new Object[] {seq}, new BeanPropertyRowMapper<MemoDTO>(MemoDTO.class));
	}
	
	

}
