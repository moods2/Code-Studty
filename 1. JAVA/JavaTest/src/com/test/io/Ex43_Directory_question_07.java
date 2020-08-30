package com.test.io;

import java.io.File;

public class Ex43_Directory_question_07 {
	
	public static void main(String[] args) {
		
		String path = "D:\\파일_디렉토리_문제\\동일 파일\\MusicA";		
		File dir = new File(path);	
		File[] list = dir.listFiles();
		
		String path2 = "D:\\파일_디렉토리_문제\\동일 파일\\MusicB";	
		File dir2 = new File(path2);	
		File[] list2 = dir2.listFiles();
		
		
		for (int i=0; i<list.length; i++) {
			for (int j=0; j<list2.length; j++) {
				if (list[i].getName().equals(list2[j].getName())) {
					
					System.out.println(list[i].getName());
					
				} 
			}
		}
		
	}

}

