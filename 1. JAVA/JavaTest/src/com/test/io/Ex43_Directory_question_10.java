package com.test.io;

import java.io.File;

public class Ex43_Directory_question_10 {
	
	public static void main(String[] args) {
		
		String path = "D:\\파일_디렉토리_문제\\직원";
		
		File dir = new File(path);
		
		File[] list = dir.listFiles();
		
		for (File file : list) { //split!
			
			if (file.isFile()) {
				
				String[] temp = file.getName().split("_"); // "_" 을 기준으로 이름을 나눠서 저장
				
				String path2 = path + "\\" + temp[0] + "\\" + temp[1]; // 이름 + 년도
				File dir2 = new File(path2);
				dir2.mkdirs(); // 파일안에 파일까지 생성
				
				System.out.println(dir2.getAbsolutePath());
				System.out.println(file.getName());
				
				String path3 = dir2.getAbsolutePath() + "\\" + file.getName(); // 최종 위치 지정
				File dir3 = new File(path3);
				
				file.renameTo(dir3); // 파일 옮기기
				
				
			}
			
		}	
		
	}

}















