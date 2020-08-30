package com.test.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

public class Ex44_File_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\성적.dat"));
		
		File file = new File("D:\\파일_입출력_문제\\성적.dat");
	
		String line = null;
		
		ArrayList<String> list1 = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();
		
		if (file.exists()) {
			
			while ((line = reader.readLine()) != null) {
				
				String[] temp = line.split(",");
				
				int kor = Integer.parseInt(temp[1]);
				int eng = Integer.parseInt(temp[2]);
				int math = Integer.parseInt(temp[3]);
				
				if ((kor + eng + math) / 3 >= 60 && (kor >=40 && eng >= 40 && math >= 40)) {
	
					list1.add(temp[0]);
					
				} else {
					
					list2.add(temp[0]);
					
				}
				
			}
			
		} else {
			
			System.out.println("파일 없음");
			
		}
		
		reader.close();
		
		System.out.println("[합격자]");
		for(int i=0; i<list1.size(); i++) {
			
			System.out.println(list1.get(i));
			
		}
		
		System.out.println("[불합격자]");
		for(int i=0; i<list2.size(); i++) {
			
			System.out.println(list2.get(i));
			
		}
		
	}

}













