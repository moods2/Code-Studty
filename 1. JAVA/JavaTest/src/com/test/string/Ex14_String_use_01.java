package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_use_01 {
	
	public static void main(String[] args) throws Exception {
		
//		m1();
//		m2();
//		m3();
//		m4();
		m5();
//		m6();
//		m7();
//		m8();
//		m9();
		
	}

	private static void m9() {
		
		String jumin = "950420-2087456";
		
		//남자? 여자?
		System.out.println(jumin.charAt(7) == '1' ? "남자" : "여자");
		System.out.println(jumin.indexOf("1") == 7 ? "남자" : "여자"); //비권장
		System.out.println(jumin.substring(7,8).contentEquals("1") ? "남자" : "여자"); //권장
		
		//생년?
		System.out.println(jumin.substring(0, 2));
		System.out.println(jumin.substring(2, 4));
		System.out.println(jumin.substring(4, 6));
		
		
		//일부 내용 추출
		//D:\class\java\JavaTest\src\Hello.java
		String path = "D\\class\\java\\JavaTest\\src\\Hello.java";
		
		//1. 파일명 추출 -> Hello.java
		int index = path.lastIndexOf("\\");
//		System.out.println(index);
		String name = path.substring(index+1);
		System.out.println(name);
		
		//2. 확장자 추출 -> .java
		// = He.llo.java
		index = name.lastIndexOf(".");
		String ext = name.substring(index);
		System.out.println(ext);
		
		//3. 확장자 뺀 파일명
		String filenameWithoutExt = name.substring(0, index);
		System.out.println(filenameWithoutExt);
		
		
		
		
	}

	private static void m8() {
		
		//파일명 -> dog.jpg
		// - 이미지? 동영상? 문서?
		// - 이미지(jpg, gif, png)
		// - 동영상(mp4)
		// - 문서(hwp, doc)
		String filename = "dog.JPG";
		
		if (filename.toLowerCase().indexOf(".jpg") == filename.length() - 4
				|| filename.toLowerCase().indexOf(".gif") == filename.length() - 4
				|| filename.toLowerCase().indexOf(".png") == filename.length() - 4) {
			System.out.println("이미지 파일");
			
		} else if (filename.toLowerCase().indexOf(".mp4") == filename.length() - 4) {
			System.out.println("동영상 파일");

		} else if (filename.toLowerCase().indexOf(".hwp") == filename.length() - 4
				|| filename.toLowerCase().indexOf(".doc") == filename.length() - 4) {
			System.out.println("문서 파일");
		}
		
		if (filename.toLowerCase().endsWith(".jpg")
				|| filename.toLowerCase().endsWith(".gif")
				|| filename.toLowerCase().endsWith(".png")) {
			System.out.println("이미지 파일");
			
		}
		
		
	}

	private static void m7() {
		
		//java -> 8종류 자바 동일 취급
		//System.out.println("JAVA".equals("java"));
		
		String word1 = "Java";
		String word2 = "JAVA";
		String word3 = "java";
		
		System.out.println(word1.equals(word2));
		
		//메소드 체인
		System.out.println(word1.toUpperCase().equals(word2.toUpperCase()));
		
		String txt = "안녕하세요. 저는 Java를 공부합니다.";
		String word = "java";
		
//		if (txt.indexOf(word) > -1) { //검색률 낮음, 정밀도 높음
		if (txt.toLowerCase().indexOf(word.toLowerCase()) > -1) { //검색률 높음, 정밀도 낮음
			System.out.println("O");
		} else {
			System.out.println("X");
		}
		
		
		
	}

	private static void m6() {
		
		//검색어 모두 찾기!!
		String txt = "안녕홍길동하세요. 홍길동입니다. 반갑홍길동습니홍길동다. 홍길동입니다. 다시 홍길동입니홍길동다.";
		String word = "홍길동";
		int index = -1;
		
//		index = txt.indexOf(word);
//		
//		if (index > -1) {
//			System.out.printf("%d번 위치에서 발견\n", index);
//			
//		}
//		
//		index = txt.indexOf(word, index + word.length());
//		
//		if (index > -1) {
//			System.out.printf("%d번 위치에서 발견\n", index);
//			
//		}
		
		index = -word.length();
		//word = "홍길동" -> length() -> 3
		while (true) {
			
			index = txt.indexOf(word, index + word.length());
			
			if (index > -1) {
				System.out.printf("%d번 위치에서 발견\n", index);
				
			} else {
				break;
			}
			
		}
		
		
	}

	private static void m5() throws Exception {
		
		//게시판 글쓰기
		// - 관리자 모드 : 금지어 설정
		
		String content = "안녕하세요. 방금 가입했습니다~ 바보야!!!";
		
		//금지어
		String word = "바보";
		
		if (content.indexOf(word) == -1) {
			System.out.println("글쓰기 진행..");			
		} else {
			System.out.println("금지어 사용 불가!!!");
		}
		
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		//for -> 횟수가 고정
		//while -> 횟수가 가변
		
		while (true) {
			
			System.out.print("내용 : ");
			content = reader.readLine();
			
			if (content.indexOf(word) == -1) {
				break;			
			} else {
				System.out.println("금지어가 발견되었습니다!!!");
			}
			
		}//while
		System.out.println("글쓰기 진행..");
		
	}

	private static void m4() {
		
		//문자열 검색
		// - 문자열 내에서 원하는 문자(문자열) 검색 -> 발견한 위치 반환
		// - int indexOf(char c)
		// - int indexOf(String s) ** 자주 사용
		// - int indexOf(char c, int index)
		// - int indexOf(String s, int index)
		
		String txt = "안녕하세요. 홍길동입니다. 반갑습니다. 홍길동입니다.";
		
		int index = txt.indexOf('홍');
		System.out.println(index);
		
		index = txt.indexOf("홍");
		System.out.println(index);
		
		index = txt.indexOf("홍길동");
		System.out.println(index);
		
		index = txt.indexOf("아무개"); //있으면 자릿수 없으면 음수 반환
		System.out.println(index);
		
		if (txt.indexOf("홍길동") > -1) {
			System.out.println("발견O");
		} else {
			System.out.println("없음;;;");
		}
		
		
		index = txt.indexOf("홍길동");
		System.out.println(index);
		
		index = txt.indexOf("홍길동", 10);
		System.out.println(index);
		
	}

	private static void m3() {
		
		//문자열 공백 제거
		// - String trim()
		String txt = "     하나     둘     셋     ";
		
		System.out.printf("[%s]\n", txt);
		System.out.printf("[%s]\n", txt.trim());
		
		
	}

	private static void m2() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		//유효성 검사
		// - 문자열 길이
		System.out.print("이름(2자~5자이내) : ");
		
		String name = reader.readLine();
		
		if(name.length() >= 2 && name.length() <= 5) {
			//통과
			System.out.println("회원 가입 완료!!");
		} else {
			//거절
			System.out.println("이름은 2~5자 이내로 입력하세요.");
		}
		
	}

	private static void m1() throws Exception {
		
		String txt = "안녕하세요. 홍길동입니다.";
		System.out.println(txt.length());
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("문장 : ");
		txt = reader.readLine();
		System.out.println(txt.length());
		
	}

}
