package com.test.spring;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

//보조업무 객체
@Aspect
@Component
public class Auth {
	
	//주업무 메소드 > 포인트컷
	@Pointcut("execution(public String AOPController.member*(..))")
	public void pc1() {
		
	}
	
	//Weaving = 보조업무 + 주업무
	@Before("pc1()")
	public void check(JoinPoint joinPoint) {
		//System.out.println("인증을 확인합니다.");
		
		//현재 주업무를 발생시킨 유저가 로그인 상태인지?
		
		HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
		HttpServletResponse response = (HttpServletResponse)joinPoint.getArgs()[1];
		HttpSession session = (HttpSession)joinPoint.getArgs()[2];
		
		if(session.getAttribute("id") == null) {
			System.out.println("로그인X");
			
			//쫓아내기!!!
			//1. response.sendRedirect()
			//2. alert() + location.href
			
			try {
				
				response.setCharacterEncoding("UTF-8");
				PrintWriter writer = response.getWriter();
				
				writer.print("<html>");
				writer.print("<head>");
				writer.print("<meta charset='UTF-8'>");
				writer.print("</head>");
				writer.print("<body>");
				writer.print("<script>");
				writer.print("alert('로그인 하세요');");
				writer.print("location.href='/spring/index.action';");
				writer.print("</script>");
				writer.print("</body>");
				writer.print("</html>");				
				
				writer.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		} else {
			System.out.println("로그인O");
		}
	}

}
