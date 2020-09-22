package com.test.spring;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//객체간의 관계
//Controller <-> ISerivce(Service) <-> DAO <-> MyBatis(JDBC) <-> Oracle
//		     DTO                   DTO     DTO

@Controller
public class MyBatisController {

	//의존 객체를 Autowired를 이용해서 의존 주입한다.(객체를 만들어서 넣어준다.)
	@Autowired
	private IMyBatisService service;
	
	//http://localhost:8090/spring/m1.action
	
	@RequestMapping(value = "/m1.action", method = { RequestMethod.GET })
	public String m1(HttpServletRequest request, HttpServletResponse response) {

		//반환값X, 인자값X -> 정적 쿼리
		service.m1();
		
		return "result";
	}
	
	
	@RequestMapping(value = "/m2.action", method = { RequestMethod.GET })
	public String m2(HttpServletRequest request, HttpServletResponse response) {

		//반환값X, 인자값O(단일값)
		String seq = "1"; //m2.action?seq=1
		
		int result = service.m2(seq);
		
		request.setAttribute("result", result);
		
		return "result";
	}
	
	
	@RequestMapping(value = "/m3.action", method = { RequestMethod.GET })
	public String m3(HttpServletRequest request, HttpServletResponse response, 
						String name, String age, String etc) {

		//반환값X, 인자값O(다중값 -> name, age, etc)
		
		//인자값 -> 다중값 -> HashMap or DTO(VO)
		
		//m3.action?name=홍길동&age=20&etc=테스트용
		//m3.action?name=하하하&age=25&etc=추가계정
		//m3.action?name=호호호&age=27&etc=신입사원
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("age", age);
		map.put("etc", etc);
		
		int result = service.m3(map);
		
		request.setAttribute("result", result);

		return "result";
	}
	
	
	@RequestMapping(value = "/m4.action", method = { RequestMethod.GET })
	public String m4(HttpServletRequest request, HttpServletResponse response, MyBatisDTO dto) {

		//반환값X, 인자값O(다중값)
		//m4.action?name=홍길동&age=20&etc=테스트용
		//m4.action?name=아무개&age=23&etc=테스트용
		
		//HashMap -> DTO
		
		int result = service.m4(dto);
		
		request.setAttribute("result", result);

		return "result";
	}
	
	@RequestMapping(value = "/m5.action", method = { RequestMethod.GET })
	public String m5(HttpServletRequest request, HttpServletResponse response) {

		//반환값O
		//1. 단일값 반환 : 단일 레코드 + 단일 컬럼 : int or double or String
		//2. 다중값 반환 : 단일 레코드 + 다중 컬럼 : DTO
		//3. 다중값 반환 : 다중 레코드 + 단일 컬럼 : List<String>
		//4. 다중값 반환 : 다중 레코드 + 다중 컬럼 : List<DTO>
		
		String name = service.m5();
		
		request.setAttribute("name", name);

		return "result";
	}
	
	
	@RequestMapping(value = "/m6.action", method = { RequestMethod.GET })
	public String m6(HttpServletRequest request, HttpServletResponse response, String seq) {

		//번호 -> 정보 반환
		//m6.action?seq=1
		
		MyBatisDTO dto = service.m6(seq);
		
		request.setAttribute("dto", dto);		

		return "result";
	}
	
	
	@RequestMapping(value = "/m7.action", method = { RequestMethod.GET })
	public String m7(HttpServletRequest request, HttpServletResponse response) {

		//이름 목록 가져오기
		List<String> names = service.m7();
		
		request.setAttribute("names", names);

		return "result";
	}
	
	
	@RequestMapping(value = "/m8.action", method = { RequestMethod.GET })
	public String m8(HttpServletRequest request, HttpServletResponse response) {

		//다중 레코드 + 다중 컬럼
		List<MyBatisDTO> list = service.m8();
		
		request.setAttribute("list", list);

		return "result";
	}
	
}
















