package com.test.spring;

import lombok.Data;

//Lombok 기능
// - 우리가 클래스를 정의할 때 자주 하는 행동들을 대신 해주는 기능
// - @Data : 3개 합쳐놓은거 
// - @Getter : getter를 자동으로 생성
// - @Setter : setter를 자동으로 생성
// - @ToString : toString() 오버라이딩(덤프)
@Data
public class MemoDTO {

	//권장 사항
	// - DB 테이블의 컬럼명 == DTO 멤버 변수명 == HTML 태그의 name 
	
	private String seq;
	private String name;
	private String memo;
	private String regdate;
	
}
