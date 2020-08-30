package com.test.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

public class Ex44_File_question_06 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\검색_회원.dat"));
		
		File file = new File("D:\\파일_입출력_문제\\검색_회원.dat");
		File file2 = new File("D:\\파일_입출력_문제\\검색_주문.dat");
		
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 : ");
		String name = scan.nextLine();
		
		String line = null;
		String line2 = null;
		
		if(file.exists() && file2.exists()) {
		
			while ((line = reader.readLine()) != null) {
				
				String[] temp = line.split(",");
				//System.out.println(temp[1] + " : " + name.equals(temp[1]));
				
				BufferedReader reader2 = new BufferedReader(new FileReader("D:\\파일_입출력_문제\\검색_주문.dat"));
				
				while ((line2 = reader2.readLine()) != null) {
					
					String[] temp2 = line2.split(",");
					
					if (name.equals(temp[1]) && temp[0].equals(temp2[3])) {
												
						System.out.println("====구매내역====");
						System.out.println("[번호]\t[이름]\t[상품명]\t[개수]\t[배송지]");
						System.out.printf("%5s\t%2s\t%5s\t%5s\t%s\n"
								, temp[0], temp[1], temp2[1], temp2[2], temp[2]);
											
					}
					
				}
				
				reader2.close();
				
			}
			reader.close();
			
		} else {
			
			System.out.println("파일 없음");
			
		}
		
	}

}
