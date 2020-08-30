package com.test.io;

import java.io.File;
import java.util.Scanner;

public class Ex43_Directory_question_01 {
	
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("파일 경로 : ");
		
		String path = scan.nextLine();
		
//		String path = "D:\\class\\Java\\io\\test.txt";
		
		File file = new File(path);
		
		if (file.exists()) {
			
			int index = path.lastIndexOf(".");
			String ext = path.substring(index+1);
			
			System.out.printf("파일명 : %s\n", file.getName());
			System.out.printf("종류 : %s 파일\n", ext);
			
			
			if (file.length() < 1024) {
			
				System.out.printf("파일 크기 : %dB\n", file.length());
			
			} else if (file.length() < 1024 * 1024) {
				
				System.out.printf("파일 크기 : %dKB\n", file.length() / 1024);
				
			} else if (file.length() < 1024 * 1024 * 1024) {
				
				System.out.printf("파일 크기 : %dMB\n", file.length() / 1024 / 1024);
				
			} else if (file.length() < 1024 * 1024 * 1024 * 1024) {
				
				System.out.printf("파일 크기 : %dGB\n", file.length() / 1024 / 1024 / 1024);
				
			} else if (file.length() < 1024 * 1024 * 1024 * 1024 * 1024) {
				
				System.out.printf("파일 크기 : %dTB\n", file.length() / 1024 / 1024 / 1024 / 1024);
				
			}
	
		} else {
			System.out.println("파일이 없습니다.");
		}
		
		
	}

}
