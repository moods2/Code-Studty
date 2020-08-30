package com.test.collection;

import java.util.Arrays;

public class MyList {
	
	private String[] list;
	private int index; //마지막 방번호
	
	public MyList() {
		
		this.list = new String[10]; //중요!!
		this.index = 0;
		
	}
	
	public MyList(int capacity) {
		
		this.list = new String[capacity];
		this.index = 0;
		
	}
	
	public void add(String item) {
		
		String[] temp;
		
		if (index + 1 == list.length + 1) {
			
			temp = list;
			System.out.println(Arrays.toString(temp));
			
			this.list = new String[index * 2];
			System.out.println(this.list.length);
			
			for (int i=0; i<temp.length; i++) {
				
				list[i] = temp[i];
				
			}
			
		}
				
		this.list[index] = item; //첫번째 방
		this.index++; //증가
		
	}//add(append)
	
	public String get(int index) {
		
		if (index >= 0 && index < size()) {
			
			return this.list[index];
		
		} else {
			
			throw new IndexOutOfBoundsException(); //강제 에러 발생
			
		}	
		
	}//get
	
	public int size() {
		
		return this.index;
		
	}//size

	public void set(int i, String string) {
		
		list[i] = string;
		
	}//set

	public void remove(int i) {
		
		for (int j=i; j<list.length-1; j++) {
			
			list[j] = list[j+1];
			
			if (list[j] == null) {
				
				list[j] = "";
				
			}
			
		}

	}//remove

	public void add(int i, String string) {
		
		for (int j=list.length-2; j>=i; j--) {
			
			list[j+1] = list[j];
			
		}
		
		list[i] = string;
		
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
		
		
		return 0;
		
	}//lastIndexOf

	public void clear() {
		
		this.list = new String[10];
		this.index = 0;
		
	}//clear

	public boolean contains(String string) {
		
		boolean flag = false;
		
		for (int i=0; i<this.index; i++) {
	
			if (list[i].equals(string)) {
				
				flag = true;
				break;
				
			} else {
				
				flag = false;
				
			}
			
		}
		
		return flag;
		
	}//contains
	
	public void trimToSize() {
		
		
		
	}//trimTiSize

	public boolean isEmpty() {
		
		boolean flag = true;
		
		for (int i=0; i<this.index; i++) {
			
			if (!list[i].equals("")) {
				
				flag = false;
				
			} 
			
		}
		
		return flag;
		
	}//isEmpty

	public MyList subList(int fromIndex, int toIndex) {
		
		MyList rainbow = new MyList();
		
		for (int i=0; i<list.length; i++) {
			
			if (i >= fromIndex && i <= toIndex) {
			
			rainbow.add(list[i]);
			
			}
				
		}
		
		return rainbow;
		
	}//subList		

}
