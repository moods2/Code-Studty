//이 라인은 주석 영역입니다.
//주석, Comment, Remark
//- 컴파일러에게 이 영역을 번역하지 마세요.. 라고 지시하는 역할

//주석의 종류
//1. 단일 라인 주석, Single Line Comment
//2. 다중 라인 주석, MultiLine Comment

//한 라인을 주석으로 
//만든다.

/*안녕하세요.
홍길동입니다.
하하하..*/

//Ctrl + '/' : 단일 라인 단축키
//Ctrl + Shift + '/' : 다중 라인 단축키
//문장입니다.


//단순히 물리적인 형식만 봤을 때 > 패키지, 클래스, 메소드 > 코드 집합

//package 패키지명
// - 현재 파일(클래스)이 소속되어 있는 패키지 명시
// - 패키지(Package) : 클래스를 담고있는 폴더
package com.test.begin;

//class 클래스명
// - 코드의 집합
// - 수많은 코드를 목적에 따라 분리하는 역할
public class Ex02 //클래스 헤더(Header) : 선언부 
{ //클래스 바디(Body) : 구현부
	
	//메소드, Method
	// - 코드의 집합
	public static void main(String[] args) //메소드 헤더 
	{ //메소드 바디
		
		//명령어 > 문장(Statement), ';' 문장 종결자
		System.out.println("안녕하세요.");
		
		System.out.println("반갑습니다.");
	}

}
