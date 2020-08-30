package com.test.admin.main;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminsecure.do")
public class AdminSecure extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		Random rnd = new Random();
		
		String[] secureSubjectObject = {"bird","cat","dog","laptop","airplane","apartment","car","phone","sea"};//보안코드 이미지의 들어갈 객체이름 생성
		String[] secureSubjectName = {"새","고양이","개","노트북","비행기","아파트","자동차","스마트폰","바다"};//보안코드 이미지의 들어갈 객체이름 생성
		
		int selectNum =  rnd.nextInt(secureSubjectObject.length);
		String throwSubject = secureSubjectObject[selectNum];//넘길객체 랜덤으로 지정
		String throwName = secureSubjectName[selectNum];//넘길객체 랜덤으로 지정
		
		
		req.setAttribute("throwSubject", throwSubject);//객체를 넘김
		req.setAttribute("throwName", throwName);//객체의 이름을 넘김
		
		//전체 사진을 나열해준다
		String[] toitalNameList = {"bird01.jpg","bird02.jpg","cat01.jpg","cat02.jpg","cat03.jpg","cat04.jpg","dog01.jpg","dog02.jpg","dog03.jpg","dog04.jpg","dog05.jpg","laptop01.jpg","laptop02.jpg","laptop03.jpg","laptop04.jpg","laptop05.jpg",
		"airplane01.jpg","airplane02.jpg","airplane03.jpg","airplane04.jpg","airplane05.jpg","airplane06.jpg","airplane07.jpg","airplane08.jpg","airplane09.jpg","airplane10.jpg",
		"apartment01.jpg","apartment02.jpg","apartment03.jpg","apartment04.jpg","apartment05.jpg","apartment06.jpg","apartment07.jpg","apartment08.jpg","apartment09.jpg","apartment10.jpg",
		"car01.jpg","car02.jpg","car03.jpg","car04.jpg","car05.jpg","car06.jpg","car07.jpg","car08.jpg","car09.jpg","car10.jpg",
		"phone01.jpg","phone02.jpg","phone03.jpg","phone04.jpg","phone05.jpg","phone06.jpg","phone07.jpg","phone08.jpg","phone09.jpg","phone10.jpg",
		"sea01.jpg","sea02.jpg","sea03.jpg","sea04.jpg","sea05.jpg","sea06.jpg","sea07.jpg","sea08.jpg","sea09.jpg","sea10.jpg"
		};
		
		
		//섞기 알고리즘
		int w=0;
	    int r;
	    String temp = "";
	    while(w < toitalNameList.length){
	      //0~49의 수를 랜덤하게 뽑아낸다.
	      r = (int)(Math.random()*toitalNameList.length);
	      //만약 두 인덱스가 다르다면
	      if(w!=r){
	        //swap으로 값을 바꾼다.
	        temp =  toitalNameList[w];
	        toitalNameList[w] = toitalNameList[r];
	        toitalNameList[r] = temp;
	        w++;
	      }
	    }
	    
	    
	    String[] throwPicList = new String[9];//진짜로 넘겨줄 9개의 그림
	    
	    //jsp 로 넘겨줄 데이터
	    for (int i = 0; i < 9; i++) {
	    	throwPicList[i] = toitalNameList[i];
	    }
		
	    //지울것이다
	    System.out.println(throwSubject);
	    System.out.println(throwName);
	    
	    int matchCount = 0;//몇개가 일치하는지 넘겨줄것이다.
	    
	    for (int i = 0; i < throwPicList.length; i++) {
	    	System.out.println(throwPicList[i]);
	    	System.out.println(throwPicList[i].indexOf(throwSubject));
	    	if (throwPicList[i].indexOf(throwSubject) != -1) {
	    		matchCount++;
	    	}
	    }
	    
	    System.out.println(matchCount);//현재 넘어간 이미지중에 타이틀과 맞는 이미지의 개수
	    
	    
		req.setAttribute("throwPicList", throwPicList);//선택된 그림의 리스트를 넘겨준다.
		req.setAttribute("matchCount", matchCount);//정답개수를 넘겨준다.
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/security/adminsecurity.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	
}
