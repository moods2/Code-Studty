package com.test.collection;

import java.util.Arrays;

public class MyQueue {
	
	private String[] list;
	private int index;
		
	public MyQueue() {
		
		this.list = new String[10];
		this.index = 0;
		
	}
		
	public void add(String value) {
		
		String[] temp = new String[10];
		
		if (this.index >= this.list.length) {
			
			temp = this.list;
			
			this.list = new String[index * 2];
						
			for (int i=0; i<temp.length; i++) {
				
				this.list[i] = temp[i];
				
			}
	
		}
		
		this.list[index] = value;
		this.index++;
		
	}//값을 순차적으로 추가
	
	public String poll() {
		
		String result = "";
		
		result = list[0];
		
		for (int i=0; i<index; i++) {
			
			list[i] = list[i+1];
			
		}
		
		index--;

		return result;
		
	}//값을 순차적으로 가져옴
	
	public int size() {

		return this.index;
		
	}//요소의 개수를 반환
	
	public String peek() {
				
		return this.list[0];
		
	}//이번에 가져올 값을 확인
	
	public void clear() {
		
		this.index = 0;		
		
	}//배열의 모든 요소를 삭제
	
	public void trimToSize() {
		
		String[] temp = new String[size()];
		
		for (int i=0; i<index; i++) {
			
			temp[i] = list[i];
			
		}
		
		this.list = temp;
		
		
		
	}//요소의 개수만큼 배열의 길이를 줄임

	@Override
	public String toString() {
		return String.format("length: %d\nindex: %d\n%s\n"
				, this.list.length
				, this.index
				, Arrays.toString(this.list));
	}
	
}
