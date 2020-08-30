package com.test.collection;

import java.util.Arrays;

public class MyHashMap {

	private String[] keyList;
	private String[] valueList;
//	private MapItem[] list;	
	private int index;
	
	public MyHashMap() {
		
		this.keyList = new String[10];
		this.valueList = new String[10];
		this.index = 0;
	}
	
	
	public void put(String key, String value) {
		
		checkLength();
		
		for (int i=0; i<this.index; i++) {
			
			if(keyList[i].equals(key)) {
				
				valueList[i] = value;
				return; //리턴 시 메소드가 끝남
			}
			
		}	
		
		this.keyList[index] = key; 
		this.valueList[index] = value;
		this.index++;
		
	}//키와 값 추가


	private void checkLength() {
		String[] temp;
		String[] temp2;
		
		if (this.index >= keyList.length) {
			
			temp = this.keyList;
			temp2 = this.valueList;
			
			this.keyList = new String[this.index * 2];
			this.valueList = new String[this.index * 2];
			
			for (int i=0; i<temp.length; i++) {
				
				keyList[i] = temp[i];
				valueList[i] = temp2[i];
				
			}
			
		}
	}//checkLength
	
	public String get(String key) {
		
		for (int i=0; i<this.index; i++) {
			
			if (keyList[i].equals(key)) {
				
				return valueList[i];
				
			}
			
		}
		
		return null;
		
	}//키에 대응하는 요소 값 가져오기
	
	public int size() {
		
		return this.index;
		
	}//요소의 개수 반환
	
	public void remove(String key) {
		
		for (int i=0; i<this.index; i++) {
			
			if(keyList[i].equals(key)) {
				
				keyList[i] = keyList[i+1];
				valueList[i] = valueList[i+1];
				
			}
			
		}
		
	}//원하는 키의 요소 삭제
	
	public boolean containKey(String key) {
		
		for (int i=0; i<this.index; i++) {
			
			if (keyList[i].equals(key)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}//해당 키가 존재하는지 확인
	
	public boolean containsValue(String value) {
		
		for (int i=0; i<this.index; i++) {
			
			if (valueList[i].equals(value)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}//해당 값이 존재하는지 확인
	
	public void clear() {
		
		this.index = 0;
		
	}//배열의 모든 요소를 삭제
	
	@Override
	public String toString() {
		return String.format("length: %d\nindex: %d\n%s\n%s\n"
				, this.keyList.length
				, this.index
				, Arrays.toString(this.keyList)
				, Arrays.toString(this.valueList));
	}

}

//class MapItem {
//	
//	private String key;
//	private String value;
//	
//}