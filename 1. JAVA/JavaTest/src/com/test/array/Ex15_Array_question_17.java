package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex15_Array_question_17 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("행 : ");
		int l = Integer.parseInt(reader.readLine()); 
		System.out.print("열 : ");
		int h = Integer.parseInt(reader.readLine()); 
		
		int[][] nums = new int[l][h];
		
		int n = 1;
		
		for (int k=0; k<nums.length * 2 - 1; k++) { // 대각선 횟수
			
			for (int i=0; i<nums.length; i++) { // 행
				
				int j = k - i; // 열
				
				if(j >= 0 && j < nums.length) { // 열의 범위 지정
					
					nums[i][j] = n;
					n++;
				}
				
			}
		}
		
		for (int i=0; i<nums.length; i++) { // 출력
			
			for (int j=0; j<nums[0].length; j++) {
				
				System.out.printf("%5d", nums[i][j]);
	
			}
			
			System.out.println();
		}
		
	}

}
