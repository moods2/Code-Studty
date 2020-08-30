package com.test.user.ticket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userheart.do")
public class UserHeart extends HttpServlet{
	
	
	//ajax 에 대한 처리를 수행할것이다. 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		int mySeq = (int)session.getAttribute("userseq");//유저의 seq 를 받아오기
		
		String showSeq  = req.getParameter("showseq");//공연seq
		int likeCount = Integer.parseInt(req.getParameter("likeCount"));//해당 공연 좋아요 개수
		String img = "";
		//String likeCount = ;
		
		
		System.out.println("**===!=====**");
		System.out.println(likeCount);
		System.out.println("**===!=====**");
		
		
		//여기서 이제 클릭할때마다 하트와 좋아요 수를 바꿀것이다.
		
		UserShowDAO dao = new UserShowDAO();
		
		int checkCount = dao.likecheck(showSeq,mySeq);
		
		if (checkCount == 0) {
			//진짜  한번도 하트를 안누른경우. -> insert를 해줄것이다.
			
			System.out.println("진짜  한번도 하트를 안누른경우");
			
			dao.insertHeart(mySeq,showSeq);//관심 공연으로 추가하는 작업수행.
			likeCount++;
			System.out.println("여기를 툭치고 지나간다고?");
			img = "heart2.png";
			
			
		} else {
			//하트를 한번이라도 누른 경우.
			
			int flagNum = dao.getLikeTrue(showSeq,mySeq);
			
			if (flagNum == 0) {
				//현재 좋아요 누른 상태라는 뜻. -> 좋아요를 뗄것이다.
				dao.updateLikeState(showSeq,mySeq,1);//delfalg = 1 로 업데이트 시킴.
				likeCount--;
				img = "heart.png";
				System.out.println("현재 좋아요 누른 상태라는 뜻.");
				
				
			} else {
				//현재 좋아요를 뗀 상태라는 뜻. -> 다시 좋아요 누릏것.
				dao.updateLikeState(showSeq,mySeq,0);//delflag = 0 로 업데이트 시킴.
				likeCount++;
				img = "heart2.png";
				System.out.println("현재 좋아요를 뗀 상태라는 뜻");
			}
			
			
		}
		
		//System.out.println("===!============");
		//System.out.println(likeCount);
		//System.out.println("===!===========");
		System.out.println("===!=====");
		System.out.println(likeCount);
		System.out.println("===!=====");
		/*
	 	
	 	"seq": "10",
	 	"zipcode" : "120-120",
	
		"likeCount" : "31"
		"img" : "./images/heart2.png"
		
		"pass" : "fail"
	
		*/
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		//writer.print(result);
		String temp = "";
		
		//배열정보를 생성해서 넘길것이다.
		//temp += "[";
		temp += "{";
		
		temp += String.format("\"likeCount\" : \"%d\",",likeCount);
		temp += String.format("\"img\" : \"./images/%s\"",img);
		
		
		temp += "}";
		//temp += "]";
		
		System.out.println("=============");
		System.out.println(temp);
		System.out.println("=============");

		
		writer.print(temp);
		writer.close();
		
	}
	
}
