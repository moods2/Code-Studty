<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Register</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/register.css">

<style>
	
	.message td:nth-child(even) {
	}
	.message td:nth-child(odd) {
		text-align: center;		
	}
	
	#content {
		height: 150px;
	}
	
</style>
</head>

<body>

	<!-- ########## 상단 헤더 시작 -->
	<%
		out.flush();
	    RequestDispatcher dheader = request.getRequestDispatcher("/inc/header.do");
	    dheader.include(request, response);
	%>
	<!-- ########## 상단 헤더 끝 -->


	<!-- ########## 본문 시작 -->
	<div class="main">

		<!-- ########## 좌측 시작 -->
		<div class="menu col-sm-12 col-md-3">
			<!-- ########## 메뉴 시작 -->
			<%
				out.flush();
			    RequestDispatcher dmenu = request.getRequestDispatcher("/inc/menu.do");
				dmenu.include(request, response);
			%>
			<!-- ########## 메뉴 끝 -->

			<!-- ########## 인증 시작 -->
			<%
				out.flush();
			    RequestDispatcher dauth = request.getRequestDispatcher("/inc/auth.do");
			    dauth.include(request, response);
			%>
			<!-- ########## 인증 끝 -->

			<!-- ########## 채팅 시작 -->
			<%
				out.flush();
			    RequestDispatcher dchat = request.getRequestDispatcher("/inc/chat.do");
				dchat.include(request, response);
			%>
			<!-- ########## 채팅 끝 -->
		</div>
		<!-- ########## 좌측 끝 -->



		<!-- ########## 내용 시작 -->
		<div class="content col-sm-12 col-md-9">
			<div>
				<h1>쪽지 <small>Message</small></h1>
                
                <form method="POST" action="/codestudy/member/sendok.do">
                
                <input type="button" id="btnAll" value="모든 회원" class="btn btn-default" style="margin-bottom: 10px;">
                
                <table class="message table table-bordered">
                	<tbody>
                	
                		<tr>
                			<c:forEach items="${mlist}" var="mdto" varStatus="status">
	                			<td><input type="checkbox" name="mseq" value="${mdto.seq}"></td>
	                			<td>${mdto.name}(${mdto.id})</td>
	                			<c:if test="${(status.index+1) % 4 == 0}">
	                				</tr>
	                				<tr>
	                			</c:if>
                			</c:forEach>
                			
                			<c:forEach var="i" begin="1" end="${(4 - (mlist.length % 4)) * 2}">
                				<td></td>
                			</c:forEach>	
                			
                		</tr>   
                		             		
                	</tbody>
                </table>
                
                <textarea name="content" id="content" class="form-control" placeholder="쪽지 내용을 입력하세요."></textarea>
                
                <div class="btns">
                	<button type="button" class="btn btn-default" id="btnSend">쪽지 보내기</button>
                </div>
                </form>
                
                <div style="clear:both;"></div>
                
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
    
		$("#btnSend").click(function() {
			
			//최소 1명 이상 체크
			//alert($("input[name='mseq']:checked").length);
			if ($("input[name='mseq']:checked").length == 0) {
				alert("최소 1명 이상 선택하세요.");
				return;
			}
			
			if ($("#content").val().trim().length == 0) {
				alert("내용을 입력하세요.");
				return;
			}
			
			//쪽지 보내기
			this.form.submit();
			
		});
		
		
		$("#btnAll").click(function() {
			
			//모든 체크박스 체크하기
			//<input type="checkbox" name="mseq">
			if ($("input[name='mseq']:checked").length
					!= $("input[name='mseq']").length) {
				$("input[name='mseq']").prop("checked", true);
			} else {
				$("input[name='mseq']").prop("checked", false);
			}
			
		});
	
    </script>
</body>

</html>








