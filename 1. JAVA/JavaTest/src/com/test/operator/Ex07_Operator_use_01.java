package com.test.operator;

public class Ex07_Operator_use_01 {
	
	public static void main(String[] args) {
		
		//산술 연산자
		int a = 10;
		int b = 3;
		double c = 2.5;
		double d = 5;
		
		System.out.println(a + b); //정수 + 정수 = 정수
		System.out.println(a + c); //정수 + 실수 = 실수
		System.out.println(c + d); //실수 + 실수 = 실수
		System.out.println();
		
		System.out.println(a - b); //정수 - 정수 = 정수
		System.out.println(a - c); //정수 - 실수 = 실수
		System.out.println(c - d); //실수 - 실수 = 실수
		System.out.println();
		
		System.out.println(a / b); //정수 / 정수 = 정수
		System.out.println(a / c); //정수 / 실수 = 실수
		System.out.println(c / d); //실수 / 실수 = 실수
		System.out.println();
		
		
		a = 10;
		b = 3;
		c = 3;
		
		//*** 산술 연산자는 연산의 결과를 두 피연산자 중 '더 큰 자료형'으로 반환한다.
		//정수와 정수를 나누기 연산을 하면 결과가 정수가 된다.
		//정수와 실수를 나누기 연산을 하면 결과가 실수가 된다.
		System.out.println(a / b); //3
		System.out.println(a / c); //3.333333333
		
		//***
		a = 2100000000;
		b = 2100000000;
		System.out.println((long)a + b);
		
		
		//나머지 연산자
		// - 패턴 생성에 많이 사용
		
		//달력 만들기
		//1. 년.월
		// - 마지막 일이 몇일로 끝나는지
		//2. 년.월 1일
		// - 달력의 1일이 무슨 요일인지
		//3. 기준일 구하기
		// - 1970. 1. 1.
		
		
		//비교 연산자
		
		a = 10; //int
		c = 10.0; //double
		
		System.out.println(a > c);	//false
		System.out.println(a == c);	//true
		System.out.println();
		
		
		int age = 12; //키보드 입력
		
		//자격
		//1. 19세 이상
		System.out.println(age >= 19);	//권장
//		System.out.println(19 <= age);	//비권장
		
		//2. 60세 미만
		System.out.println(age < 60);
		System.out.println();
		
		
		//유효성 검사
		// - 사용자가 데이터를 입력할 때 올바른 데이터를 입력했는지 확인하는 검사
		
		//아이디 -> 영어 소문자(a(97) ~ z(122))
		char id = 'T';
		
		System.out.println((int)id >= (int)'a');
		System.out.println((int)id <= (int)'z');
		System.out.println();
		
		a = 10;
		b = 10;
		
		System.out.println(a == b);
		
		
		String s1 = "홍길동";
		String s2 = "홍길동";
		String s3 = "홍";
		s3 = s3 + "길동";
		System.out.println(s3);
		
		//문자열의 비교는 ==, != 연산자는 사용할 수 없다.
		System.out.println(s1 == s2);
		System.out.println(s1 == s3);
		System.out.println();
		//문자열의 비교는 equals 사용
		System.out.println(s1.equals(s2));
		System.out.println(s1.equals(s3));
		System.out.println();
		
		
		//논리 연산자
		//나이 : 19세 이상 ~ 60세 미만
		//		 19 <= age < 60
		age = 25;
		
//		System.out.println(19 <= age < 60);
//		System.out.println(true < 60);
		System.out.println(19 <= age && age < 60);
		System.out.println((age >= 19) && (age < 60)); //결론
		System.out.println();
		
		
		c = '홍';
		System.out.println((int)c >= (int)'a' && (int)c <= (int)'z');
		
		//영어 소문자
		System.out.println(c >= 'a' && c <= 'z'); //char끼리 비교시 문자코드로 비교해준다.(암시적 형변환)
		//영어 대문자
		System.out.println(c >= 'A' && c <= 'Z');
		//숫자
		System.out.println(c >= '0' && c <= '9');
		//한글
		System.out.println(c >= '가' && c <= '힣');
		System.out.println();
		
		
		int n = 10;
		int result = 0;
		
		//비권장(하나의 문장에 증감 연산자와 다른 연산자를 동시에 사용하지 말것)
//		result = 20 + ++n; //소괄호 제외하고 가장 우선
//		result = 20 + n++; //대입 연산자보다 우선순위가 낮아진다.
		
		//권장
		//result = 20 + ++n;
		++n;
		result = 20 + n;
		
		//result = 20 + n++;
		result = 20 + n;
		n++;
		
		System.out.println(result);
		System.out.println(n);
		System.out.println();
		
		int o = 10;
		System.out.println(--o-o--);
		
		
		
		
		
		
		
	}

}
