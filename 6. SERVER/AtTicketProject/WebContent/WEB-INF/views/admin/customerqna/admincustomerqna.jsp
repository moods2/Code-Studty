<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %> 


  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">

<style>
        /* 최상단 타이틀 */
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
            color : #444444;
        }

</style>

</head>
<body>
	
	
	<div id = "title">
        <h1 id = "titesub">1:1 문의 <small id = "mainHome" style = "color : #777;"> > 문의조회  </small></h1>
    </div>

	<!-- ------------------- 문의조회 게시판 시작-------------------  -->
 	<!-- 게시판 -->
 	
 	<style>
        /* 페이지 하단바  색 조정 */
        .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
               background-color:#999999;
           border-color: #eeeeee;
        }
        
        .pagination > li > a, .pagination > li > span{
          color: black;
        }

        /* 최상단 타이틀 */
        #title{
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
            color : #444444;
        }

        /* 표가 존재하는 구역 */
        #selectable {
            /* border : 1px solid black; */
            width : 1330px;
            margin-left : 350px;
            height : 1700px;
            margin-top : 100px;
        }
        .selectNotice {
            width : 100px;
            text-align: center;
            margin: 10px 0px;
            margin-bottom: 0px;
            background-color: white;
            border : 0px;
            border-radius: 5px;
            font-size: 1.3em;
            border-right: 1px solid #999;
            border-radius: 0px;
            color : #777;
            height : 40px;
        }
        .selectNotice:last-child {
            border-right: 0px;
        }
        .selectNotice:hover {
            color : black;
        }
        #nttable {
            margin-left : 0px;
        }
        #nttable th {
            background-color:  #999;
            /* color:white; */
            text-align: center;
        }
        #nttable th:nth-child(1) {width : 30px;}
        #nttable th:nth-child(2) {width : 100px;}
        #nttable th:nth-child(3) {width : auto;}
        #nttable th:nth-child(4) {width : 150px;}
        #nttable th:nth-child(5) {width : 200px;}
        #nttable th:nth-child(6) {width : 100px;}
        
        #nttable tbody td {
            /* color :red; */
            text-align: center;
            font-size: 1em;
        }
        
        /*  제목은 중앙정렬 하지 않는다.*/
        #nttable tbody td:nth-child(3) {
            padding-left : 20px;
            text-align: left;

        }

        #nttable > tbody > tr > td:nth-child(3):hover {
            cursor : pointer;
            text-decoration: underline;
        }
        
        .inputcont a {
        	color : #333;
        	font-weight: normal;
        }
        
        .modified {
            border : 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 35px;
            font-weight: bold    
        }
        .modified:hover {
            color : white;
        }
        .pagebar {
            /* margin-left : 400px; */
            text-align: center;
            width: 600px;
            margin: 0px auto;
        }


        #slctp1, #slctp2 {
            float : left;
            /* margin-left : 100px; */
        }
        #slctp1 {
            margin-left: -12px;
        }

        #slctp2 {
            margin-top : 10px;
            margin : 10px auto;
            margin-bottom: 10px;
            width : 300px;
            margin-left: 735px;
        }
        .secret {
            border:1px solid red;
            color : red;
            font-size: .7em;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        } 	
 	
 		.ok {
 			color: #44BADF ;
 		}
 		
 		.no {
 			color: #FF7372 ;
 		}
 		
 		#searchForm {
 			float: right;
 		}
 	
 	</style>
 	
    <!-- 등록순 오름차순 조회순 -->
    <div id = "selectable">
        
<!--         <div id = "slctp1">
            <button class = "selectNotice" style = "outline : none;"><span><i class = "glyphicon glyphicon-sort"></i></span>등록순</button>
            <button class = "selectNotice" style = "outline : none;"><span><i class = "glyphicon glyphicon-sort"></i>오름차순</button>
            <button class = "selectNotice" style = "outline : none;"><span><i class = "glyphicon glyphicon-sort"></i>내림차순</button>
        </div> -->
		
		<form method="GET" action="/AtTicketProject/admincustomerqna.do" id="searchForm">
	        <div id = "slctp2" >
				<div class="input-group">
					<input type="text" class="form-control" placeholder="검색어를 입력하세요." name="search" id="search" required value="${search}">
					<span class="input-group-addon" id = "searchlogo" onclick="$('#searchForm').submit();"><i class="glyphicon glyphicon-search"></i></span>
				</div>
	        </div>
        </form> 
        
        <table style = "width:1330px;" class = "table table-striped table-bordered table-condensed" id = "nttable">
            <thead>
                <tr>
                    <th><input type="checkbox" id = "t5title"></th>
                    <th>문의유형</th>
                    <th>제목</th>
                    <th>이름</th>
                    <th>작성날짜</th>
                    <th>답변</th>
                </tr>
            </thead>
            <tbody>
            
	            <c:if test="${not empty search and list.size() == 0}">
	        	<tr>
	        		<td colspan="6">검색 결과가 없습니다.</td>
	        	</tr>                    	
	        	</c:if>
	        	
	        	<c:if test="${empty search and list.size() == 0}">
	        	<tr>
	        		<td colspan="6">게시물이 없습니다.</td>
	        	</tr>                    	
	        	</c:if>
	            
	            <!-- 목록  -->  
	            <c:forEach items="${list}" var="dto">
	            <tr>	            	
	            	<td><input type="checkbox" class = "t5 cbDelete" name="cbDelete" value="${dto.seq}"></td>
	                <td style="width: 200px">${dto.tag}</td>
	                <td class = "inputcont">
	                	<a href="/AtTicketProject/customerqna/admincustomerqnaview.do?seq=${dto.seq}&search=${search}" onclick="window.open(this.href, '_blanck', 'width=910, height=700'); return false">
	                		${dto.subject}
	                		
	                	</a> 
	                </td>
	                <td>${dto.name}</td>
	                <td>${dto.regdate} </td>
	                <td>
		                <c:if test="${dto.ansSeq ne 0}">
		                <%-- ${dto.ansSeq} --%>
		                	<span class="complete ok">완료</span>
		                </c:if> 
		                
		                <c:if test="${dto.ansSeq eq 0}">
		                	<span class="complete no">미완료</span>
		                </c:if> 
	                </td>
	            </tr>
	            </c:forEach>

            </tbody>
        </table>

        <!-- 내용물 수정/삭제 페이지 -->
        <div id = "manipulate">
            <button class = "modified" style = "float:right;" onclick="location.href='/AtTicketProject/admincustomerqna.do';"><i class="glyphicon glyphicon-list" ></i>목록</button>
            <button class = "modified" style = "float:right; margin-right: 10px;" onclick="deleteMessage()"><i class="glyphicon glyphicon-trash"></i>해당 문의 내역 삭제</button>
            <div style="clear: both;"></div>
        </div>

        <!-- 하단 페이지 선택 바 -->
        ${pagebar}
        
    </div><!-- selectable -->
    
    <script>
    	// 관리자 질문 답해주는 링크로 가기
				
	    $(".inputcont").click(function(){
	        // 새로운 링크를 띄워야 한다.
	
	        //adminChild = window.open("./adminQuestionAnswer.html","QA","width=900,height=900");
	        // 질문에 대한 답을 해주는 페이지로 이동한다. 
	    	
	    	//popupCenter("/AtTicketProject/customerqna/admincustomerqnaview.do",1000,1000);
	    	//popupCenter("AtTicketProject/admincustomerqna.do?seq=${dto.seq}&search=${search}",1000,1000);
	        
	        
	        
	        
	    });
    	
    	
	    //팝업 중앙정렬 알고리즘
	 /*    function popupCenter(href, w, h) {
	    	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	    	xPos += window.screenLeft; 
	    	var yPos = (document.body.offsetHeight/2) - (h/2);

	    	window.open(href, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
	    } */
		
	    /* 	    
		function movePage() {
			//alert(event.srcElement.value);
			location.href = "AtTicketProject/admincustomerqna.do?page=" + event.srcElement.value;
		} */
	    
	    $("#pagebar").val(${page});
	    
		//alert($(".complete").text());
		
/* 		if($(".complete").text() == '완료'){
			$(".complete").addClass('ok');
		}else {
			$(".complete").addClass('no');
		} */
    
    </script>	
	
	
	
	
	<!-- ------------------- 문의조회 게시판 끝-------------------  -->
	
	
	
	
	

	<%@include file="/WEB-INF/views/inc/menu.jsp" %><!-- 왼쪽 메뉴 페이지 -->

</body>


<script>

	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	/* 기본적인 자바스크립트 */
	
 	$("#t5title").click(function() {
		if($("#t5title").is(":checked") == true) {
			$("input[name='cbDelete']").prop("checked", true);
		}else{
			$("input[name='cbDelete']").prop("checked", false);
		}
	}); 
	
	function deleteMessage() {
		
		if($(".cbDelete:checked").length >0){
		 	location.href = "/AtTicketProject/customerqna/admincustomerqnadeleteok.do?" + $(".cbDelete").serialize();
		}else{
			alert("삭제할 문의내역를 선택하세요.");
		}
	}
	
</script>

</html>