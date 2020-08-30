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

@WebServlet("/usersemishowreservation.do")
public class UserSemiShowReservation extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//여기서 해당 공연에 대해 날짜 시간에 대한  회차 -> 시간을 불러올 것이다.
		
		String showSeq = req.getParameter("showseq");//공연번호
		
		System.out.println("asdhklasdjfhaklsdjfh");
		System.out.println(showSeq);
		//해당 공연에 해당하는 회차 객체를 불러오자.
		//List<UserShowRound> roundList = new ArrayList<UserShowRound>();//해당 공연에 존재하는 회차객체들을 담기 위함.
		UserShowDAO dao = new UserShowDAO();
		List<UserShowRoundDTO> roundList = dao.getRoundInfo(showSeq);//해당 공연번호에 해당하는 회차객체를 가져옴
		
		

		//System.out.println(roundList.size());


		
		JSONArray arr = new JSONArray();//json 에 넘겨줄 객체생성
		
		
		
		for (UserShowRoundDTO dto : roundList) {
			JSONObject obj = new JSONObject();
			obj.put("rseq", dto.getRseq());//회차 seq 를 집어넣는다.
			obj.put("rstartTime",dto.getRstartTime());
			obj.put("rendTime",dto.getRendTime());
			obj.put("rshowSeq",dto.getShowSeq());
			obj.put("rdelflag",dto.getDelflag());
			
			arr.add(obj);
		}
				


		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();		
		writer.print(arr);
		writer.close();
		//이렇게 하면 해당 공연에 대한 회차정보는 모두 넘긴것이다.
		
		
	}
}
