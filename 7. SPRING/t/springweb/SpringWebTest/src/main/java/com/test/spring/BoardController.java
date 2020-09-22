package com.test.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
/* @RequestMapping(value = "/list.action") */
public class BoardController {

	//글 목록
	@RequestMapping(value = "/list.action")
	public String list() {
		
		return "list"; 
		
	}
	
	//글 쓰기
	@RequestMapping(value = "/add.action")
	public String add() {
		
		return "add"; 
			
	}
	
	//글 쓰기완료
	@RequestMapping(value = "/addok.action")
	public void addok() {
		
		//PrinterWirter 출력 구현	
		
	}
	
	//글 보기
	@RequestMapping(value = "/view.action")
	public String view() {
		
		return "view"; 
			
	}
		
}
