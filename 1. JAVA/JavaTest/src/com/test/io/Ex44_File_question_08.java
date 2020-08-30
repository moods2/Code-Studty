package com.test.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Stack;

public class Ex44_File_question_08 {
	
	public static void main(String[] args) throws Exception {
		
		Stack<String> stack = new Stack<String>();
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\괄호.java"));
		File file = new File("D:\\파일_입출력_문제\\괄호.java");
		
		String line = null;
		int count1 = 0;
		int count11 = 0;
		int count2 = 0;
		int count22 = 0;
		
		if (file.exists()) {
		
			while ((line = reader.readLine()) != null) {
				
				if (line.contains("(")) {
					
					stack.push("(");
					count1++;
					
				}
				if (line.contains(")")) {
					
					stack.push(")");
					count11++;
					
				}
				if (line.contains("{")) {
					
					stack.push("{");
					count2++;
					
				}
				if (line.contains("}")) {
					
					stack.push("}");
					count22++;
					
				}
				
			}
			
		}
		
		reader.close();
		System.out.println(count1);
		System.out.println(count11);
		System.out.println(count2);
		System.out.println(count22);
		if (count1 == count11 && count2 == count22) {
			
			System.out.println("올바른 소스입니다.");
			
		} else {
			
			System.out.println("올바르지 않은 소스입니다.");
			
		}
		
	}

}
