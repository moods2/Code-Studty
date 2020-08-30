package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_13 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("수식 입력 : ");
		String operation = reader.readLine().trim();
		String oper = "";
		int result = 0;
		
		//문자열 검색
		System.out.println(operation.indexOf('+')); // 결과가 -1이면 +가 없는거고, 결과가 0이면 앞의 피연산자가 부족, 아니면 2
		
		if (operation.indexOf('+') >= 0) { // 연산자 확인
			
			oper = "+";
			
		} else if (operation.indexOf('-') >= 0) {
			
			oper = "-";
			
		} else if (operation.indexOf('*') >= 0) {
			
			oper = "*";
			
		} else if (operation.indexOf('/') >= 0) {
			
			oper = "/";
			
		} else if (operation.indexOf('%') >= 0) {
			
			oper = "%";
			
		} else {
			
			System.out.println("연산자가 올바르지 않습니다.");
			return;
			
		}
		
		if (operation.indexOf(oper) == 0) {
			
			System.out.println("피연산자가 부족합니다.");
			return;
			
		} 
		
		int first = Integer.parseInt(operation.substring(0, operation.indexOf(oper)).trim()); // 공백이 있으면 int값으로 안바뀜(trim)
		
//		String oper = operation.substring(operation.indexOf('+'), operation.indexOf('+')+1);
		
		String second = operation.substring(operation.indexOf(oper)+1, operation.length()).trim(); // 밑의 if문을 하려고 문자열로 놔둠
		
		if (second.equals("")) { // 뒤의 피연산자가 없을 시
			
			System.out.println("피연산자가 부족합니다.");
			return;
			
		}
		
		int second1 = Integer.parseInt(second); // 계산을 위해서 int로 변환
		
		if (oper == "+") {
			
			result = first + second1;
			
		} else if (oper == "-") {
			
			result = first - second1;
			
		} else if (oper == "*") {
			
			result = first * second1;
			
		}  else if (oper == "/") {
			
			result = first / second1;
			
		}  else if (oper == "%") {
			
			result = first % second1;
		}
		
		System.out.printf("%d %s %d = %d", first, oper, second1, result);
		
		
	}

}
