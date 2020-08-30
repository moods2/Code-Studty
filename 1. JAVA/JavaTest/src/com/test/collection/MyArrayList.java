package com.test.collection;

import java.util.Arrays;

public class MyArrayList {
	
	private String[] list;
	private int index; //마지막 방번호
	
	public MyArrayList() {
		
		this.list = new String[10]; //중요!!
		this.index = 0;
		// this(10); 과 같다
		
	}
	
	public MyArrayList(int capacity) {
		
		this.list = new String[capacity];
		this.index = 0;
		
	}
	
	public void add(String item) {
		
		checkLength();
				
		this.list[index] = item; //첫번째 방
		this.index++; //증가
		
	}//add(append)

	private void checkLength() {
		String[] temp; //새 배열 생성
		
		if (this.index >= this.list.length) { //인덱스값이 기존배열의 길이보다 커지면
			
			temp = this.list; //기존 배열을 새 배열에 덮어쓴다
			System.out.println(Arrays.toString(temp));
			
			this.list = new String[this.index * 2]; //기존 배열을 인덱스값의 두배가 되게 재설정
			System.out.println(this.list.length);
			
			for (int i=0; i<temp.length; i++) { //옮겨둔 배열을 다시 받아옴
				
				this.list[i] = temp[i];
				
			}
			
		}
	}
	
	public String get(int index) {
		
		if (index >= 0 && index <= this.index) {
			
			return this.list[index];
		
		} else {
			
			throw new IndexOutOfBoundsException(); //강제 에러 발생
			
		}	
		
	}//get
	
	public int size() {
		
		return this.index;
		
	}//size

	public void set(int i, String string) {
		
		if (i >= 0 && i < this.index) {
			
			this.list[i] = string;
		
		} else {
			
			throw new IndexOutOfBoundsException(); //강제 에러 발생
			
		}
		
	}//set

	public void remove(int i) {
		
		if (i >= 0 && i < this.index) {
			
			for (int j=i; j<this.index-1; j++) {
				
				this.list[j] = this.list[j+1];				
			}
			
			this.index--;
		
		} else {
			
			throw new IndexOutOfBoundsException(); //강제 에러 발생
			
		}
		
	}//remove

	public void add(int i, String string) {
		
		if (i >= 0 && i < this.index) {
			
			//방이 모자란지 확인
			checkLength();
			
			for (int j=this.index-1; j>=i; j--) {
				
				this.list[j+1] = this.list[j];
				
			}
			
			this.list[i] = string;
			this.index++;
		
		} else {
			
			throw new IndexOutOfBoundsException(); //강제 에러 발생
			
		}
		
	}//add(insert)

	public int indexOf(String string) {
		
		for (int i=0; i<this.index; i++) {
			
			if (list[i].equals(string)) {
				return i;
			}
			
		}
		
		return -1;
		
	}//indexOf
	
	public int lastIndexOf(String string) {
		
		for (int i=this.index-1; i>=0; i--) {
			
			if (list[i].equals(string)) {
				return i;
			}
			
		}
		
		return -1;
		
	}//lastIndexOf

	public void clear() {
		
		this.index = 0; //인덱스값만 0으로 바꾸면 첫번째 배열부터 다시 채워나감(남은 쓰레기값은 무시)
		
	}//clear

	public boolean contains(String string) {
		
		for (int i=0; i<this.index; i++) {
	
			if (list[i].equals(string)) {
				
				return true;
				
			} 
			
		}
		
		return false;
		
	}//contains
	
	public void trimToSize() {
		
		String[] temp = new String[size()];
		
		for (int i=0; i<temp.length; i++) {
			
			temp[i] = this.list[i];
			
		}
		
		this.list = temp; //교체
		
	}//trimTiSize

	public boolean isEmpty() {
		
		return this.index == 0 ? true : false;
		
	}//isEmpty

	public MyArrayList subList(int fromIndex, int toIndex) {
		
		MyArrayList rainbow = new MyArrayList(toIndex - fromIndex);
		
		for (int i=fromIndex; i<toIndex; i++) {
			
			rainbow.add(this.list[i]);
				
		}
		
		return rainbow;
		
	}//subList		

	@Override
	public String toString() {
		return String.format("length: %d\nindex: %d\n%s\n"
				, this.list.length
				, this.index
				, Arrays.toString(this.list));
	}
	
}
