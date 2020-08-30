package com.test.two;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Random;



public class Teacher_Data {
	
		public static void main(String[] args) throws IOException {
			
			dummy();
		
		} //main
		
		private static void dummy() throws IOException {
			// 테스트용 데이터 x 20명
			
			int length = 30;
			String[] temp1 = { "김", "이", "박", "최", "정", "진","홍" };
			String[] temp2 = { "유", "정", "석", "인", "지", "은", "형", "순", "성", "민" };
			String[] temp3 = { "서울시", "인천시", "부산시", "대전시", "광주시" };
			String[] temp4 = { "강남구", "강서구", "강북구", "강동구" };
			String[] temp5 = { "자바", "파이썬", "C#", "안드로이드", "리눅스", "HTML", "WML", "Javascript"};
			Random rnd = new Random();
			String path = "C:\\Users\\user\\Desktop\\teacher.txt";
			File file = new File(path);
			BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\user\\Desktop\\teacher.txt"));	
			
			//System.out.println(key);
			HashMap <Integer,Teacher> map = new HashMap<Integer,Teacher>();
			
			for(int i=0;i<length;i++) {
				Teacher s = new Teacher();
				map.put(i, s);
			}
			
			int cnt=1;
			if (file.exists()) {
				for (int i=0;i<length;i++) {
					Teacher.temp++;
					map.get(i).setSeq(Teacher.temp);

					String name = temp1[rnd.nextInt(temp1.length)] + temp2[rnd.nextInt(temp2.length)]
							+ temp2[rnd.nextInt(temp2.length)];

					int age = rnd.nextInt(10) + 20;

					String address = temp3[rnd.nextInt(temp3.length)] + " " + temp4[rnd.nextInt(temp4.length)];
					String tel = "010-" + (rnd.nextInt(9000) + 1000) + "-" + (rnd.nextInt(9000) + 1000);
					map.get(i).setKey(cnt);
					map.get(i).setName(name);
					map.get(i).setAge(age);
					map.get(i).setAddress(address);
					map.get(i).setTel(tel);
					map.get(i).setSubject(temp5[rnd.nextInt(temp5.length)]);
					writer.write(map.get(i).getSeq() + "," + map.get(i).getName() + "," + map.get(i).getAge() + ","
								+ map.get(i).getSubject() + "," + map.get(i).getTel() +","+ map.get(i).getKey()+"\r\n");
					cnt++;
					}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			
			writer.close();
			System.out.println("완료");

		}

}

