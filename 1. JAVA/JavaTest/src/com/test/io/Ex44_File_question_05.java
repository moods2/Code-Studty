package com.test.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

public class Ex44_File_question_05 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\단일검색.dat"));
		
		File file = new File("D:\\파일_입출력_문제\\단일검색.dat");
		
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 : ");
		String name = scan.nextLine();
		String line = null;
		
		while ((line = reader.readLine()) != null) {
			
			String[] temp = line.split(",");
			
			if (name.equals(temp[1])) {
				
				System.out.printf("[%s]\n번호 : %s\n주소 : %s\n전화 :%s\n"
						, temp[1], temp[0], temp[2], temp[3]);
				
			}
				
		}
		reader.close();
				
		
	}

}
