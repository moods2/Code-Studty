package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		String filename = "";
		int gif=0, jpg=0, png=0, hwp=0, doc=0;
		
		for (int i=0; i<10; i++) {
		
		System.out.print("파일명 : ");
		filename = reader.readLine();
		
		
		if (filename.toLowerCase().indexOf(".gif") == filename.length() - 4) {
			gif++;
			
		} else if (filename.toLowerCase().indexOf(".jpg") == filename.length() - 4) {
			jpg++;
			
		} else if (filename.toLowerCase().indexOf(".png") == filename.length() - 4) {
			png++;
			
		} else if (filename.toLowerCase().indexOf(".hwp") == filename.length() - 4) {
			hwp++;
			
		} else if (filename.toLowerCase().indexOf(".doc") == filename.length() - 4) {
			doc++;
			
		}
		
		}
		
		System.out.printf("gif : %d개\n"
				+ "jpg : %d개\n"
				+ "png : %d개\n"
				+ "hwp : %d개\n"
				+ "doc : %d개\n", gif, jpg, png, hwp, doc);
		
	}

}
