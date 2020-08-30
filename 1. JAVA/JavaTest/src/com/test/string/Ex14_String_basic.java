package com.test.string;

public class Ex14_String_basic {
	
	public static void main(String[] args) {
		
		//문자열, String
		// - 숫자, 문자, 논리, 문자열, 날짜시간
		
		//문자열 조작 기능
		// -> 메소드 제공
		
//		m1();
//		m2();
//		m3();
//		m4();
//		m5();
//		m6();
//		m7();
//		m8();
		m9();
//		m10();
		
		
	}

	private static void m10() {
		
		//"10" -> 10
		String str = "10";
		
		System.out.println(Integer.parseInt(str));
		
		//10 -> "10"
		int num = 10;
		System.out.println(String.valueOf(num)); //숫자를 문자열로 (FM)
		System.out.println(num + ""); //10 + "" -> "10"
		System.out.println("" + num);
		
		
	}

	private static void m9() {
		
		//문자열 치환
		// - String replace(String old, String new)
		String txt = "안녕하세요. 홍길동입니다.";
		
		System.out.println(txt.replace("홍길동", "아무개"));
		System.out.println(txt); // 모든 문자열 메소드는 원본을 안건드림 (복사 -> 변경)	
		System.out.println(txt.replace("하하하", "아무개"));
		
		
		txt = "     하나     둘     셋     ";
		System.out.println(txt.replace(" ", "")); //전체 공백 삭제
		
		
	}

	private static void m8() {
		
		//문자열 검색
		// - indexOf()
		// - lastIndexOf()
		// - boolean contains(String)
		
		String txt = "안녕하세요. 홍길동입니다.";
		System.out.println(txt.contains("홍길동"));
		System.out.println(txt.indexOf("홍길동") > -1);
		System.out.println(txt.contains("아무개"));
		
		
	}

	private static void m7() {
		
		//문자열 추출
		// - char charAt(int index) : 문자 추출
		// - String substring(int start, int end) : 문자열 추출
		// 		- start : inclusive
		//		- end : exclusive
		
		String txt = "안녕하세요. 홍길동입니다.";
		
		System.out.println(txt.substring(3, 8)); //3번째부터 8번째 글자 전까지
		System.out.println(txt.substring(3, 3)); //안나옴
		System.out.println(txt.substring(3, 4)); //적어도 하나는 있어야함
		
		System.out.println(txt.substring(3)); //시작부터 끝까지
		System.out.println(txt.substring(3, txt.length()));
		
	}

	private static void m6() {
		
		//(패턴)검색
		// - boolean startsWith(String word)
		// - boolean endsWith(String word)
		
		String name = "홍길동";
		
		//'홍'씨?
		System.out.println(name.charAt(0) == '홍');
		System.out.println(name.indexOf('홍') == 0);
		System.out.println(name.startsWith("홍"));
		
		//'동'으로 끝나느냐?
		System.out.println(name.charAt(2) == '동'); //이름이 석자일때만 가능
		System.out.println(name.charAt(name.length()-1) == '동'); //좋은코드 (변화 대응)
		System.out.println(name.indexOf("동") == 2); //일반
		System.out.println(name.indexOf("동") == name.length() - 1); //좋은코드
		System.out.println(name.endsWith("동"));
		
		
		
		
	}

	private static void m5() {
		
		//대소문자 변환
		// - String toUpperCase()
		// - String toLowerCase()
		
		String txt = "Hello Hong";
		
		System.out.println(txt.toUpperCase());
		System.out.println(txt.toLowerCase());
		
	}

	private static void m4() {
		
		//사용자 > 주민등록번호 입력 > '-' 반드시 입력
		String jumin = "950420-1012345";
		
		if (jumin.charAt(6) == '-') {
			
			System.out.println("올바른 주민번호");
			
			if(jumin.charAt(7) == '1') {
				System.out.println("남자");
			} else {
				System.out.println("여자");
			}
			
		} else {
			
			System.out.println("올바르지 않은 주민번호");
			
		}
		
		
	}

	private static void m3() {
		
		String txt = "안녕하세요. 홍길동님.";
		
		for (int i=1; i<=10; i++) {} //
		for (int i=0; i<10; i++) {} // 많이 사용
		
		//모든 문자 추출(0 ~ 11)
		for (int i=0; i<txt.length(); i++) {
			char c = txt.charAt(i);
			System.out.println(c);
		
		}
		
		//아이디 입력(영어 소문자로만 구성)
		// -> 특정 문자로 구성 -> 문자 코드값 의존 -> String(x), char(o)
		String id = "홍길동";
		boolean result = false;
		
		for (int i=0; i<id.length(); i++) {
			char c = id.charAt(i);
//			System.out.println(c);
//			System.out.println((int)c);
			
//			if (c >= 'a' && c <= 'z') {
//				System.out.println("소문자 O");	
//			} else {
//				System.out.println("소문자 X");
//				break;
//			}
			
			//유효성 검사 -> 되도록 잘못된 부분을 찾는 조건을 만든다.
			
//			if (c < 'a' || c > 'z') { //소문자
			
//			if ((c < 'a' || c > 'z') && (c < 'A' || c > 'Z')) { //소문자, 대문자
			
//			if ((c < 'a' || c > 'z') 
//					&& (c < 'A' || c > 'Z') 
//					&& (c < '0' || c > '9')) { //소문자, 대문자, 숫자
			
			if (c < '가' || c > '힣') { //한글 (ㅋㅋㅋ X)
//				System.out.println("소문자 X");
				result = true;
				break;
			}
			
		}//for
		
		if (!result) {
			System.out.println("사용 가능합니다.");
		} else {
			System.out.println("사용 불가능합니다.");
		}
		System.out.println("완료");
		
	}

	private static void m2() {
		
		//문자열 추출
		// - 특정 위치의 문자를 반환
		// - char charAt(int index)
		// - Zero-based Index (자바는 보통 0부터 센다.)
		
		String txt = "안녕하세요. 홍길동님.";
		
		System.out.println(txt.charAt(0));
		System.out.println(txt.charAt(3));
		System.out.println(txt.charAt(11));
		System.out.println(txt.length());
		System.out.println(txt.charAt(txt.length()-1)); //최대 index 0 ~ length-1
		
		//java.lang.StringIndexOutOfBoundsException
//		System.out.println(txt.charAt(100));
		
	}

	private static void m1() {
		
		//문자열 길이
		// - 문자열을 구성하는 문자의 갯수
		// - int length()
		
		String txt = "Hello";
		
		System.out.println(txt.length());
		System.out.println("Bye".length());
		System.out.println("안녕하세요".length());
		
	}

}
