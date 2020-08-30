package com.test.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex44_File_question_01 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\이름수정.dat"));
		BufferedWriter writer = new BufferedWriter(new FileWriter("D:\\파일_입출력_문제\\이름수정_변환.dat"));
		
		File file = new File("D:\\파일_입출력_문제\\이름수정.dat");
		
		String line = null;
		
		if (file.exists()) {	
			
		
			while ((line = reader.readLine()) != null) {
				
				writer.write(line.replace("유재석", "메뚜기"));
				System.out.println(line.replace("유재석", "메뚜기"));
				
			}
			
			writer.close();
			reader.close();
			
			
			System.out.println("변환 후 다른 이름으로 저장하였습니다.");
		
		} else {
			
			System.out.println("파일 없음");
			
		}
		
		
	}

}
