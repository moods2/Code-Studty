package com.test.string;

public class Ex14_String_question_06 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		String txt = "    하나    둘    셋    ";
		String result = "";
			
		result = txt.substring(0,6) + txt.substring(10,11) + txt.substring(15,20); 
			
		System.out.print(result);
			
	}

}
