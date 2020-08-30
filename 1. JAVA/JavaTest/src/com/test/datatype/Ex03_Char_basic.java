package com.test.datatype;

public class Ex03_Char_basic {

	public static void main(String[] args) {
		
		//문자형
		//특수문자 > Escape Sequence
		// - 특정한 행동을 하도록 미리 약속되어 있는 문자
		
		//1. '\n'
		// - new line
		// - 개행 문자
		// - 줄바꿈을 하시오.(=엔터)
		
		char c = '\n';
		System.out.println("하나" + c + "둘");
		System.out.println("하나\n둘");
		System.out.println("하나\n\n둘");
		
		
		//2. '\r'
		// - carriage return
		// - 캐럿의 위치를 현재 라인의 시작 위치로 이동해라(Home + Insert)
		String str = "안녕하세요.\r홍길동님";
		System.out.println(str); //홍길동님요.
		
		
		//엔터키(Return) = '\r' + '\n' = "\r\n"
		
		System.out.println("반갑습니다.\n아무개님");
		System.out.println("반갑습니다.\r아무개님");
		System.out.println("반갑습니다.\r\n아무개님");
		
		
		//3. '\t'
		// - 탭문자
		// - 탭이 뭐예요?
		//Ctrl + Shift + F : 포맷
		System.out.println("하나\t둘\t셋");		//권장
		System.out.println("하나	둘	셋");	//비권장
		
		
		//4. '\b'
		// - 백스페이스(backspace)
		System.out.println("일이\b삼사오"); // 일삼사오
		
		
		//5. \', \", \\
		//안녕하세요. "홍길동"입니다.
		System.out.println("안녕하세요. \"홍길동\"입니다.");
		System.out.println("안녕하세요. '홍길동'입니다.");
		
		
		//수업 폴더
		String path = "D:\\class\\java"; //로컬, 파일시스템
		System.out.println(path);
		
		path = "D:/class/java"; //웹 경로(URL)
		System.out.println(path);
		
		
				
		
	}
	
}
