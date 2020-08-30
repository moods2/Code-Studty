package com.test.admin.coupon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/coupon/couponedit.do")
public class CouponEdit extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//-------------------사용가능한 공연 데이터 불러오기 시작
		
		AdminCouponDAO dao = new AdminCouponDAO();
		
		ArrayList<AdminShowDTO> list = new ArrayList<AdminShowDTO>();
		
		list = dao.getShowList();//AdminShowDTO 객체가 들어있는 리스트.
		
		//System.out.println(list.size());
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getTitle());
		}
		
		//System.out.println(req.getParameter("editnum"));
		
		//-------------------사용가능한 공연 데이터 불러오기 끝
		
		
		
		//수정할 쿠폰에 엮여있는 공연의 기간을 불러오자...
		String editNum = req.getParameter("editnum");//수정할 쿠폰 seq
		
		//수정할 쿠폰에 엮여있는 공연의 공연번호를 알아오자.
		String editShowSeq = dao.getShowNum(editNum);
		//System.out.println("공연번호");
		//System.out.println(editShowSeq);
		
		//AdminCouponDTO cdto = new AdminCouponDTO();
		
		
		//먼저 해당 seq 에 엮여있는 공연의 공연기간을 가져오자.
		
		List<String> seqTermList = new ArrayList<String>();
		seqTermList = dao.getSeqShowTerm(editNum);
		
		String seqShowTerm = seqTermList.get(0) + "~" + seqTermList.get(1);
		
		//System.out.println("******************");
		//System.out.println(seqShowTerm);
		
		
		List<String> couponInfoList = new ArrayList<String>();//수정될때 넘어갈 쿠폰명,쿠폰사용 가능기간,할인금액을 받아올것이다
		couponInfoList = dao.getCouponInfoList(editNum);//여기서 오류가 발생하는데?
		
		System.out.println("사이즈는?***********");
		//System.out.println(couponInfoList.size());
		
		String coupTitle = couponInfoList.get(0);//쿠폰이름
		String coupStartDate = couponInfoList.get(1);//쿠폰 시작일
		String coupEndDate = couponInfoList.get(2);//쿠폰 끝나는일
		String coupDiscount = couponInfoList.get(3);//쿠폰 할인액
		
//		System.out.println("--------------");
//		System.out.println(coupTitle);
//		System.out.println(coupStartDate);
//		System.out.println(coupEndDate);
//		System.out.println(coupDiscount);
//		System.out.println("--------------");

		
		req.setAttribute("coupTitle", coupTitle);
		req.setAttribute("coupStartDate",coupStartDate);
		req.setAttribute("coupEndDate", coupEndDate);
		req.setAttribute("coupDiscount", coupDiscount);
		
		req.setAttribute("editNum", editNum);//현재 수정중인 쿠폰 seq 를 넘길것이다.
		req.setAttribute("editShowSeq", editShowSeq);
		req.setAttribute("seqShowTerm",seqShowTerm);//공연기간을 넘겨줄것이다.
		req.setAttribute("showList", list);//list 를 넘겨줄 것이다.
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/coupon/couponedit.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
}
