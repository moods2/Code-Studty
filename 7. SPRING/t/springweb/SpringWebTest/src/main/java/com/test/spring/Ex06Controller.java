package com.test.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Ex06Controller {

	@RequestMapping(value="/ex06.action")
	public String call() {
		
		return "ex06";
	}
	// doGet, doPost 역할
	// GET과 POST를 구분지어 요청받기
	//@RequestMapping(value="/ex06ok.action", method= {RequestMethod.GET}) //doGET()
	@RequestMapping(value="/ex06ok.action", method= {RequestMethod.POST}) //doPOST()
	public void callok() {
		
		System.out.println("호출댐~");
	}
	
}
