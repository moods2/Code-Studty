package com.test.error2;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_use_03 {
	
	public static void main(String[] args) throws Exception {
		
//		m1();
		m2();
		
	}

	private static void m2() throws Exception {

		//별찍기(행 입력)
		//*
		//**
		//***
		//****
		//*****
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("행: ");
		
		int row = Integer.parseInt(reader.readLine()); // int값으로 입력 받을 때 (int)를 써서 형변환을 하는것이 아니라 parseInt를 사용한다. 
		
		for (int i=0; i<=row; i++) {
			
			for (int j=0; j<=i; j++) {
				
				System.out.print("*"); // println을 쓰면 별이 가로로 누적되지 않는다. -> print로 바꾼다.
				
			}
			
			System.out.println();
		}
		
	}

	private static void m1() {
		
		//구구단
		//2단 ~ 9단
				
		for (int j=2; j<10; j++) {
		
			for (int i=1; i<10; i++) { //j++ 를 i++로 고친다.
				System.out.printf("%d x %d = %2d\n", j, i, j * i);
			}
			
			System.out.println();
			
		}
		
	}

}









