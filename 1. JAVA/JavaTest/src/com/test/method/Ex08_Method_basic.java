package com.test.method;

//Allman
public class Ex08_Method_basic { 
	
	//main 메소드
	// - 특수한 메소드
	// 1. 이름이 예약어(main)
	// 2. 실행을 개발자가 직접하지 않고, 자바의 JRE(JVM)가 자동으로 호출한다.
	// 3. 프로그램의 시작점(Entry Point) ~ 프로그램의 종착점(End Point)
	
	public static void main(String[] args) { //K&R
			
		//메소드, Method
		// - 메소드, 함수(Function), 프로시저(Procedure), 서브루틴(Sub Routine)..
		// - 객체내에 존재하는 함수로 메소드라고 한다.
		// A -> 함수 -> B
		// - "특정 행동을 하는 코드의 집합" > Behavior
		
		//요구사항] "안녕하세요" x 5번 출력
		//수정사항] "반갑습니다." 수정
		System.out.println("반갑습니다.");
		System.out.println("안녕하세요.");
		System.out.println("안녕하세요.");
		System.out.println("안녕하세요.");
		System.out.println("안녕하세요.");
		System.out.println();
				
		/*
		메소드 사용법
		1. 메소드 정의하기(선언하기)
		
		public static void 메소드명() {
			실행코드;
			실행코드;
			...
		}
		
		접근지정자 정적키워드 반환타입 메소드명(인자리스트) {
			실행코드;
			실행코드;
			...
		}
		
		2. 메소드 호출하기(사용하기)
		
		메소드명();
		
		3. 메소드의 사용 목적(이유, 장점)
			a. 코드 재사용
			b. 유지/보수성 좋음
			c. 비용 절감(인건비 감소 등등..)
			d. 가독성 향상(코드가 목적에 따라 분리되어 관리)
		
		*/
		
		//요구사항] "안녕하세요" x 5번 출력
		hello();
		hello();
		hello();
		hello();
		hello();
		System.out.println();
		
		paramNoReturn(10); // 호출시 매개변수 초기화
		paramNoReturn(20);
		
		int a = 100;
		paramNoReturn(a); // 공간X, 값O
		
		//변수 = 10;
		int result = NoParamNoReturn(); //메소드 반환값 저장
		System.out.println(result);
		
		int b = 5;
		result = paramReturn(b);
		System.out.println(result);
		
		result = paramReturn(10);
		System.out.println(result);
		
		
		//에러(Error), 오류, 예외(Exception), 버그(Bug)
		
		//에러의 종류
		
		//1. 컴파일 오류
		// - 컴파일 과정에서 발견되는 오류
		// - 프로그래밍 언어 -> 기계어 번역 중에 발견되는 오류
		// - 문법이 틀린 오류(***)
		// - 컴파일러가 발견하는 오류(javac.exe)
		// - 난이도 하, 발견률 상
		// - 친절한 에러 메시지(원인, 발견 코드 위치)
		// - 사용자 오타..
		
		//2. 런타임 오류
		// - Runtime Error
		// - 프로그램을 실행 중에 발생하는 오류
		// - 예외(Exception)
		// - 실행 중 발생, 경우레 따라 발생이 안되는 경우도 있음
		// - ex) 숫자 -> 실제 숫자 변환 -> + 연산
		//		 입력 : A
		// - 난이도 중, 발견률 중
		
		//3. 논리 오류
		// - 문법O, 실행O, > 결과 문제 발견
		// - 난이도 상, 발견 상
		
		int a1 = 10;
		int b1 = 3;
		System.out.println(a1 + b1);
		
//		int num = 0;//숫자입력
//		System.out.printf("100 / %d = %d", num, 100 / num);
		
		System.out.println();
		System.out.println();
		
		int num = 20;
		m1();
		m1();
		m1();
		
//		int num = 20;
		
		//System.out.println(num); // num cannot be resolved to a variable
		
		
		//메소드 오버로딩, Method Overloading
		// - 메소드가 매개변수의 구성을 다양한 형태로 가질수 있게 하는 기술
		// - 같은 이름의 메소드를 여러 개 만들 수 있는 기술
		// - 개발자의 가독성 때문에 사용하는 기술
		
		//메소드 오버로딩 조건 O
		//1. 인자의 갯수
		//2. 인자의 타입
		
		
		//메소드 오버로딩 조건 X
		//1. 인자의 이름
		//2. 반환값의 타입
		
		//메소드를 호출
		//test();					//1.
		//test(10);					//3.
		//test("문자열");			//5.
		//test(10, 20);				//6.
		//test(10, "문자열");		//7.
		//int result = test(10);	//8. 처음 test(10)을 호출할 때 3번과 8번이 중복되기 때문에 / 반환값은 호출한 후의 문제
		
		//메소드를 만드는 중..
		//1. public static void test() {}					//O
		//2. public static void test() {}					//X, 1.
		//3. public static void test(int n) {}				//O
		//4. public static void test(int m) {}				//X, 3. 
		//5. public static void test(String n) {}			//O 
		//6. public static void test(int n, int m) {}		//O 
		//7. public static void test(int n, String m) {}	//O 
		//8. public static int test(int n) {}				//X 
		
		
		
		//메소드 오버라이딩
		
		
		
		hello();
		hello("홍길동");
		
		System.out.println(100);
		System.out.println("문자열");
		System.out.println(true);
		
		
	}//main
	
	public static void println(int num) {
		
		//구현..
		
	}
	
	
	//Duplicate method hello() in type Ex08_Method_basic
//	public static void hello() {
//		
//		
//	}
	
	
	public static void hello(String name) {
		
		System.out.printf("%s님 안녕하세요.\n", name);		
		
	}


	public static void m1() {
		
//		System.out.println(m);
		
		//Local Variable, 지역 변수
		// - 메소드 영역내에서 선언되고 사용되는 변수
		//변수의 생명주기, Life Cycle
		// - 변수가 언제 태어나고, 언제 소멸되는지?
		
		int num = 10;		
		System.out.println(num);
		
	}
	
	
	//4. 매개변수 O, 반환값 O > 함수(Function)
		public static int paramReturn(int num) {
			
			int result = num * 2;
			
			return result;
			
			
		}
		
		
	//3. 매개변수 X, 반환값 O
		public static int NoParamNoReturn() {
					
			//This method must return a result of type int
			//return 문, 반환문
			
			return 10;
			
			
		}
	
	
	//2. 매개변수 O, 반환값 X
			public static void paramNoReturn(int num) {
				
				//int(num) : 매개변수 : 값을 넣지못함
				//int num;
				
				System.out.println(num + 100);
				
				
		}
		
		
	//1. 매개변수 X, 반환값 X
			public static void noParamNoReturn() {
				
				//() : 매개변수 X
				//void : 반환값 X
				
				
		}
	
			
	//메소드 선언하기
	public static void hello() {
		
		System.out.println("반갑습니다.222");
		
		
		}
			
	
}//Ex08_Method_basic
