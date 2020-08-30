package com.test.io;

import java.io.File;
import java.util.Date;

public class Ex42_File_basic {
	
	public static void main(String[] args) {
		
		//파일 정보 확인 -> 파일 조작
		//디렉토리 정보 확인 -> 디렉토리 조작
		
		m1();
//		m2();
//		m3();
//		m4();
		
		
	}

	private static void m4() {
		
		//파일 삭제하기
		String path = "D:\\class\\Java\\io\\AAA\\data.txt";
		
		File file = new File(path);
		
		if(file.exists()) {
			
			boolean result = file.delete();
			
			System.out.println("파일 삭제 완료");
			
			
		} else {
			System.out.println("파일 없음");
		}
		
	}

	private static void m3() {
		
		//파일 이동하기
		// AAA > data.txt -> BBB
		String path = "D:\\class\\Java\\io\\AAA\\data.txt";
		
		File file = new File(path);
		
		if(file.exists()) {
			
			String path2 = "D:\\class\\Java\\io\\BBB\\hong.txt";
			
			File file2 = new File(path2);
			
			file.renameTo(file2);
			
			System.out.println("파일 이동 완료");
			
			
		} else {
			System.out.println("파일 없음");
		}
		
	}

	private static void m2() {
		
		//파일 조작하기
		// - 생성(X), 복사(X), 이동, 파일명 수정, 삭제
		
		// - 파일 객체 참조 -> 조작
		
		// - io\AAA 폴더 > hong.txt
		// - io\BBB 폴더
		
		//파일명 수정하기
		//hong.txt -> date.txt
		String path = "D:\\class\\Java\\io\\AAA\\data.txt"; //아무개
		
		File file = new File(path); //원본 객체
		
		if(file.exists()) {
			
			String path2 = "D:\\class\\Java\\io\\AAA\\hong.txt"; //홍길동
			
			File file2 = new File(path2);
			
			file.renameTo(file2);
			
			System.out.println("파일명 수정 완료");
			
			
		} else {
			System.out.println("파일 없음");
		}

		
	}

	private static void m1() {
		
		//파일 접근 -> 정보 확인
		//파일 참조 객체(클래스)
		
		
		String path = "D:\\class\\Java\\io\\test.txt";
		
		File file = new File(path);
		
//		System.out.println(file.exists());
		
		//예외 검사
		if (file.exists()) {
			
			//파일 정보 확인
			System.out.println(file.getName());		//test.txt 파일명
			System.out.println(file.isFile());		//true 파일이냐?
			System.out.println(file.isDirectory());	//false 폴더냐?
			System.out.println(file.length());		//16 크기(byte)
			
			System.out.println(file.getAbsolutePath());	//절대경로
			System.out.println(file.getPath());			//참조경로
			
			//------------------------------------------------------
			
			System.out.println(file.lastModified()); // 1588896349450, 틱값 (마지막으로 수정한 시간)
			System.out.println(file.canRead());
			System.out.println(file.canWrite());
			System.out.println(file.isHidden());
			
			Date date = new Date(file.lastModified());
			System.out.printf("%tF %tT\n", date, date);
	
		} else {
			System.out.println("파일이 없습니다.");
		}
		
	}

}











