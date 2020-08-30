package com.test.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Set;

public class Ex44_File_question_10 {
	
	public static void main(String[] args) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\자바소스.java"));
		
		File file = new File("D:\\파일_입출력_문제\\자바소스.java");
		File file2 = new File("D:\\파일_입출력_문제\\자바예약어.dat");
		
		String line = null;
		String line2 = null;
		
		if (file.exists() && file2.exists()) {
		
			while ((line = reader.readLine()) != null) { //자바소스 1줄 출력
				
				String temp = line;
				
				BufferedReader reader2 = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\자바예약어.dat"));
				
				while ((line2 = reader2.readLine()) != null) { //자바예약어 1줄 출력
					
					String temp2 = line2;
										
					if (temp.contains(temp2)) {
						
						if (map.get(temp2) == null) {
						
							map.put(temp2, 1);
							
						} else {
							
							map.put(temp2, map.get(temp2)+1);
							
						}
						
					} 
					
				}
				
				reader2.close();
				
			}
			
			reader.close();
		
		}
		
		System.out.println("[결과]");
		
		Set<String> set = map.keySet();
		
		for (String word : set) {
			
			System.out.println(word + " : " + map.get(word) + "회");
			
		}
		
	}

}


