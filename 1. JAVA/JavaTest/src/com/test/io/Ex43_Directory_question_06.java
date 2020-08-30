package com.test.io;

import java.io.File;

public class Ex43_Directory_question_06 {
	
	public static void main(String[] args) {
		
		String path = "D:\\파일_디렉토리_문제\\파일 제거";
		
		File dir = new File(path);
		
		File[] list = dir.listFiles();
		
		int count = 0;
		
		if (dir.exists()) {
			
			for (File file : list) {
				
				if (file.length() == 0) {
					
					file.delete();
					count++;
					
				}
				
			}
			
			System.out.printf("총 %d개의 파일을 삭제했습니다.", count);
			
		}
		
		
	}

}
