package com.test.array;

import java.util.Arrays;

public class Ex15_Array_question_help {
	
	public static void main(String[] args) {
		
//		q007();
//		q008();
		q009();
		
	}//main

	
	private static void q009() {
		
		//배열 삽입(좌측 시프트 -> Left Shift)
		String[] color = { "빨강", "노랑", "파랑", "검정", "하양", "초록", "보라" };
				
		System.out.println(Arrays.toString(color));
				
		int insertIndex = 2;
		
		//기존의 요소들을 좌측으로 옮긴다 -> 빈방 발생 -> 새 요소를 삽입
		for (int i=insertIndex; i<color.length-1;i++) {
			
			color[i] = color[i+1];
			System.out.println(Arrays.toString(color));
			
		}
		
		color[color.length-1] = "";
		System.out.println(Arrays.toString(color));
				
		
	}//q009

	
	private static void q008() {
		
		
		//배열 삽입(우측 시프트 -> Right Shift)
		String[] color = { "빨강", "노랑", "파랑", "검정", "하양", "초록", "보라" };
		
		System.out.println(Arrays.toString(color));
		
		String newColor = "주황";
		int insertIndex = 2;
		
		//기존의 요소들을 우측으로 옮긴다 -> 빈방 발생 -> 새 요소를 삽입
		for (int i=color.length-2; i>=insertIndex; i--) { //********
			
			color[i+1] = color[i];
			System.out.println(Arrays.toString(color));
			
		}
		
		color[insertIndex] = newColor;
		System.out.println(Arrays.toString(color));
		
		
	}//q008

	
	private static void q007() {
		
		
		//중복값 제거 난수
		int[] nums = new int[5];
		
		//난수 생성 -> (중복 체크) -> 배열 대입
		
		for (int i=0; i<nums.length; i++) {
			
			int n = (int)(Math.random() * 10) + 1; //1~10
			
			if(!duplicate(i, n, nums)) {
			
			nums[i] = n;
			
			} else {
				
				i--;
			}
			
			
		}//for
		
		System.out.println(Arrays.toString(nums));
		
	}//q007
	
	public static boolean duplicate(int i, int n, int[] nums) { // (중복체크)
		
		boolean duplicate = false;
		
		for (int j=0; j<i; j++) {
			
			if (nums[j] == n) { // 중복 시 빠져나감
				duplicate = true;
				break;
			}
			
		}
		
		return duplicate;
		
		
	}//q007 중복제거

}
