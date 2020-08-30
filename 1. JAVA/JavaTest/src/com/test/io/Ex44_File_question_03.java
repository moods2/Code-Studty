package com.test.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Ex44_File_question_03 {
	
	public static void main(String[] args) throws IOException {
		
		Scanner scan = new Scanner(System.in);
		System.out.print("파일명 : ");
		String filename = scan.nextLine();
		
		FileWriter writer = new FileWriter("D:\\파일_입출력_문제\\" + filename);
		
		while (true) {
			
			String line = scan.nextLine();
			
			if (line.equals("q")) {
				break;				
			}
			
			writer.write(line + "\r\n");			
		}
		writer.close();
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\" + filename));
		File file = new File("D:\\파일_입출력_문제\\" + filename);
		String line = null;
		
		if (file.exists()) {
			
			System.out.print("[이름]\t[작성시간]\t[내용]\n");
			
			while ((line = reader.readLine()) != null) {
				
				System.out.print(line + "\t");
				
			}
		
		
		}
		
		
	}

}
