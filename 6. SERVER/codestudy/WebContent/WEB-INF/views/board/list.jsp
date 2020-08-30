<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Board</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/board.css">

<style>

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
			
				<h1>자유 게시판 <small>Board</small></h1>
				
				
				<c:if test="${not empty search}">
                <div class="message well well-sm">
                    '${search}'(으)로 ${list.size()}건의 게시물을 검색했습니다.
                </div>
                </c:if>
                
                
                <form method="GET" action="/codestudy/board/list.do" id="searchForm">
	                <div class="input-group search">
	                    <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon2" name="search" id="search" required value="${search}">
	                    <span class="input-group-addon" id="basic-addon2" style="cursor:pointer;" onclick="$('#searchForm').submit();"><span class="glyphicon glyphicon-search"></span></span>
	                </div>
                </form>
                
                <div style="clear:both;"></div>
                
                
                
                <%-- <select name="pagebar" id="pagebar" onchange="movePage();">
                	<c:forEach var="i" begin="1" end="${totalPage}">
                		<option value="${i}">${i}page</option>
                	</c:forEach>
                </select> --%>
                
                
                
                <table class="table table-hover list">
                    <thead>
                        <tr>
                            <th>추천</th>
                            <th>제목</th>
                            <th>이름</th>
                            <th>날짜</th>
                            <th>읽음</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    	<c:if test="${not empty search and list.size() == 0}">
                    	<tr>
                    		<td colspan="5">검색 결과가 없습니다.</td>
                    	</tr>                    	
                    	</c:if>
                    	
                    	<c:if test="${empty search and list.size() == 0}">
                    	<tr>
                    		<td colspan="5">게시물이 없습니다.</td>
                    	</tr>                    	
                    	</c:if>
                    	
                    	<c:forEach items="${list}" var="dto">
                        <tr>
                            <td>${dto.heart}</td>
                            <td>
                            	
                            	
                            	<a href="/codestudy/board/view.do?seq=${dto.seq}&search=${search}&sort=${sort}" 
                            style="margin-left: ${dto.depth*30}px;">
                            
                            		<c:if test="${dto.depth > 0}">
                            		<span class="glyphicon glyphicon-share-alt"></span>
                            		</c:if>
                            		${dto.subject}                           		
                            	</a>
                            	
                            	<c:if test="${dto.commentcount > 0}">
                            	<span class="badge">
                            		${dto.commentcount}
                            	</span>
                            	</c:if>
                            	
                            	<c:if test="${dto.gap < 1}">
                            		<span class="label label-danger">
                            			new
                            		</span>
                            	</c:if>
                            	
                            </td>
                            <td>${dto.name}</td>
                            <td>${dto.regdate}</td>
                            <td>${dto.readcount}</td>
                        </tr>
                        </c:forEach>
                        
                    </tbody>
                </table>

				
                <div class="btn-group fbtns" role="group" aria-label="...">
                
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/list.do?sort=thread';"><span class="glyphicon glyphicon-th-list"></span></button>
                    
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/list.do?sort=heart';"><span class="glyphicon glyphicon-thumbs-up"></span></button>
                    
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/list.do?sort=readcount';"><span class="glyphicon glyphicon-heart"></span></button>
                    
                </div>
 				
 				
 				${pagebar}
                

                <div style="clear:both;"></div>

                <div class="btns btn-group">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/list.do';">
                        <span class="glyphicon glyphicon-th-list"></span>
                        목록
                    </button>
                    
                    <c:if test="${not empty id}">
                    <button type="button" class="btn btn-default" onclick="location.href='/codestudy/board/write.do?reply=n';">
                        <span class="glyphicon glyphicon-plus"></span>
                        쓰기
                    </button>
                    </c:if>
                    
                </div>
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
    
	var index = 0;
	
	if ("${sort}" == "seq") {
		index = 0;	
	} else if ("${sort}" == "heart") {
		index = 1;
	} else if ("${sort}" == "readcount") {
		index = 2;
	}
	
	$(".fbtns").children().eq(index).addClass("active");
	
	function movePage() {
		//alert(event.srcElement.value);
		location.href="/codestudy/board/list.do?page=" + event.srcElement.value;
	}
	
	$("#pagebar").val(${page});
	
    </script>
</body>

</html>









