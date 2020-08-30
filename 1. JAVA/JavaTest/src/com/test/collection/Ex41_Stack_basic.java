package com.test.collection;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class Ex41_Stack_basic {
	
	public static void main(String[] args) {
		
		//Stack, 스택
		// - 후입선출
		// - LIFO, Last Input First Output
		
		
		//Queue, 큐
		// - 선입선출
		// - FIFO, First Input First Output
		
		
//		m1();
		m2();
		
		
	}

	private static void m2() {
		//인터페이스
		Queue<String> queue = new LinkedList<String>(); //선입선출
		
		queue.add("빨강");
		queue.add("파랑");
		queue.add("노랑");
		
		System.out.println(queue.size());
		
		System.out.println(queue.poll());
		System.out.println(queue.poll());
		System.out.println(queue.poll());
		System.out.println(queue.poll()); //아무것도 없는데 호출해도 에러가 안남
		
		System.out.println(queue.size());
		
		queue.add("빨강");
		queue.add("파랑");
		queue.add("노랑");
		
		System.out.println(queue.peek());
		System.out.println(queue.peek());
		System.out.println(queue.peek());
		
		while (queue.size() > 0) {
			System.out.println(queue.poll());
		}
		System.out.println(queue.size());
		
		
		
		
	}

	private static void m1() {
		
		Stack<String> stack = new Stack<String>(); //후입선출
		
		stack.push("강아지");
		stack.push("고양이");
		stack.push("병아리");
		
		System.out.println(stack.size());
		
//		System.out.println(stack.pop()); //index 사용 안함
//		System.out.println(stack.pop());
//		System.out.println(stack.pop());
//		System.out.println(stack.pop()); //아무것도 없는데 호출시 에러
		
		//모든 요소 꺼내기
		while (stack.size() > 0) {
			System.out.println(stack.pop());			
		}
		
		//if (stack.size() > 0) {
		if (!stack.isEmpty()) {
			System.out.println(stack.pop());
		}
				
		System.out.println(stack.size());
		
		stack.push("강아지");
		stack.push("고양이");
		stack.push("병아리");
		stack.push("병아리");
		stack.push("병아리");
		
		System.out.println(stack);
		
		stack.clear();
		
		System.out.println(stack);
		
		stack.push("강아지");
		stack.push("고양이");
		stack.push("병아리");
		
		System.out.println(stack.peek());	//읽기만
		System.out.println(stack.peek());
		System.out.println(stack.peek());
		System.out.println(stack.peek());
		System.out.println(stack.peek());
		System.out.println(stack.pop());	//읽기 + 삭제
		
		//Vector는 거의 사용안함 (stack의 부모클래스) -> ArrayList와 비슷하지만 폐기 직전.
		
	}

}
