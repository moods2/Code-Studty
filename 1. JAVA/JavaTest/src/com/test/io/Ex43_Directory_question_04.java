package com.test.io;

import java.io.File;

public class Ex43_Directory_question_04 {
	
	public static void main(String[] args) {
		
		
		String path = "D:\\파일_디렉토리_문제\\음악 파일";
		
		File dir = new File(path);
		
		File[] list = dir.listFiles();
		int count = 1;
		
		if (dir.exists()) {
			
			for (File name : list) {
				
				System.out.printf("[%03d]%s\n", count, name.getName());
				count++;
				
			}
			
		}
		
	}

}
