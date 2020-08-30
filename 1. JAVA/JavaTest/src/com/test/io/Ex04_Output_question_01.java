package com.test.io;

public class Ex04_Output_question_01 {

	
	public static void main(String[] args) {
		
		
		String name = "장정우";
		int age = 26;
		String who = "남자";
		String address = "서울시 관악구 신림동";
		
		System.out.printf("안녕하세요. 제 이름은 \'%s\'입니다.\n나이는 %d살이고 %s입니다.\n"
				+ "저는 \'%s\'에 살고 있습니다.", name, age, who, address);
		
		System.out.println();
		System.out.println();
		
		String name1 = "홍길동";
		int kor1 = 80;
		int eng1 = 90;
		int math1 = 95;
		String name2 = "아무개";
		int kor2 = 76;
		int eng2 = 89;
		int math2 = 79;
		String name3 = "하하하";
		int kor3 = 89;
		int eng3 = 92;
		int math3 = 85;
		
		System.out.println("[학생]\t[국어]\t[영어]\t[수학]\t[평균]");
		System.out.println("--------------------------------------");
		System.out.println(name1 + "\t" + "  " + kor1 + "\t" +  "  "  + eng1 + "\t" +  "  "  + math1 + "\t" +  "  "  + ((kor1 + eng1 + math1) / 3));
		System.out.println(name2 + "\t" + "  " + kor2 + "\t" +  "  "  + eng2 + "\t" +  "  "  + math2 + "\t" +  "  "  + ((kor2 + eng2 + math2) / 3));
		System.out.println(name3 + "\t" + "  " + kor3 + "\t" +  "  "  + eng3 + "\t" +  "  "  + math3 + "\t" +  "  "  + ((kor3 + eng3 + math3) / 3));
		
		System.out.println("[학생]\t[국어]\t[영어]\t[수학]\t[평균]");
		System.out.println("--------------------------------------");
		System.out.printf("%s\t %3d\t %3d\t %3d\t" + "  " + ((kor1 + eng1 + math1) / 3), name1, kor1, eng1, math1);
		System.out.printf("\n%s\t %3d\t %3d\t %3d\t" + "  " + ((kor2 + eng2 + math2) / 3), name2, kor2, eng2, math2);
		System.out.printf("\n%s\t %3d\t %3d\t %3d\t" + "  " + ((kor3 + eng3 + math3) / 3), name3, kor3, eng3, math3);
		
		
		
		System.out.println();
		System.out.println();
		
		
		String day1 = "2020-01-01";
		String buy1 = "카페라테";
		String buy2 = "돼지불백";
		int money1 = 4800;		
		int money2 = 8500;		
		
		String day2 = "2020-01-02";
		String buy3 = "마트 장본것들";
		int money3 = 125840;
		int money4 = 45000;
		
		String day3 = "2020-01-03";
		String buy4 = "교통 카드 충전";
		String buy5 = "편의점";
		int money5 = 16200;
		
		
		System.out.println("[날짜]\t\t[내역]\t\t" + "   " + "[금액]");
		System.out.println("-----------------------------------------");
		System.out.printf(day1 + "\t" + buy1 + "\t" + "%,7d원\n", money1);
		System.out.printf(day1 + "\t" + buy2 + "\t" + "%,7d원\n", money2);
		System.out.printf(day2 + "\t" + buy3 + "\t" + "%,7d원\n", money3);
		System.out.printf(day3 + "\t" + buy4 + "\t" + "%,7d원\n", money4);
		System.out.printf(day3 + "\t" + buy5 + "\t\t" + "%,7d원\n", money5);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
