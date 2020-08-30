package com.test.admin.employee;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminemployee.do")
public class AdminEmployee extends HttpServlet{
	
	//인사관리 게시판 형식
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		String search = req.getParameter("search");//검색창에 뭘 적었는
		String sort = req.getParameter("sort");//차순정렬을 시행하고 있는지
		
		String temp = "";
		
		if(sort == null || sort == "") {//차순정렬값이 없는경우 -> 그냥 보고 있는경우 -> seq 오름차순으로 정렬할것이다
			sort = "seq desc"; //기본값
		}
		
		AdminEmployeeDAO dao = new AdminEmployeeDAO();
		
		ArrayList<AdminEmployeeDTO> list = new ArrayList<AdminEmployeeDTO>();
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("search",search);//위에서 검색창에 입력했거나 없던 내용을 map에 집어넣는다.
		
		if(sort.equals("write")) {
			sort = "rnum desc";
		}else if(sort.equals("desc")) {
			sort = "seq desc";
		}else if(sort.equals("asc")) {
			sort = "seq asc";
		}
		//정렬을 시켜준다.
		
		
		map.put("sort",sort);//위에서 받아온 정렬값을  sort에 넣어주고 map에 넣는다. 처음에는 sort -> seq asc 로 들어갈 것이다.
		
		// 페이징 처리 관련 변수
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 15; // 한 페이지당 출력 갯수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련 변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 10; // 페이지바 관련 변수 해당 바에 한번에 몇개까지 보일건지 정해준다.
		
		
		// list.do -> list.do?page=1 변경
		// list.do?page=3
		String page = req.getParameter("page");//처음에는 null로 넘어갈 것이다.
		//이값은 url 에 get방식으로 받아올 값이라고 생각해주면 된다.

		
		if (page == null || page == "")
			nowPage = 1; // default
		else
			nowPage = Integer.parseInt(page);
		
		// nowPage -> 보려는 페이지 번호!!
		// 1page -> where rnum >= 1 and rnum <= 10
		//begin -> 페이지 바에서 보이는 시작번호
		//end -> 페이지 바에서 보이는 끝번호.
		begin = ((nowPage - 1) * pageSize) + 1;//시작 페이지
		end = begin + pageSize - 1;//끝페이지
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		
		//총 페이지 수 계산하기
		//총 페이지 수 = 총 게시물 수 / 한 페이지당 출력 게시물 수
		totalCount =  dao.getTotalCount(map);//총 게시물수!
		
		
		
		//테스트 시작
		//System.out.println(totalCount);//-> 200개가 정상적으로 나오게 된다.
		//테스트 끝
		
		totalPage = (int)Math.ceil((double)totalCount / pageSize);//페이징 처리 몇 페이지 까지 있는지...처리를 해준다.
		//System.out.println(dao.getList(map).get(0).getName());
		list = dao.getList(map);
		
		//여기가 검색된 내용 빨간색으로 표시해주는 영역
		for(AdminEmployeeDTO dto : list) {
			
			      if (search != null && search != "") {
			          
			          String tname = dto.getName();
			          tname = tname.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			          dto.setName(tname);
			          
			          String tbuseo = dto.getBuseo();
			          tbuseo= tbuseo.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			          dto.setBuseo(tbuseo);
			          
			          String tjikwi = dto.getJikwi();
			          tjikwi = tjikwi.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			          dto.setJikwi(tjikwi);
			          
			          String tsalary = dto.getSalary();
			          tsalary = tsalary.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			          dto.setSalary(tsalary);
			          
			          String tssn = dto.getSsn();
			          tssn = tssn.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			          dto.setSsn(tssn);
			          
			          
			          String ttel = dto.getTel();
			          ttel= ttel.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			          dto.setTel(ttel);
			          
			       }
		}

		//페이지바 제작
		loop = 1;//페이지바가 몇번 루프로 도냐는 말인듯.
		
		n = ((nowPage - 1) / blockSize) * blockSize + 1;//n은 페이지바 관련 변수이다.
		
		String pagebar = "";

		pagebar += "<nav class=\"pagebar\">";
		pagebar += "<ul class=\"pagination\">";
		
		
		// 이전 10페이지
		if (n == 1) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/AtTicketProject/adminemployee.do?page=%d\" aria-label=\"Previous\">", n - 1);
			//pagebar += String.format("<a href=\"/AtTicketProject/adminemployee.do?page=%d&search=%s&sort=%s\" aria-label=\"Previous\">",search,sort, n - 1);
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
		
		
		// for(int i=1; i<=totalPage; i++) {
		//while (!(loop > blockSize || n > totalPage)) {
		while((loop <= blockSize && n <= totalPage)) {
			
			// 페이지 번호
			if (n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n);
				pagebar += "</li>";
			} else {
				pagebar += "<li>";
				//pagebar += String.format("<a href=\"/AtTicketProject/adminemployee.do?search=%s&page=%d\">%d</a>",(search == null) ? :search, n, n);
				if (search != null) {
					pagebar += String.format("<a href=\"/AtTicketProject/adminemployee.do?search=%s&page=%d\">%d</a>",search, n, n);	
				} else {
					pagebar += String.format("<a href=\"/AtTicketProject/adminemployee.do?page=%d\">%d</a>",n, n);
				}
				pagebar += "</li>";
			}
			loop++;
			n++;
		}
		
		
		// 다음 10페이지
		if (n > totalPage) {
			// 최대페이지까지만 가게 하자
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Next\">";
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/AtTicketProject/adminemployee.do?page=%d\" aria-label=\"Next\">", n);
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}

		pagebar += "</ul>";
		pagebar += "</nav>";
		
		
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("pagebar", pagebar);
		
		
		
		//3. 결과 반환 + jsp 호출하기
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/employee/adminemployee.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
