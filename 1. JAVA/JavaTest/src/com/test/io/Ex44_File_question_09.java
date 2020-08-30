package com.test.io;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

public class Ex44_File_question_09 {
	
	public static void main(String[] args) {
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		Scanner scan = new Scanner(System.in);
		
		
		for (int i=0; i<10; i++) {
			
			System.out.print("숫자 : ");
			int num = scan.nextInt();
			list.add(num);			
		
		}
		
		System.out.println(list);
		
		Collections.reverse(list);
		
		System.out.println(list);
		
		Collections.sort(list, new Compare());
		
		System.out.println(list);
		
	}

}

class Compare implements Comparator<Integer> {

	@Override
	public int compare(Integer o1, Integer o2) {
		
		return o2.compareTo(o1);
	}
	
	
	
}