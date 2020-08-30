package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Ex15_Array_question_14 {
	
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
		
		for (int i=0; i<=nums.length/2; i++) { //행
				
			for (int j=nums[0].length/2 - i; j<=nums[0].length/2 + i; j++) { //열
				
				nums[i][j] = n;
				n++;	
					
			}
		 
		}
		
//------------------------------------------위쪽 코딩-----------------------------------------------------
		
		for (int i=nums.length/2 + 1; i<=nums.length - 1; i++) { //행
			
			for (int j=i-nums[0].length/2; j<nums[0].length + nums[0].length/2 -i; j++) { //열 (??)
				
				nums[i][j] = n;
				n++;
				
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
