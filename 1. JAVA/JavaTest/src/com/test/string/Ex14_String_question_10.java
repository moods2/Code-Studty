package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_10 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("입력 : ");
		String txt = reader.readLine();
		String word1 = "바보";
		String word2 = "멍청이";
		String word1c = "**";
		String word2c = "***";
		String result = "";
		int count = 0;
		
		for (int i=0; i<2; i++) { //금지어가 두개라서 두번 돌림
			
			if (txt.contains(word1)) { //'바보'를 포함할 때
				
				result = txt.replace(word1, word1c);
				txt = result;
				count++;
				
			} else if (txt.contains(word2)) { //'멍청이'를 포함할 때
				
				result = txt.replace(word2, word2c);
				txt = result;
				count++;
				
			}
			
		}
		
		System.out.printf("%s\n"
							+ "금지어를 %d회 마스킹했습니다.", result, count);
		
	}

}
