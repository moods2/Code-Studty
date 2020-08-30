<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="header">
	<div>
		<span><a href="/codestudy/index.do">CodeStudy</a></span>
		
		<!-- 로그인 전 -->
		<c:if test="${empty id}">
		<span>
			<span class="glyphicon glyphicon-user"></span> 
			<a href="/codestudy/member/register.do">회원가입</a>
		</span>

		<span>
			<span class="glyphicon glyphicon-lock"></span> 
			<a href="/codestudy/member/auth.do">로그인</a>
		</span>
		</c:if>
		
		<!-- 로그인 후 -->
		<c:if test="${not empty id}">
			<span>
				<span class="glyphicon glyphicon-envelope"></span> 
				<a href="/codestudy/member/message.do">쪽지</a>
			</span>
			<span>
				<span class="glyphicon glyphicon-lock"></span> 
				<a href="/codestudy/member/logout.do">로그아웃</a>
			</span>
		</c:if>
		
	</div>
</div>




