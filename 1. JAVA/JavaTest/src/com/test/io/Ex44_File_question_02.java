package com.test.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex44_File_question_02 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\숫자.dat"));
		BufferedWriter writer = new BufferedWriter(new FileWriter("D:\\파일_입출력_문제\\숫자_변환.dat"));
		
		File file = new File("D:\\파일_입출력_문제\\숫자.dat");
		
		String line = null;
		
		if (file.exists()) {
		
			while ((line = reader.readLine()) != null) {
				
				writer.write(line.replace('0', '영').replace('1', '일').replace('2', '이').replace('3', '삼')
						.replace('4', '사').replace('5', '오').replace('6', '육').replace('7', '칠').replace('8', '팔').replace('9', '구'));			
				
			}
			
			writer.close();
			reader.close();
		
			System.out.println("변환 후 다른 이름으로 저장하였습니다.");
		
		} else {
			
			System.out.println("파일 없음");
			
		}
		
	}

}
