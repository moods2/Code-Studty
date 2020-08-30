package com.test.user.ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/usershowavailseat.do")
public class UserShowAvailSeat extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//여기에서 좌석정보를 넘겨줄것이다.
		
		String showSeq = req.getParameter("showseq");//공연 seq.
		String showRoundSeq = req.getParameter("showroundSeq");//공연 회차 번호.
		String conDate = req.getParameter("conDate").replace("-", "/");//몇일 공연인지.
		//String showDate = 
		System.out.println("====공연seq====");
		System.out.println(showSeq);
		System.out.println("====공연회차seq====");
		System.out.println(showRoundSeq);
		System.out.println("====몇일공연?====");
		System.out.println(conDate);
		
		//아래에서 이제 좌석에 대한정보를 가져올것!..-> dao 연결 필요성
		
		UserShowDAO dao = new UserShowDAO();
		List<UserShowTicktAllDTO> usedSeatList = dao.getUsedSeat(showSeq,showRoundSeq,conDate);//지금 예약이 된 seat만 불러올 것임.
		
		System.out.println(usedSeatList.size());//사이즈가 0이 나온다고?
		
		JSONArray arr = new JSONArray();//json 에 넘겨줄 객체생성
		
		
		
		for (UserShowTicktAllDTO dto : usedSeatList) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("usedSeq",dto.getSeq());
			obj.put("usedFloor",dto.getFloor());
			obj.put("usedArea",dto.getArea());
			obj.put("usedSeatRow",dto.getSeatrow());
			obj.put("usedSeatCol",dto.getSeatcol());
			
			arr.add(obj);
		}
		
		System.out.println("풍문으로");
		//System.out.println(arr.get(0));
	//	System.out.println(arr.get(1));
		System.out.println("풍문으로");
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();//result 로 넘겨준다.		
		writer.print(arr);
		writer.close();
	}
	
	
}
