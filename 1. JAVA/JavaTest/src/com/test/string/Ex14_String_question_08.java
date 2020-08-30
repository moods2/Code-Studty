package com.test.string;

public class Ex14_String_question_08 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		String content = "안녕~ 길동아~ 잘가~ 길동아~";
		String word = "길동";
		int index = -1;
		int count = 0;
		
		
		while (true) {
			
		index = content.indexOf(word, index + word.length());
		
			if (index > -1) {
				
				count++;
				
			} else {
				
				break;
				
			}
			
		}
		
		System.out.printf("\'%s\'을 총 %d회 발견했습니다.", word, count);
		
	}

}
