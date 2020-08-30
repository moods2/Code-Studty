package com.test.io;

import java.io.File;
import java.util.HashMap;

public class Ex43_Directory_question_05 {
	
	public static void main(String[] args) {
		
		HashMap<String,Integer> count = new HashMap<String,Integer>();
		//파일을 추가해도 소스 수정없이 출력되도록 해시맵 사용
		
		String path = "D:\\파일_디렉토리_문제\\확장자별 카운트";
		
		File dir = new File(path);
		
		File[] list = dir.listFiles();
		
		if (dir.exists()) {
			
			for (File file : list) {
				
				String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
				
				if (count.containsKey(ext)) { //ext를 키값으로 갖는 요소 검색
					
					count.put(ext, count.get(ext) + 1); //가지고 있으면 value+1
					
				} else {
					
					count.put(ext, 1); //없으면 키값에 추가
					
				}
				
			}
			
			System.out.println(count);
			
		}		
		
	}

}
