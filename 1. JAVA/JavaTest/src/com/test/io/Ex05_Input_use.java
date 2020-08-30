package com.test.io;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex05_Input_use {
	
	public static void main(String[] args) throws Exception {
		
		//BufferedReader : 자료형
		//reader : 추상 클래스
		//InputStreamReader : reader를 상속받는 하위 클래스
		//System.in : 키보드로 입력한 값
		/*
		   키보드에서 입력한 문자열은 키보드 버퍼에 정보를 저장해 두었다가 사용자가 입력을 마치면 문자열이 JVM에 전달되고 전달된 문자는 다시
		   System.in인 InputStream 객체로 저장된다. 다시 이는 InputStreamReader 객체를 생성하는데 사용되고 이어서
		   BufferedReader 클래스로 부터 객체를 생성하는데 사용되어 진다. BufferedReader 클래스에는 버퍼가 있기 때문에
		   문자열을 버퍼에 저장해 놓았다가 readLine() 메소드를 통해 한 줄을 한번에 읽어 들이게 되는 것이다.
		 */
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		//요구사항] 태어난 년도를 입력받아 나이를 출력하시오.
		//입력] 태어난 년도(ex.1995) : 1995
		//출력] 당신은 26세입니다.
		
//		System.out.print("태어난 년도: ");
//		
//		String year = reader.readLine();
		
		//2020 - year
		//2020 - "1995"
		//2020 - "자바코딩"
		
		//문자열 -> int
//		int year2 = Integer.parseInt(year);
//		
//		System.out.printf("당신은 %d세 입니다.", 2020 - year2);
//		
//		System.out.println();

		
		//"10" -> 10
		//"문자열" -> int : Integer.parseInt("문자열")
		//"문자열" -> byte : Byte.parseByte("문자열")
		//"문자열" -> short : Short.parseShort("문자열")
		//"문자열" -> long : Long.parseLong("문자열")
		//"문자열" -> float : Float.parseFloat("문자열")
		//"문자열" -> double : Double.parseDouble("문자열")
		//"true" -> boolean : Boolean.parseBoolean("문자열")
		
		
		//요구사항] 숫자 2개 입력받아서 + 연산과정과 결과를 출력하시오.
		//입력] 첫번째 숫자 : 5
		//		두번째 숫자 : 3
		//출력] 5 + 3 = 8
		
//		System.out.print("첫번째 숫자 : ");
//		
//		String num1 = reader.readLine(); //5 -> "5"
//		
//		System.out.print("두번째 숫자 : ");
//		
//		String num2 = reader.readLine();
//		
//		int realNum1 = Integer.parseInt(num1);
//		
//		int realNum2 = Integer.parseInt(num2);
//		
//		System.out.printf("%,d + %,d = %,d\n"
//									, realNum1
//									, realNum2
//									, realNum1 + realNum2);
		
		
		
		//클래스.메소드("")
		//Byte.parseByte("")
		//Integer.parseInt("")
		
		
		//유틸 클래스, 래퍼(Wrapper) 클래스
		//byte -> Byte
		//short -> Short
		
		//byte : -128 ~ 127
		//long : -? ~ ?
		System.out.println(Long.MIN_VALUE);
		System.out.println(Long.MAX_VALUE);
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Byte.MAX_VALUE);
		
		System.out.println(Long.SIZE);
		System.out.println(Float.SIZE);
		
		
		
		
		
	}

}
