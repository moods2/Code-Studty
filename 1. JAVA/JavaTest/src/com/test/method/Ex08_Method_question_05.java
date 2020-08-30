package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_question_05 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("첫번째 숫자 : ");
		String num1 = reader.readLine();
		
		System.out.print("두번째 숫자 : ");
		String num2 = reader.readLine();
		
		int n1 = Integer.parseInt(num1);
		
		int n2 = Integer.parseInt(num2);
		
		double result;
		
		result = add(n1, n2);
		System.out.printf("%,d\n",(int)result);
		result = add(n1, n1);
		System.out.printf("%,d\n",(int)result);
		
		result = subtract(n1, n2);
		System.out.printf("%,d\n",(int)result);
		
		result = multiply(n1, n2);
		System.out.printf("%,d\n",(int)result);
		result = multiply(n1, n1);
		System.out.printf("%,d\n",(int)result);
		
		result = divide(n1, n2);
		System.out.printf("%,.1f\n",result);
		
		result = mod(n1, n2);
		System.out.printf("%,d\n",(int)result);
				
	}
	
	public static int add(int n1, int n2) {
		
		int result = n1 + n2;
		
		return result;
				
	}
	
	public static int subtract(int n1, int n2) {
		
		int result = n1 - n2;
		
		return result;
		
	}
	
	public static int multiply(int n1, int n2) {
		
		int result = n1 * n2;
		
		return result;

	}
	
	public static double divide(double n1, int n2) {
		
		double result = n1 / n2;
		
		return result;

	}
	
	public static int mod(int n1, int n2) {
		
		int result = n1 % n2;
		
		return result;

	}

}
