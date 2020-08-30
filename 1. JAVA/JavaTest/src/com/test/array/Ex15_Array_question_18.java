package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex15_Array_question_18 {
	
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
		
		for (int k=0; k<5; k++) {
			
			for (int i=0; i<nums.length; i++) {
				
				int j = k + i;
				
				
				
				
			}
			
		}
		
		for (int i=0; i<nums.length; i++) {
			
			for (int j=0; j<nums[0].length; j++) {
				
				System.out.printf("%5d", nums[i][j]);
	
			}
			
			System.out.println();
		}
		
	}

}
