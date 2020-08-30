package com.test.operator;
import java.io.*;

public class Ex07_Operator_question_02 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("첫번째 숫자 : ");
		
		String num1 = reader.readLine();
		
		System.out.print("두번째 숫자 : ");
		
		String num2 = reader.readLine();
		
		int realNum1 = Integer.parseInt(num1);
		int realNum2 = Integer.parseInt(num2);
		
		
		System.out.printf("%,d + %,d = %,d\n"
										, realNum1
										, realNum2
										, realNum1 + realNum2);
		System.out.printf("%,d - %,d = %,d\n"
										, realNum1
										, realNum2
										, realNum1 - realNum2);
		System.out.printf("%,d * %,d = %,d\n"
										, realNum1
										, realNum2
										, realNum1 * realNum2);
		System.out.printf("%,d / %,d = %,.1f\n"
										, realNum1
										, realNum2
										, (float)realNum1 / realNum2);
		System.out.printf("%,d %% %,d = %,d\n"
										, realNum1
										, realNum2
										, realNum1 % realNum2);
		
		
	}

}
