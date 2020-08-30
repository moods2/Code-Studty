<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        
        <%@include file="/WEB-INF/views/inc/asset.jsp" %>
        
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet"/>
        <link rel="shortcut icon" href="./images/favicon.ico" />
		<link rel="stylesheet" href="css/usermain.css" />

    <style>

        * {
            outline: none;
        }

        body { margin: 0 auto; }
        h1 { font-family: "Arial Black"; }
        #main { width: 100%; }
        #top {
            /* border: 1px solid black; */
            min-width: 1600px;
            height: 50px;
            margin: 0 auto;
        }
        /*-------------------------------- 화면 하단부 -------------------------------*/
        #bottom {
            /* border: 1px solid black; */
            min-width: 1300px;
            height: 250px;
            background-color: #eee;
        }
        #bottom > div {
            float: left;
            position: relative;
            left: 21%;
            top: 22%;
        }
        #bottom .txt {
            margin-left: 30px;
            line-height: 1.1em;
            color: #666;
            top: 28%;
        }
        #bottom .txt .black {
            color: black;
        }
        #bottom #service {
            margin-left: 200px;
            top: 18%;
        }
        #bottom #service p:first-child {
            border-bottom: 1px solid #BBB;
            padding: 0 0 5px 20px;
            font-weight: bold;
            font-size: 1.1em;
        }
        #bottom #service p > span {
            color: #444;
            font-size: 1.3em;
        }
        #bottom #service p:nth-child(2) {
            text-align: center;
            font-size: 3em;
            padding-left: 10px;
        }
        #bottom #service p {
            margin-bottom: -2px;
            padding-left: 20px;
        }
        #topmenu {
            border-bottom: 1px solid #eee;
            background-color: white;
            width: 100%;
            height: 40px;
            color: black;
            text-align: center;
            font-size: 15px;
            padding: 40px 0;
            position: absolute;
            margin-top: -120px;
        }
        .menubar {
            margin: 0 5px;
            cursor: pointer;
        }
        #topmenu > span {
            cursor: pointer;
        }
        .switch {
            /* border: 1px solid white; */
            position: relative;
            top: 50%;
        }        
        #topleft {
            display: inline-block;
            /* border: 1px solid white; */
            width: 100px;
            height: 65px;
            background-image: url("./images//title.png");
            background-repeat: no-repeat;
            background-position: center center;
            position: absolute;
            left : 10px;
            top: 10px;
            cursor: pointer;
        }
        #topright {
            font-size: 13px;
            position: absolute;
            right : 5px;
            top: 42px;
            cursor: pointer;
        }

        #search {
            border: 0;
            border-bottom: 1px solid black;
            background-color: transparent;
            outline: none;
            color: black;

        }

        /*-------------------------------- 태그 --------------------------------*/
        #tagsearch {
            border: 1px solid #111;
            width: 170px;
            height: 205px;
            position: relative;
            left: -15px;
            float: right;
            background-color: white;
            margin-right: 60px;
	        margin-top: 2px;
            /* text-align: center; */
            display: none;
        }
        #tagsearch::after {
            content: "";
            display: none;
            clear: both;
        }
        #tag {
            width: 168px;
            /* background-color: rgb(253, 236, 236); */
            background-color: #f6f6f6;
            height: 25px;
            }
        #tag > span {
            color: #222;
            font-size: 14px;
            width: 50px;
            height: 30px;
            font-weight: normal;
            font-family: "IBMPlexSansKR-Regular";
            position: relative;
            left: -20px;
        }

        #tag > label {
            color: #111;
            float: right;
            cursor: pointer;
            font-size: 20px;
            font-weight: 100;
        }
        #tagsearch > a {
            display: block;
            color: #555;
            font-size: 14px;
            font-family: "IBMPlexSansKR-Regular";
            font-weight: normal;
            text-align: left;
            margin-left: 20px;
            margin-top: 2px;
        }
        #tagsearch > span {
            font-size: 12px;
            color: #999;
            font-weight: normal;
            font-family: "IBMPlexSansKR-Regular";

            float: right;
            margin-top: 5px;
            margin-right: 5px;
        }

        #chatbot {
            width: 88px;
            height: 88px;
            position: fixed;
            bottom: 10px;
            left: 10px;
            cursor: pointer;
            z-index: 1;
        }

        #frogue-container, .frogue-chat {
            position: absolute;
            left:20px;
            bottom: 0;
        }

        #movetop {
            width: 40px;
            height: 40px;
            background-color: gray;
            position: fixed;
            bottom: 0;
            right: 0;
            text-align: center;
            padding-top: 3px;
        }
        #movetop:hover {
            background-color: orange;
        }
        #movetop a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 1.5em;
        }
        /* 내용======================================================================================================== */

        #mainBox {
            width: 1200px;
            /* text-align: center; */
            margin: 120px auto;
            min-height: 890px;
        }

        #mainBox h1 {
            text-align: center;
            font-weight: bold;
        }


        /* 탭 */
        #tabMenu {
            width: 1200px;
            text-align: center;
            padding-bottom: 50px;
            cursor: pointer;
        }

        #tabMenu::after {
            content: ' ';
            display: block;
            clear: both;
        }

        .tabMenu {
            border-bottom: 2px solid #eee;
            width: 150px;
            height: 70px;
            float: left;
            text-align: center;
            padding-top: 25px;
            border-right: none;
            color: black;
            margin-top: 50px;
        }

/*         .tabMenu:first-child{*/

        .active{
            color: #7E9CB6;
            border-bottom: 2px solid #7E9CB6;
        }

        /* 검색 */
        #searchFAQ {
            padding-top: 50px;
            text-align: center;
        }

        #searchFAQBox {
            width: 630px;
            height: 60px;
            border: 2px solid black;
            padding: 0px 20px;
            padding-right: 80px;
        }

        #searchFAQ div {
            width: 60px;
            height: 60px;
            font-size: 30px;
            display: block;
            float: left;
            position: relative;
            left: 885px;
            /* text-align: center center; */
        }

        #searchFAQ::after {
            content: ' ';
            display: block;
            clear: both;
        }

        #searchFAQ span {
            position: relative;
            top: 15px;
        }

        .pagebar {
            text-align: center;
        }

        .pagination > .active > a {
            background-color: #7E9CB6;
            border-color: #7E9CB6;
        }

        .pagination > li > a, .pagination > li > span {
            color: #7E9CB6;
        }

        #write {
            outline: none;
            width: 100px;
            height: 40px;
            background-color: #7E9CB6;
            border-color: #7E9CB6;
            float: right;
            outline: none;
            margin-top: 30px;
        }
        #list {
            outline: none;
            width: 100px;
            height: 40px;
            float: right;
            outline: none;
            margin-top: 30px;
            font-size: 14px;
            margin-left: 10px;
        }


        .move {
            width: 150px;
            position: relative;
            top: -210px;
            right: 0px;
            border: none;
            border-bottom: 1px solid #7E9CB6;
            float: right;
            outline: none;
            background-color: white;
            padding: 10px;
        }

        .move span {
            margin-right: 10px;
        }

        .move:hover {
            background-color: #7E9CB6;
        }


        .searchbox {
            width: 600px;
            margin: 0 auto;
            margin-top: 50px;
            margin-bottom: 20px;
            position: relative;
            /* top: -30px; */
            left: -298px;
        }
        
        
        #tblList th {text-align: center;}
        #tblList td {text-align: center;}
        
        #tblList tbody tr:hover {
        	background-color:#ddd; 
        }
		
		#tblList th:nth-child(1) {width : 50px;}
        #tblList th:nth-child(2) {width : 80px;}
        #tblList th:nth-child(3) {width : auto;}
        #tblList th:nth-child(4) {width : 100px;}
        #tblList th:nth-child(5) {width : 200px;}
        #tblList th:nth-child(6) {width : 100px;}
		#tblList th:nth-child(7) {width : 60px}
		
		#tblList td:nth-child(3) {text-align: left;}
		#tblList td:nth-child(3) a {color: #333; text-decoration: none;}
		
		
		#searchlogo {
			cursor: pointer;
		}

    </style>

</head>
<body>

    <div id="main">

        <!-------------------------------- 화면 상단부 -------------------------------->
       	<%@include file="/WEB-INF/views/inc/usertopbar.jsp" %>
            

                <!-- 검색 팝업 -->
<!--                 <div id="tagsearch">
                    <div id="tag">
                        <span>태그 검색어 </span>
                        <label
                            id="tagremove"
                            class="glyphicon glyphicon-remove"
                        ></label>
                    </div>
                    <a href="#">#연극</a>
                    <a href="#">#뮤지컬</a>
                    <a href="#">#캣츠</a>
                    <a href="#">#00</a>
                    <a href="#">#서울 전시</a>
                    <a href="#">#서울 전시</a>
                    <a href="#">#서울 전시</a>
                    <span>2020.07.23 기준</span>
                </div>
            </div>
        </div> -->
            
            <!-- 챗봇 : 단비봇 --------------------------------------------------------------------------------------------------------------------------------->
            <!-- <img src="./images/face35.png" id="chatbot"> -->
			
	
            <!-- 제일 위로 돌아가기 버튼 -->
            <div id="movetop"><a href="#top">↑</a></div>
        </div>

        <!-- 내용============================================================================================================================================= -->
        <div id="mainBox">
            <h1>Q&A</h1>

		<form method="GET" action="/AtTicketProject/userqna.do" id="searchForm">
            <div id="searchFAQ">
                <input type="text" placeholder="궁금하신 내용을 입력해주세요" id="searchFAQBox" name="search" required value="${search}">
                <div id = "searchlogo" onclick="$('#searchForm').submit();"><span class="glyphicon glyphicon-search"></span></div>
            </div>
        </form> 

			<c:if test="${not empty userid}">
            <button id="myQna" class="move">
                <span class="
                glyphicon glyphicon-th-list"></span>
                My 문의 내역
            </button>
            </c:if>
            <button id="FAQ" class="move">
                <span class="
                glyphicon glyphicon-th-list"></span>
                PAQ 이동
            </button>
            <div style="clear:both;"></div>

            <div id="tabMenu">
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?';">전체</div>
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?sort=예매방법';">예매방법</div>
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?sort=결제방법';">결제방법</div>
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?sort=수수료';">수수료</div>
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?sort=취소/환불';">취소/환불</div>
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?sort=티켓수령';">티켓수령</div>
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?sort=티켓판매/제휴문의';">티켓반매/재휴문의</div>
                <div class="tabMenu" onclick="location.href='/AtTicketProject/userqna.do?sort=기타';">기타</div>
            </div>


         <!-- 검색창 -->
         <table id="tblList" class="table table-striped">
             <thead>
                 <tr>
                     <th>번호</th>
                     <th>태그</th>
                     <th>제목</th>
                     <th>이름</th>
                     <th>날짜</th>
                     <th>답변</th>
                     <th>조회수</th>
                 </tr>
             </thead>
             <tbody>
             
               	<c:if test="${not empty search and list.size() == 0}">
                	<tr>
                		<td colspan="7">검색 결과가 없습니다.</td>
                	</tr>                    	
               	</c:if>
                	
               	<c:if test="${empty search and list.size() == 0}">
                	<tr>
                		<td colspan="7">게시물이 없습니다.</td>
                	</tr>                    	
               	</c:if>
                 
          	     <c:forEach items="${list}" var="dto">
		            <tr>	            	
		            	<td>${dto.seq}</td>
		                <td style="width: 200px">${dto.tag}</td>
		                <td class = "inputcont">
		                	<a href="/AtTicketProject/userqnacontent.do?seq=${dto.seq}&search=${search}&sort=${sort}&index=1">
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
		                <td>${dto.qview }</td>
		            </tr>
                    
		         </c:forEach>
            </tbody>
            </table>

            <!-- 글쓰기 -->
			
            <button class="btn btn-default" id="list" onclick="location.href='/AtTicketProject/userqna.do';">
            <span class="glyphicon glyphicon-pencil"></span>
            list
            </button>
           
            <c:if test="${not empty userid}">
            <button class="btn btn-primary" id="write">
            <span class="glyphicon glyphicon-pencil"></span>
            Write
            </button>
            </c:if>
            
			<div style="clear: both;"></div>

			${pagebar}


        </div>




        <!-------------------------------- 화면 하단부 -------------------------------->
		<%@include file="/WEB-INF/views/inc/userbottombar.jsp" %>
        </div>

    <script>

              //상단 메뉴 css
              $(".menubar").mouseover(function() {
        $(this).css("border-bottom", "5px solid orange");
        });
        $(".menubar").mouseout(function() {
            $(this).css("border-bottom", "");
        });

        //상단 메뉴 클릭시
        $(".menubar").click(function () {
            location.href = $(this).data("lo");
        });

        var flag = false;

        $(document).scroll(function() {
            //메뉴가 시야에서 사라지는 순간 -> 메뉴를 붙박이로 만들기
            // if (!flag) {
                if ($(document).scrollTop() > $("#tabs").position().top) {
                    $("#topmenu").css({
                        width: "100%",
                        position: "fixed",
                        top: "0px",
                        bottom: "",
                        zIndex: "1"
                    });
                };

            //상단 헤더(top)이 눈에 보일때 쯤
            if ($(document).scrollTop() <= $("#tabs").position().top) {
                $("#topmenu").css({
                    position: "absolute",
                    top: "0px",
                    bottom: ""
                });
                // flag = false;                
            }
        });

        //검색창 커서 있을때 팝업 띄우기
        $("#search").focusin(function () {
            $("#tagsearch").css("display", "block");
            //$("#search").css("border-bottom", "2px solid black");
        });
        //검색창 팝업 닫기
        $("#search").focusout(function () {
            $("#tagsearch").css("display", "none");
        });
        $("#tagremove").click(function () {
            $("#tagsearch").css("display", "none");
        });
 
        //이미지에 마우스 올릴때
        $(".img").mouseover(function() {
            $(this).css("box-shadow", "1px 1px 1px 2px gray");
        });
        //이미지에 마우스 뗄때
        $(".img").mouseout(function() {
            $(this).css("box-shadow", "");
        });
        
        //이미지 클릭시 이동
        $(".img").click(function() {
            location.href = "#";
        });

        //챗봇 클릭시 행동
        $("#chatbot").dblclick(function() {
            alert("챗봇입니다!");
        });
        //챗봇 이동 가능
        $("#chatbot").draggable();

        $("#movetop").click(function() {
            //<a> 본연의 기능을 제거
			event.preventDefault();

            $("html,body").animate({
                scrollTop: 0
            }, 1000);
        });


        // 내용==================================================================================================================================================================
        
        // 글쓰기 링크
        $("#write").click(function() {
            $(location).attr('href','/AtTicketProject/userqnawrite.do?index=1');
        });
        // 마이리스트 링크
        $("#myQna").click(function() {
            $(location).attr('href','/AtTicketProject/userqnamylist.do');
        });
        // FAQ 링크
        $("#FAQ").click(function() {
            $(location).attr('href','/AtTicketProject/userinfouse.do');
        });

        //탭
        $(".tabMenu").click(function(){
            $(".tabMenu").css({
                "border-bottom" : "2px solid #eee",
                "color": "black"
            })
            $(this).css({
                "border-bottom" : "2px solid #7E9CB6",
                "color": "#7E9CB6"
            })
        });

        $(".noticemenu").mouseover(function () {
            $(this).css("border-top", "5px solid orange");
            $(this).css("color", "black");
            $(this).css("font-weight", "bold");
        });
        $(".noticemenu").mouseout(function () {
            $(this).css("border-top", "");
            $(this).css("color", "gray");
            $(this).css("font-weight", "none");
        });

    	var index = 0;
    	
    	if ("${sort}" == "전체") {
    		index = 0;	
    	} else if ("${sort}" == "예매방법") {
    		index = 1;
    	} else if ("${sort}" == "결제방법") {
    		index = 2;
    	} else if ("${sort}" == "수수료") {
    		index = 3;
    	} else if ("${sort}" == "취소/환불") {
    		index = 4;
    	} else if ("${sort}" == "티켓수령") {
    		index = 5;
    	} else if ("${sort}" == "티켓반매/재휴문의") {
    		index = 6;
    	} else if ("${sort}" == "기타") {
    		index = 7;
    	}
    	
    	//alert("${sort}");
    	//alert(index);
    	
    	$("#tabMenu").children().eq(index).addClass("active");
        
        //로그인 java 로 이동
        $("#login").click(function() {
            location.href = "/AtTicketProject/userlogin.do";
        });
        
        //로그아웃 java 로 이동
        $("#logout").click(function() {
            location.href = "/AtTicketProject/userlogout.do";            
        //로그인 java 로 이동
        });
    </script>



        </div>
    </div>



</body>
</html>