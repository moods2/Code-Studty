package com.test.spring;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyBatisDAO {

	@Autowired
	private SqlSessionTemplate template; //MyBatis -> Statement + ResultSet

	public void m1() {
		
		//stat.executeUpdate()
		// - template.insert();
		// - template.update();
		// - template.delete();
		
		//stat.executeQuery();
		// - template.select();
				
		//test.m1
		// -> 매퍼에 있는 쿼리들 중 네임스페이스가 test이고 id가 m1인 쿼리를 찾아서 호출해라
		template.insert("test.m1");
		
	}

	public int m2(String seq) {
		
		return template.update("test.m2", seq);
	}

	public int m3(HashMap<String, String> map) {
		
		return template.insert("test.m3", map);
	}

	public int m4(MyBatisDTO dto) {
		
		return template.insert("test.m4", dto);
	}

	public String m5() {
		
		//결과 테이블의 레코드 개수에 따라
		// - template.selectOne() : 1개
		// - template.selectList() : 1개 이상
		
		return template.selectOne("test.m5");
	}

	public MyBatisDTO m6(String seq) {
		
		//결과 테이블의 레코드 개수에 따라
		// - template.selectOne() : 1개
		// - template.selectList() : 1개 이상
		
		return template.selectOne("test.m6", seq);
	}

	public List<String> m7() {
		
		//결과 테이블의 레코드 개수에 따라
		// - template.selectOne() : 1개
		// - template.selectList() : 1개 이상
		
		return template.selectList("test.m7");
	}

	public List<MyBatisDTO> m8() {
		
		return null;
	}
	
}
























