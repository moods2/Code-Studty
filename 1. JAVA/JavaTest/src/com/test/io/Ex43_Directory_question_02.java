package com.test.io;

import java.io.File;
import java.util.Scanner;

public class Ex43_Directory_question_02 {
	
	public static void main(String[] args) {
		
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("폴더 선택 : ");
		String path = scan.nextLine();
		
		System.out.print("파일 확장자 : ");
		String ext = scan.nextLine();
		
		File dir = new File(path);
		
		if (dir.exists()) {
			
			String[] list = dir.list();
			
			for (String name : list) {
				
				if (name.substring(name.lastIndexOf(".") + 1).toUpperCase().equals(ext.toUpperCase())) {
					
					System.out.println(name);					
					
				}
				
			}
			
		} else {
			
			System.out.println("폴더가 없습니다.");
			
		}
		
	}

}
