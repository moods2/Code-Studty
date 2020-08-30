package com.test.exception;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import com.test.object.User;

public class Ex50_Exception_basic {
	
	public static void main(String[] args) {
		
		//예외 처리, Exception Handling
		// - 예외(Exception)
		// - 예외를 미리 예측해서 사전에 방지(대응)하는 코드 작성 행동
		// 1. 전통적인 방식
		// 2. 전용 도구
		
		
//		m1();
//		m2();
//		m3();
//		m4();
		
//		try {
//			m5();
//			m6();
//		} catch (Exception e) {
//			System.out.println("갑쪽에서 처리함");
//		}
		
//		m5();
		
		m7();
		
		
	}
	
	private static void m7() {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		try {
			reader.readLine();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Scanner scan = new Scanner(System.in);
		scan.nextLine(); //내부에 try 직접 구현		
		
	}

	private static void m6() throws Exception {

		//예외 미루기
		int num = 0;
		
		
		System.out.println(100 / num);
	
	}

	private static void m5() throws Exception {
		
		//예외 미루기
		int num = 0;
		
		
		System.out.println(100 / num);		
		
	}

	private static void m4() {
		
		//숫자 입력 -> 짝수만 사용, 홀수는 에러
		
		int num = 1;
		
		if (num % 2 ==0) {
			System.out.println("업무 진행");
		} else {
			System.out.println("오류 발생 - 최대리 연락");
		}
				
		
		try {
			
			if (num % 2 == 1) {
				//강제 예외 발생
				throw new Exception(); //예외 던지기 (***)
			}
			
			System.out.println("업무 진행");			
		} catch (Exception e) {			
			System.out.println("오류 발생 - 최대리 연락");			
		}
	
	}

	private static void m3() {
		
		try {
			
			//업무 A.
			int num = 10;
			System.out.println(100 / num); //new ArithmeticException()
			
			//업무 B.
			int[] nums = new int[3];
			System.out.println(nums[0]); //new ArrayIndexOutOfBoundsException()
			
			//업무 C.
			User user = new User(); //com.test.object.User
			System.out.println(user.getName()); //new NullPointerException()
			
			//업무 D.
			String str = "홍길동";
			System.out.println(str.charAt(5)); //new StringIndexOutOfBoundException()
			
		} catch (ArithmeticException e) {
			System.out.println("산술 연산 오류 - 박과장 연락");
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("배열 첨자 오류 - 김부장 연락");
		} catch (NullPointerException e) {
			System.out.println("널 참조 오류 - 최대리 연락");
		} catch (Exception e) {
			System.out.println("나머지 오류 - 정사원 연락");
		}
		
		
		
	}
	
	private static void m2() {
		
		try {
			//업무 A.
			int num = 0;
			System.out.println(100 / num);
		} catch (Exception e) {
			System.out.println("박과장 연락");
		}
		
		try {
			//업무 B.
			int[] nums = new int[3];
			System.out.println(nums[5]);
		} catch (Exception e) {
			System.out.println("김부장 연락");
		}
		
		try {
			//업무 C.
			User user = null; //com.test.object.User
			System.out.println(user.getName());
		} catch (Exception e) {
			System.out.println("최대리 연락");
		}
		
		
	}

	private static void m1() {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("숫자 : ");
		int num = scan.nextInt();
		
		
		if (num != 0) { //예외 조건
			//42억분의 1 -> 0
			//업무 코드, 비즈니스 코드
			System.out.printf("100 / %d = %d\n", num, 100 / num);
		} else {
			//예외 처리 코드
			System.out.println("0을 입력하면 안됩니다.");
		}
		
		//안좋은 코드
		if (num == 0) { //예외 조건
			//42억분의 1 -> 0
			System.out.println("0을 입력하면 안됩니다.");
		} else {
			System.out.printf("100 / %d = %d\n", num, 100 / num);
		}
		
		//try : 비즈니스 코드 블럭
		//catch : 예외 처리 코드 블럭
		try {			
			System.out.printf("100 / %d = %d\n", num, 100 / num);
			System.out.println("업무 완료");
		} catch (Exception e) {			
			System.out.println("0을 입력하면 안됩니다.");
			System.out.println(e.getMessage());
			System.out.println(e.getStackTrace());
			System.out.println(e.toString());
		}
		
	}

}

