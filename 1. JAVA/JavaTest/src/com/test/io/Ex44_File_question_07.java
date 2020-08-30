package com.test.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Set;

public class Ex44_File_question_07 {
	
	public static void main(String[] args) throws Exception {
		
		HashMap<String, Integer> count = new HashMap<String, Integer>();
		HashMap<String, Integer> count2 = new HashMap<String, Integer>();
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\출결.dat"));
		File file = new File("D:\\파일_입출력_문제\\출결.dat");
		
		String line = null;
		
		if (file.exists()) {
			while ((line = reader.readLine()) != null) {
				
				String[] temp = line.split(",");
				String ext = temp[1];
				
				int hour = Integer.parseInt(temp[2].substring(0,1));
				int minute = Integer.parseInt(temp[2].substring(2));
				
				if (hour >=9 && minute >= 0) {
				
					if (count.containsKey(ext)) {
						
						count.put(ext, count.get(ext) + 1);
						
					} else {
						
						count.put(ext, 1);
						
					}
					
				}
				
				int hour2 = Integer.parseInt(temp[3].substring(0,2));
				int minute2 = Integer.parseInt(temp[3].substring(3));
				
				if (!(hour2 >= 18 && minute2 >= 0)) {
					
					if (count2.containsKey(ext)) {
						
						count2.put(ext, count2.get(ext) + 1);
						
					} else {
						
						count2.put(ext, 1);
						
					}
					
				}
//				System.out.println(count.get(ext));
				
			}
		
		}
		
		reader.close();
		
		System.out.println("[이름]\t[지각]\t[조퇴]");
		
		Set<String> set = count.keySet();
		for (String name : set) {
			System.out.println(name + "\t  " + count.get(name) + "회" + "\t " + count2.get(name) + "회");
		}
		
	}

}
