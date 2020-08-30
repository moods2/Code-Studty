package com.test.begin;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test00 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자 입력 : ");
		int num1 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num2 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num3 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num4 = Integer.parseInt(reader.readLine());
		System.out.print("숫자 입력 : ");
		int num5 = Integer.parseInt(reader.readLine());
		
		int even = 0;
		int odd = 0;
		
		if (num1 >= 1 && num1 <= 10 && num2 >= 1 && num2 <= 10 && num3 >= 1 && num3 <= 10 &&
				num4 >= 1 && num4 <= 10 && num5 >= 1 && num5 <= 10) {
			if (num1 % 2 == 0) {
				even++;
			} else if (num1 % 2 == 1) {
				odd++;
			}
			if (num2 % 2 == 0) {
				even++;
			} else if (num2 % 2 == 1) {
				odd++;
			}
			if (num3 % 2 == 0) {
				even++;
			} else if (num3 % 2 == 1) {
				odd++;
			}
			if (num4 % 2 == 0) {
				even++;
			} else if (num4 % 2 == 1) {
				odd++;
			}
			if (num5 % 2 == 0) {
				even++;
			} else if (num5 % 2 == 1) {
				odd++;
			}
		} else {
			System.out.println("정확한 숫자를 입력해주세요.");
			return;
		}
		
		System.out.printf("짝수는 %d개 홀수는 %d개 입력했습니다.\n"
				+ "홀수가 짝수보다 %d개 더 많습니다."
						, even, odd
						, odd - even);
		
	}

}
