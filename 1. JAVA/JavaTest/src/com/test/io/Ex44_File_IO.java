package com.test.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class Ex44_File_IO {
	
	public static void main(String[] args) throws Exception {
		
		
		/*
		
		파일 입출력
		- 자바 프로그램 <-> (데이터) <-> 외부 공간(HDD, SSD)
		- 콘솔 입출력 방식과 유사
		
		1. 텍스트 입출력(수업)
		- 문자(열) 읽기/쓰기
		- 메모장 등	
		- "ABC" -> (변환) -> 10010100100100100100110011101101001
		
		2. 바이너리 입출력
		- 바이너리 데이터(이진 데이터) 읽기/쓰기
		- 비텍스트 데이터, 이미지, 동영상, 음악 파일, 압출 파일, 실행 파일 등..
		- 음악파일.mp3 -> (변환) -> 0100111011010010010010010010101001010
		
		
		"ABC" -> (변환) -> 10010100100100100100110011101101001
				
		인코딩, Encoding
		- 문자 코드를 부호화(0,1) 하는 작업
		- 내보내기(쓰기)
		
		디코딩, Decoding
		- 부호 데이터를 문자 코드로 변환하는 작업(복호화)
		- 가져오기(읽기)
		
		인코딩/디코딩 규칙
		1. ISO-8859-1
		2. EUC-KR
		3. ANSI
		4. UTF-8
		5. UTF-16
		6. MS949
		
		ANSI(ISO-8859-1, EUC-KR, MS949) : 서로 호환(같은 동작)
		1. 영어 : 1byte
		2. 한글 : 2byte
		
		UTF-8
		1. 영어 : 1byte
		2. 한글 : 3byte
		
		UTF-16
		1. 영어 : 2byte
		2. 한글 : 2byte
		
		
		*/
		
//		m1();
//		m2();
//		m3();
//		m4();
//		m5();
//		m6();
//		m7();
//		m8();
//		m9();
		m10();
		
		
	}

	private static void m10() throws Exception {
		
		//스트림 특징 : 읽기 작업 > 한번 읽은 내용을 다시 읽을 수 없다. > 다시 읽을 수 있게끔 수정하기
		//파일의 내용 -> 배열 복사 : 라인 단위
		//순수배열 < 컬렉션 선택
		
		File file = new File("D:\\class\\java\\io\\color.txt");
		
		if (file.exists()) {
			
			ArrayList<String> list = new ArrayList<String>(); //임시 저장소(파일 대신)
			
			BufferedReader reader = new BufferedReader(new FileReader(file));
			
			//파일 -> 컬렉션
			String line = null;
			
			while ((line = reader.readLine()) != null) {
				
				list.add(line); //*****
				
			}
			
			reader.close();
			
			System.out.println(list.size() + "줄");
			
			for (String color : list) {
				System.out.println(color);				
			}
			
			for (String color : list) {
				System.out.println(color);				
			}
		
		} else {
			System.out.println("파일 없음");
		}
		
	
	}

	private static void m9() throws Exception {
		
		//스트림 특징 : 읽기 작업 > 한번 읽은 내용은 다시 읽을 수 없다.
		
		File file = new File("D:\\class\\java\\io\\color.txt");
		
		if (file.exists()) {
			
			BufferedReader reader = new BufferedReader(new FileReader(file));
			
			String color = reader.readLine();
			System.out.println(color);
			
			color = reader.readLine();
			System.out.println(color);
			
			color = reader.readLine();
			System.out.println(color);
			
			//이전 내용을 다시 읽으려면? > 스트림을 다시 열어야 한다.
			
			reader = new BufferedReader(new FileReader(file));
			
			color = reader.readLine();
			System.out.println(color);
			
			reader.close();
		
		} else {
			System.out.println("파일 없음");
		}
		
		
		
	}

	private static void m8() throws Exception {
		
		BufferedReader reader = new BufferedReader(new FileReader
				("D:\\class\\Java\\JavaTest\\src\\com\\test\\collection\\MyHashMap.java"));
		
		String line = null;
		int num = 1;
		
		while ((line = reader.readLine()) != null) {
			
			System.out.printf("%3d: %s\r\n", num, line);
			num++;
			
		}
		
		reader.close();
		
		
	}

	private static void m7() throws Exception {
		
		//FileOutputStream, FileInputStream : 파일 입출력
		//FileWriter, FileReader : 파일 입출력
		//BufferedWriter, BufferedReader : 범용 입출력(파일, 키보드, 메모리, 네트워크 등..)
		
		//읽기
//		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		BufferedReader reader = new BufferedReader
				(new FileReader("D:\\class\\java\\io\\data3.txt"));
		
		String line = reader.readLine(); //키보드 입력 -> 텍스트파일 내용
		System.out.println(line);
		
		line = reader.readLine();
		System.out.println(line);
		
		line = reader.readLine();
		System.out.println(line);
		
		line = reader.readLine(); //아무것도 없으면 null값 반환
		System.out.println(line);
		
		reader.close();
		
			
	}

	private static void m6() throws Exception {
		
		//쓰기
		BufferedWriter writer = new BufferedWriter(new FileWriter("D:\\class\\java\\io\\data3.txt"));
		
		writer.write("문자열입니다.");
		writer.write("홍길동입니다.");
		writer.newLine();
		writer.write("\r\n");
		writer.write("안녕~");
		
		writer.close();
		
		System.out.println("완료");
		
		
	}

	private static void m5() throws Exception {
		
		//FileOutputStream
		//FileInputStream
		
		//쓰기
		// - FileWriter : 문자 단위 쓰기
		//읽기
		// - FileReader : 문자 단위 읽기
		
		FileReader reader = new FileReader("D:\\class\\java\\io\\할일.txt");
		
		int code = reader.read();
		System.out.println((char)code);
		
		code = -1;
		
		while ((code = reader.read()) != -1) {
			
			System.out.print((char)code);
			
		}
		
		reader.close();
	
		
	}

	private static void m4() throws Exception {
		
		//콘솔 입력 -> 파일 출력
		
		Scanner scan = new Scanner(System.in); //입력 도구
		System.out.print("파일명 : ");
		String filename = scan.nextLine();
		
		FileWriter writer = new FileWriter("D:\\class\\java\\io\\" + filename);
		
		while (true) {
			
			String line = scan.nextLine(); //입력
			
			if (line.equals("q")) {
				break;
			}
			
			writer.write(line + "\r\n"); //출력(쓰기)
						
		}
		
		writer.close();
		scan.close(); //안닫아도 문제는 X
		
		System.out.println("파일 저장 완료");
		
		
	}

	private static void m3() throws Exception {
		
		//쓰기
		// - 문자 단위 쓰기(2byte)
		// - 모든 문자를 쓰기가 가능하다.(한글 포함)
		// - FileOutputStream > FileWriter
		
		FileWriter writer = new FileWriter("D:\\class\\java\\io\\data2.txt");
		
		writer.write(65);
		writer.write("A");
		writer.write("ABCDEF");
		writer.write("홍길동");
		
		writer.close();
		
		//스트림 닫으면 입출력이 불가능하다. > 스트림 다시 열어야 한다.
		writer = new FileWriter("D:\\class\\java\\io\\data2.txt");
		writer.write("아무개");
		writer.close(); //안하면 저장안됨
		
		System.out.println("완료");	
		
		
	}

	private static void m2() throws Exception {
		
		//읽기
		// - 바이트 단위 읽기
		// - System.in.read() 유사
		
		//읽기 전용 스트림 객체 생성하기
		File file = new File("D:\\class\\java\\io\\datat.txt");
		FileInputStream stream = new FileInputStream(file);
		
//		int code = stream.read();
//		System.out.println(code);
//		
//		code = stream.read();
//		System.out.println(code);
//		
//		code = stream.read();
//		System.out.println(code);
		
		
		//읽기 스트림 도구 stream.read() 메소드 > 더 이상 읽을게 없으면 -1 반환
			int code = -1;
			
			while ((code = stream.read()) != -1) {
				System.out.print((char)code);
			}
			
			stream.close();
		
	}

	private static void m1() throws Exception {
		
		//쓰기
		// - 바이트 단위 쓰기
		// - 1바이트씩 저장 > 2바이트 문자 저장 불가능 > ASCII 문자 저장(영어, 숫자, 특수문자)
		
		//파일에 데이터 저장하기
		//1. 스트림 객체 생성하기
		//2. 스트림 객체 사용하기
		//3. 스트림 객체 닫기
		
		//FileOutputStream
		// - 쓰기 전용 스트림
		// - 스트림 열기 모드
		// a. 생성 모드, Create Mode
		//		- 기본 방식
		//		- 파일이 없으면 새로 만든다.
		//		- 무조건 덮어쓰기를 한다.
		// b. 추가 모드, Append Mode
		//		- 선택 방식
		//		- 파일이 없으면 새로 만든다.
		
		
		//1.
		File file = new File("D:\\class\\java\\io\\datat.txt");
		FileOutputStream stream = new FileOutputStream(file, true);
		//기본값 flase : 덮어쓰기(Create Mode)
		//true로 전환 시 : 이어쓰기(Append Mode)
		
		//2.
		stream.write('\r'); // 'a' > 95
		stream.write('\n');
		
		stream.write('J');
		stream.write('a');
		stream.write('v');
		stream.write('a'); //String은 안됨 (char만 가능)
		
		String str = "Hello~ Hong~ 홍길동";
				
		for (int i=0; i<str.length(); i++) {
			stream.write(str.charAt(i));			
		}
		
				
		//3.
		stream.close();
		
		System.out.println("완료");
		
	}

}
