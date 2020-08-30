package com.test.etc;

public class Ex36_Process {
	
	public static void main(String[] args) throws Exception {
		
		//외부 프로세스(프로그램) 호출
//		Process p1 = new ProcessBuilder("notepad.exe").start();
//		Process p1 = new ProcessBuilder("mspaint.exe").start();
//		Process p1 = new ProcessBuilder("explorer.exe").start();
//		Process p1 = new ProcessBuilder("C:\\Program Files (x86)\\Google\\Chrome"
//				+ "\\Application\\chrome.exe").start();

//		Process p1 = new ProcessBuilder("notepad.exe", 
//				"D:\\class\\Java\\JavaTest\\src\\com\\test\\datetime\\Ex09_Datetime_question_05.java").start();
		
		Process p1 = new ProcessBuilder("C:\\Program Files (x86)\\Google\\Chrome"
				+ "\\Application\\chrome.exe", "https://youtu.be/bc1bVOfm2IU").start(); // 유투브 열기
		
		System.out.println("종료");
		
		
	}

}
