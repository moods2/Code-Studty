package com.test.io;

import java.io.File;
import java.util.Scanner;

public class Ex43_Directory_question_03 {
	
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("파일 이동을 실행합니다.\n같은 이름을 가지는 파일이"
				+ " 이미 존재합니다. 덮어쓸까요?(y/n) : ");
		String result = scan.nextLine();
					
		String path = "D:\\class\\Java\\file\\AAA\\test.txt";
		
		File dir = new File(path);
		
		String path2 = "D:\\class\\Java\\file\\BBB\\test.txt";
		
		File dir2 = new File(path2);
		
		System.out.println(dir.getAbsolutePath());
		System.out.println(dir2.getAbsolutePath()); //파일 못찾으면 찍어보고 다시쓰기(오류)
		
		if (dir.exists()) {					
						
			if (dir2.getName().equals(dir.getName()) && result.equals("y")) {
				
				dir2.delete();
				dir.renameTo(dir2);
				System.out.println("파일을 덮어썼습니다.");
				
			} else if (dir2.getName().equals(dir.getName()) && result.equals("n")) {
				
				System.out.println("작업을 취소합니다.");
				
			}		
	
		} else {
			
			System.out.println("파일이 없습니다.");
			
		}
		
	}

}
