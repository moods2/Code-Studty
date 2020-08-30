package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Ex15_Array_question_16 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("국어 점수 : ");
		int kor = Integer.parseInt(reader.readLine());
		System.out.print("영어 점수 : ");
		int eng = Integer.parseInt(reader.readLine());
		System.out.print("수학 점수 : ");
		int math = Integer.parseInt(reader.readLine());
		System.out.println();
		
		String[][] score = new String[10][3];
		
		
		for (int i=0; i<score.length; i++) {
			
			if (kor / 10 >= 10 - i) { 
				score[i][0] = "■";
				
			} else {
				score[i][0] = " ";
				
			}
			if (eng / 10 >= 10 - i) { 
				score[i][1] = "■";
				
			} else {
				score[i][1] = " ";
				
			}
			if (math / 10 >= 10 - i) { 
				score[i][2] = "■";
				
			} else {
				score[i][2] = " ";
				
			}			
		}
		
		
		for (int i=0; i<score.length; i++) {
			
			for(int j=0; j<3; j++) {
				
				System.out.printf("%2s\t", score[i][j]);
				
			}
			System.out.println();
		}
		
		System.out.println();
		System.out.println("--------------------");
		System.out.println();
		System.out.print("국어\t영어\t수학");
		
	}

}
