package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_09 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("주민등록번호 : ");
		String jumin = reader.readLine();
		int len = jumin.length();
		int count = 2;
		int sum = 0;
		
		for (int i=0; i<len; i++) {
			
			if (len > 14) { // xxxxxx-xxxxxxx 형태를 넘어가면 리턴
				
				System.out.print("올바르지 않은 주민번호입니다.");
				return;
				
			} 
			
			if (i == 6) { // '-'는 넘어감
				continue;
			}
			
			if (i == len-1) { // 마지막숫자는 계산하지않음
				break;
				
			}
			
			if (count > 9) { // 2,3,4,5,6,7,8,9, 2,3,4,5
				count = 2;
				
			}
			
			sum += (jumin.charAt(i) - '0') * count;
			
			count++;
			
		}
		
		System.out.println(sum);
		int result = 11 - (sum % 11);
		result = result % 10;
		
		if (result == Integer.parseInt(jumin.substring(13))) {
			
			System.out.print("올바른 주민번호입니다.");
			
		} else {
			
			System.out.print("올바르지 않은 주민번호입니다.");
			
		}
		
	}

}
