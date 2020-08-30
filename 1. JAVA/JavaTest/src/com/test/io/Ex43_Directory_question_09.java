package com.test.io;

import java.io.File;
import java.util.ArrayList;

public class Ex43_Directory_question_09 {
	
	public static void main(String[] args) {
		
		ArrayList<File> arraylist = new ArrayList<File>(); //배열 활용
		
		String path = "D:\\파일_디렉토리_문제\\크기 정렬";
		
		File dir = new File(path);
		
		
		showfile(dir, arraylist);
		
		
		for(int i=0; i<arraylist.size(); i++) { //버블정렬
			for(int j=0; j<arraylist.size()-i-1; j++) {
				
				if (arraylist.get(j).length() > arraylist.get(j+1).length()) {
					
					File temp = arraylist.get(j);
					
					arraylist.set(j, arraylist.get(j+1));
					
					arraylist.set(j+1, temp);
					
				}				
			}			
		}
		
		System.out.println("[파일명]\t\t\t     [크기]\t[파일이 들어있는 폴더]");
		
		for (File file : arraylist) {
		
			System.out.printf("%-30s\t%8dKB\t\t%s\n"
												, file.getName()
												, file.length() / 1024
												, file.getParentFile().getName());
		
		}
		
		
		
	}

	private static void showfile(File dir, ArrayList<File> arraylist) { //파일을 배열에 담는과정
		
		File[] list = dir.listFiles();
		
		for (File sub : list) {
			if (sub.isFile()) {
				
				arraylist.add(sub);
				
			}
		}
		
		for (File sub : list) {
			if (sub.isDirectory()) {
				showfile(sub, arraylist); //재귀
			}
		}
				
	}
	
}
