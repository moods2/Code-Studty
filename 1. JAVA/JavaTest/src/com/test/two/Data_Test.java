package com.test.two;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;


public class Data_Test {

	private static Data_Output output;
	private static Scanner scan;
	private static HashMap<Integer, Data> map;

	static {
		output = new Data_Output();
		scan = new Scanner(System.in);
		map = new HashMap<Integer, Data>();
	}

	public static void main(String[] args) {
		try {
			dummy();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		boolean loop = true;

		while (loop) {

			output.menu();

			String sel = scan.nextLine();

			if (sel.equals("1")) {
				upload();
			} else if (sel.equals("2")) {
				list();
			} else if (sel.equals("3")) {
				delete();
			} else if(sel.equals("4")) {
				correct();
			} else if (sel.equals("5")) {
				// 수업자료 검색(이름)
				search();
			} else if (sel.equals("6")) {
				// 수업자료 검색(년)
				search2();
			} else if(sel.equals("7")) {
				System.out.println("이전 페이지로 돌아갑니다.");
				loop = false;
			}

		}

	} // main

	private static void correct() {
		output.title(Data_Title.CORRECT);

		list();

		Set<Integer> set = map.keySet();
		System.out.print("수정할 수업자료 번호: ");
		int num = scan.nextInt();
		scan.nextLine();
//		int find = 0;
//		for (Integer key : set) {
//			if (map.get(key).getKey() == num) {
//				find = key;
//			}
//		}
		
		System.out.println("□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□");
		System.out.println("1. 이름");
		System.out.println("2. 내용 수정");
		System.out.println("□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□");
		System.out.print("수정할 번호: ");
		int num1 = scan.nextInt();
		scan.nextLine();
		boolean loop = true;
		while (loop) {
			switch (num1) {
			case 1:
				String path = "C:\\Users\\user\\Desktop\\수업자료";
				System.out.print("이름: ");
				String name = scan.nextLine();
				File file = new File(path+"\\"+name);
				Boolean loop1 =  map.get(num1).getFile().renameTo(file);
				if(loop1) {
					System.out.println("이름 수정에 성공했습니다.");
					System.out.println(file.getName());
					map.get(num1).setFile(file);
				} else {
					System.out.println("이름 수정에 실패했습니다.");
				}
				loop = false;
				break;
			case 2:
				BufferedWriter writer = null;
				String txt="";
				try {
					writer = new BufferedWriter(new FileWriter(map.get(num1).getFile(),true));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.print("내용: ");
				while(true) {
				try {
					String context = scan.nextLine();
					if (context.equals("q")) {
						writer.write(txt);
						writer.close();
						break;
					}
					txt+=context+"\r\n";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					}
				}
				
				Calendar c = Calendar.getInstance();
				map.get(num1).setDate(String.format("%tF",c));
				loop = false;
				break;
			
			default:
				System.out.println("잘못된 숫자를 입력하셨습니다.");
			}
		}
	}

	private static void search2() {

		output.title(Data_Title.SEARCH);
		
		System.out.print("검색(년): "); // 홍길동 > 길동 검색률을 높임
		String year = scan.nextLine();
		
		Set<Integer> set = map.keySet();
		for (Integer key : set) {
			if (map.get(key).getDate().substring(0,4).equals(year)) {
				System.out.printf("%5d\t%s\t%s\t%s\n", 
						map.get(key).getSeq(), 
						map.get(key).getFile().getName(),
						length(map.get(key).getFile().length()),
						map.get(key).getDate());
			}

		}
	
		output.pause(scan);

	}


	private static void search() {

		output.title(Data_Title.SEARCH);

		// 검색?
		// -> list() 작업과 유사
		// 1. list(): 모든 데이터 출력
		// 2. search(): 일부 데이터 출력. 조건부 list()

		System.out.print("검색(파일명): "); // 홍길동 > 길동 검색률을 높임
		String word = scan.nextLine();

		System.out.println("[번호]\t[파일이름]\t[크기]\t[수정한 날짜]");
		Set<Integer> set = map.keySet();
		for (Integer key : set) {
			if (map.get(key).getFile().getName().toUpperCase().indexOf(word.toUpperCase()) > -1) {
				System.out.printf("%5d\t%s\t%s\t%s\n", 
						map.get(key).getSeq(), 
						map.get(key).getFile().getName(),
						length(map.get(key).getFile().length()),
						map.get(key).getDate());
						
			}

		}
	
		output.pause(scan);

	}

	private static void delete() {

		output.title(Data_Title.DELETE);

		list();

	
		System.out.print("삭제할 번호: ");
		int seq = scan.nextInt();
		scan.skip("\r\n");
	
		Set<Integer> keys = map.keySet(); 
		Iterator<Integer> kiter = keys.iterator();
		
		while(kiter.hasNext()) {
			Integer key = kiter.next();
			if (map.get(key).getSeq() == seq) {
				map.get(key).getFile().delete();
				map.remove(key);
				break; 
			}
		}

		output.pause(scan);
	}

	private static void list() {
		System.out.println("[번호]\t[파일이름]\t[크기]\t[수정한 날짜]");

		Set<Integer> set = map.keySet();
		for (Integer key : set) {
			System.out.printf("%5d\t%s\t%s\t%s\n", 
					map.get(key).getSeq(), 
					map.get(key).getFile().getName(),
					length(map.get(key).getFile().length()),
					map.get(key).getDate());
					
		}

	}

	
	private static String length(double c) {
		String len="";
		if (c < 1024) {
			len = String.format("%.1fB", c);
		} else if (c >= 1024 && c < 1024 * 1024) {
			len = String.format("%.1fKB", c / 1024);
		} else if (c >= 1024 * 1024 && c < 1024 * 1024 * 1024) {
			len = String.format("%.1fMB", c / (1024 * 1024));
		} else if (c >= 1024 * 1024 * 1024 && c < 1024 * 1024 * 1024 * 1024) {
			len = String.format("%.1fGB", c / (1024 * 1024 * 1024));
		} else if (c >= 1024 * 1024 * 1024 * 1024 && c < 1024 * 1024 * 1024 * 1024) {
			len = String.format("%.1fTB", c / (1024 * 1024 * 1024 * 1024));
		}
		return len;
	}

	private static void upload() {
		String path = "C:\\Users\\user\\Desktop\\수업자료";
		output.title(Data_Title.UPLOAD);

		System.out.print("이름: ");
		String name = scan.nextLine();
		boolean loop = false;
		int find = 0;
		for (int i = 0; i < map.size(); i++) {
			if (map.get(i + 1).getFile().getName().equals(name)) {
				System.out.println("파일을 새로 다시 작성하겠습니까?");
				System.out.print("y/n :");
				find = i+1;
				String answer = scan.nextLine();
				if (answer.equals("y")) {
					loop = true;
				}
			}
		}
		if (loop) {
			System.out.print("내용: ");
			BufferedWriter writer = null;
			File file = new File(path + "\\" + name);
			String txt="";
			while (true) {
				try {
					String context = scan.nextLine();
					writer = new BufferedWriter(new FileWriter(file));
					if (context.equals("q")) {
						writer.write(txt);
						writer.close();
						Calendar date = Calendar.getInstance();
						map.get(find).setFile(file);
						map.get(find).setDate(String.format("%tF",date));
						break;
					}
					txt+=context+"\r\n";
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

	}
		 if(find==0) {
			Data.temp++;
			System.out.print("내용: ");
			BufferedWriter writer = null;
			File file = new File(path + "\\" + name);
			String txt="";
			map.put(Data.temp,new Data());
			while (true) {
				try {
					String context = scan.nextLine();
					writer = new BufferedWriter(new FileWriter(file));
					if (context.equals("q")) {
						writer.write(txt);
						writer.close();
						Calendar date = Calendar.getInstance();
						map.get(Data.temp).setFile(file);
						map.get(Data.temp).setDate(String.format("%tF",date));
						map.get(Data.temp).setSeq(Data.temp);
						break;
					}
					txt+=context+"\r\n";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		 }
		// 잠시 멈춤
		output.pause(scan); // 매개변수로 scan하면 복잡성이 증가

	}
	public static void dummy() throws Exception {
		// 테스트용 데이터 x 30명
		
		int length = 10;
		
		String path = "C:\\Users\\user\\Desktop\\수업자료";
		File dir = new File("C:\\Users\\user\\Desktop\\수업자료");
		
		//BufferedWriter writer = null;
		String[] context = {"안녕하세요?\r\n","반가워요\r\n","열심히 공부해라\r\n","문제 잘 풀어\r\n"};
		String[] context1 = {"안녕하세요?\r\n","반가워요\r\n","열심히 공부해라\r\n","문제 잘 풀어\r\n","응응\r\n","핳핳핳핳핳핳핳핳핳핳\r\n"};
		String[] context3 = {"안녕하세요?\r\n","반가워요\r\n","열심히 공부해라\r\n","문제 잘 풀어\r\n","응응\r\n","핳핳핳핳핳핳핳핳핳핳\r\n"};
		Random rnd = new Random();
		
//		for(int i=0;i<length;i++) {
//			Data value = new Data();
//			map.put(i+1,value);
//		}
	
		
		//if문 전에 열어야 돼~
		int cnt=1;
		if (dir.exists()) {
			for (int i = 0; i < length; i++) {
				String path1 = String.format("C:\\Users\\user\\Desktop\\수업자료\\수업자료%d.txt", cnt);
				File file = new File(path1);
				BufferedWriter writer = new BufferedWriter(new FileWriter(file));
				if (file.exists()) {
					//Calendar c = Calendar.getInstance();
					writer.write(context[rnd.nextInt(context.length)] + context1[rnd.nextInt(context1.length)]+context3[rnd.nextInt(context3.length)]);
					writer.close();
//					Data.temp++; // 공용변수
//					map.get(i+1).setFile(file);
//					map.get(i+1).setSeq(Data.temp);
//					map.get(i+1).setDate(String.format("%tF", c));
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				}
				cnt++;
			}
		} else {
			System.out.println("폴더가 존재하지 않습니다.");
		}
		
		for(File list:dir.listFiles()) {
			if(list.isFile()) {
			Data.temp++; // 공용변수
			Data value = new Data();
			map.put(Data.temp,value);
			Calendar c = Calendar.getInstance();
			map.get(Data.temp).setFile(list);
			map.get(Data.temp).setSeq(Data.temp);
			map.get(Data.temp).setDate(String.format("%tF", c));
			} else {
				System.out.println("파일이 아닙니다.");
			}
		} 
		
	

	}


}

