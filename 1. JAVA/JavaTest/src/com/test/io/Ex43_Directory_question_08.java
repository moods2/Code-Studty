package com.test.io;

import java.io.File;

public class Ex43_Directory_question_08 {
	
	public static void main(String[] args) {
		
		String path = "D:\\파일_디렉토리_문제\\폴더 삭제";
		
		File dir = new File(path);
		
		if (dir.exists()) {
			
			deleteFile(dir);
	
		}
		
	}

	private static void deleteFile(File dir) {
		
		File[] list = dir.listFiles();
		
		for (File file : list) {
			
			if (file.isFile()) { //파일이면 삭제
				
				file.delete();
				
			}
			
		}
		
		for (File file : list) {
			
			if (file.isDirectory()) { //폴더면 삭제
				
				file.delete();
				
				deleteFile(file); //재귀
				
			}
			
			file.delete();
			
		}
		
	}

}
