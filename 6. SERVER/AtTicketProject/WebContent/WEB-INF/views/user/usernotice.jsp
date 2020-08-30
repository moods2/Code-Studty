<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <%@include file="/WEB-INF/views/inc/asset.jsp" %>
        
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="/AtTicketProject/css/slick-theme.css" />
        <link rel="stylesheet" href="/AtTicketProject/css/slick.css"/>
        <link rel="shortcut icon" href="/AtTicketProject/images/favicon.ico" />
        
        <style>
            * {
                outline: none;
            }
            body {
                margin: 0 auto;
            }
            h1 {
                font-family: "Arial Black";
                font-weight: bold;
            }
            #main {
                width: 100%;
            }
            #top {
                /* border: 1px solid black; */
                min-width: 1600px;               
                margin: 0 auto;  
            }
            #middle {
                /* border: 1px solid black; */
                width: 1600px;
                margin: 0 auto;
            }
            #bottom {
                /* border: 1px solid black; */
                height: 200px;
                background-color: #eee;
                color: #333333;
            }
            #topmenu {
                border-bottom: 1px solid #ddd;
                background-color: transparent;
                width: 100%;
                height: 40px;
                color: black;
                text-align: center;
                font-size: 18px;
                font-weight: bold;
                padding: 40px 0;
                position: absolute;
            }
            .menubar {
                margin: 0 5px;
            }
            #topmenu > span {
                cursor: pointer;
            }
            #topleft {
                display: inline-block;
                /* border: 1px solid white; */
                width: 100px;
                height: 65px;
                background-image: url("/AtTicketProject/images/title.png");
                background-repeat: no-repeat;
                background-position: center center;
                position: absolute;
                left: 10px;
                top: 10px;
                cursor: pointer;
            }
            #topright {
                font-size: 13px;
                position: absolute;
                right: 5px;
                top: 42px;
                cursor: pointer;
            }
            .prev {
                float: left;
                padding-left: 20px;
                cursor: pointer;
            }
            .after {
                float: right;
                padding-right: 20px;
                cursor: pointer;
            }
            #search {
                border: 0;
                border-bottom: 1px solid black;
                background-color: transparent;
                outline: none;
                color: black;
            }
            .img {
                width: 230px;
                height: 330px;
                /* border: 1px solid black; */
                background-color: cornflowerblue;
                display: inline-block;
                margin: 10px 0 0 10px;
                cursor: pointer;
            }
            #banner {
                height: 400px;
                background-image: url("./images//banner.png");
                background-repeat: no-repeat;
                background-position: center center;
                margin-top: 20px;
            }
            #middle input {
                outline: none;
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
            #frogue-container,
            .frogue-chat {
                position: absolute;
                left: 20px;
                bottom: 0;
            }
            .recomand {
                /* border: 1px solid black; */
                width: 1600px;
                /* margin-bottom: 20px; */
                height: 400px;
                overflow: hidden;
            }
            .recomand h1 {
                padding: 40px;
            }
            .rank,
            .region {
                display: inline-block;
                /* border: 1px solid black; */
                height: 200px;
                width: 150px;
                margin-right: 140px;
                background-color: cornflowerblue;
                cursor: pointer;
            }
            #rankpage {
                width: 3600px;
                /* border: 1px solid black; */
            }
            .rank:first-child {
                margin-left: -450px;
            }
            .region:last-child {
                margin-right: 0;
            }
            .name {
                /* border:1px solid black; */
                width: 50px;
                height: 50px;
                border-radius: 50%;
                position: relative;
                left: 49px;
                top: 75px;
                background-image: url("./images/서울.png");
                background-position: center center;
                color: white;
            }

            .event-main-tit {
                text-align: center;
                font-size: 26px;
                font-weight: bold;
                font-family: "Noto Sans KR", "NanumBarunGothic", "맑은 고딕",
                    "Malgun Gothic", sans-serif;
                margin-bottom: 38px;
       
            }

            .event-division {
                text-align: center;
                font-size: 0;
                margin-bottom: 60px;
            }
            .eventmenubar {
                margin: 0 5px;
            }

            .event-main-list {
                /* display: inline-block; */
                width: 1900px;
                margin: 0px auto;
              margin-left: 300px;
            }

            .eve-mlist-dday {
                text-align: center;
            }

            .evemark {
                width: 40px;
                margin: 10px auto;

                border: 1px solid red;
                color: red;

                text-align: center;
            }

            .evetit {
                text-align: center;
            }
            .evetxt {
                color: orange;
                /* font-size: 11px; */
                text-align: center;
            }
            #eventbox {
                display: inline-block;
                width: 240px;
                margin-left: 50px;
            }

            .pbar {
                width: 370px;
            }

            .noticeimg {
                width: 250px;
            }
            #title {
                margin: 0;
                padding: 20px;
                padding-top: 35px;
            }

            #tblList {
                width: 1350px; 
                margin: 15px auto;
            }

            #tblList th:nth-child(1) {
                width: 100px;
            }
            #tblList th:nth-child(2) {
                width: 100px;
            }
            #tblList th:nth-child(3) {
                width: 800px;
            }
            #tblList th:nth-child(4) {
                width: 150px;
            }
            #tblList th:nth-child(5) {
                width: 150px;
            }

            tblList th,
            #tblList td {
                text-align: center;
            }
            
            #tblList td:nth-child(3) {
                text-align: left;
            }
            
             #tblList tr td:nth-child(3):hover{
                cursor:pointer;
                text-decoration:underline;
                color:red;
            }
            
            .btns {
                /* border: 1px solid black; */
                width: 750px;
                margin: 0px auto;
            }

            .btns button:last-child {
                float: right;
            }
            .searchbox {
                width: 600px;
                margin: 0 auto;
                margin-top: 50px;
            }

            .search {
                width: 380px;
                position: relative;
                left: 600px;
                top: 0px;
            }

            .pagebar {
                text-align: center;
            }
            th {
                text-align: center;
            }

            .noticemenu {
                font-size: 15px;
                color: gray;
                padding-right: 15px;
                padding-bottom: 15px;
            }
            #bottom > div {
                float: left;
                position: relative;
                left: 12%;
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
                margin-left: 250px;
                top: 18%;
            }
            #bottom #service p:first-child {
                border-bottom: 1px solid #bbb;
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
            
            .noticemenu.active {
			font-weight: bold;
			}
			
			a {
    			color: black;
			}
			#tagsearch {
    border: 1px solid #111;
    width: 170px;
    height: 205px;
    position: relative;
    float: right;
    background-color: white;
    margin-right: 60px;
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

.event-main-list {
	margin-left:220px;
}
        </style>
    </head>
    <body>
        <div id="main">
            <!-------------------------------- 화면 상단부 -------------------------------->
            <div id="top">
                <%@include file="/WEB-INF/views/inc/usertopbar.jsp" %>
                
                <!-- 메인화면 슬라이더 -->
                <div class="slider">
                <c:forEach items="${map}" var="map">
                  <div><img src="./images/${map.value}" /></div>
              	</c:forEach>
              </div>
            </div>
            <hr style="margin-top: 0px;">
                <!-------------------------------- 내용부분 -------------------------------->
                <p
                    class="event-main-tit"
                    style="margin-top: 150px; font-size: 2em;"
                >
                    공지사항
                </p>
                <div class="event-division"></div>
                <div class="event-main-list">
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="/AtTicketProject/images/notice1.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">단독</p>
                            <p class="evetit">컴백스테이지</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">44일 남음</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="/AtTicketProject/images/notice2.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">단독</p>
                            <p class="evetit">
                                뮤지컬 <베르테르> 기대평 이벤트
                            </p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">44일 남음</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="/AtTicketProject/images/notice3.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">단독</p>
                            <p class="evetit">연극 <가족사진> 기대평 이벤트</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">44일 남음</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="/AtTicketProject/images/notice4.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">단독</p>
                            <p class="evetit">뮤지컬 <오페라의 유령> -</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">64일 남음</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="/AtTicketProject/images/notice4.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">단독</p>
                            <p class="evetit">뮤지컬 <오페라의 유령> -</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">64일 남음</p>
                        </div>
                    </div>
                </div>
                <!-- 검색창 -->
                <div class="searchbox">
                    <span  style="position: relative; top: 50px; right: 380px;" class="noticemenu" onclick="location.href='/AtTicketProject/usernotice.do?page=${page}&search=${search}&sort=regdate';">등록순</span>
                    <span  style="position: relative; top: 50px; right: 380px;" class="noticemenu" onclick="location.href='/AtTicketProject/usernotice.do?page=${page}&search=${search}&sort=opendate';">오픈일순</span>
                    <span  style="position: relative; top: 50px; right: 380px;" class="noticemenu" onclick="location.href='/AtTicketProject/usernotice.do?page=${page}&search=${search}&sort=nview';">조회순</span>
                   	<form method="GET" action="/AtTicketProject/usernotice.do" id="searchForm" autocomplete="off">
                    <div class="search">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="궁금하신 내용을 입력세요" name = "search" required value="${search}"/>
                                <span class="input-group-addon"
                                    ><i class="glyphicon glyphicon-search" style="cursor: pointer;"
							onclick="$('#searchForm').submit();"></i
                                ></span>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <table id="tblList" class="table table-striped">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>구분</th>
                            <th>제목</th>
                            <th>티켓오픈 일시</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${list}" var="dto">
                        <tr>
                        	<td>${dto.seq}</td>
                            <td>${dto.nindex}</td>
                            <td><a href="/AtTicketProject/usernoticetemp.do?noticeseq=${dto.seq}&page=${page}&search=${search}">${dto.title}</a></td>     
                            <td>${dto.opendate}</td>
                            <td>${dto.nview}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
				
				<table style="width:100%;">
					<tr style="text-align:center;">
						<td>
							${pagebar}
						</td>
					</tr>
				</table>
			
               

                <!-------------------------------- 화면 하단부 -------------------------------->
                <div id="bottom">
                    <div>
                    <!-- 회사 마크 -->
                    <img src="/AtTicketProject/images/title2.png" />
                </div>
                <div class="txt">
                    <p class="black">At-Ticket (주)</p>
                    <p>
                        서울시 강남구 역삼동 한독빌딩 8층 대표: 한시연 |
                        개인정보보호책임자: 한시연
                    </p>
                    <p>it1234@atticket.com 사업자등록번호 229-81-37000</p>
                    <p class="black">
                        Copyright &copy; At-Tickey Corp. All Rights Reserved.
                    </p>
                </div>
                <div id="service">
                    <p><span>☎</span> 고객센터 전화상담</p>
                    <p>1544-6399</p>
                    <p>평일 09:00 ~ 18:00</p>
                    <p>토요일 09:00 ~ 17:00</p>
                    <p>일요일 공휴일 휴무</p>
                </div>
            </div>
                        <!-- 챗봇 : 단비봇 -->
                      <!--   <div
                            id="frogue-container"
                            class="position-right-bottom"
                            data-chatbot="e4957de9-dad9-448d-a709-e43eeb644f63"
                            data-user="사용자ID"
                            data-init-key="value"
                        ></div> -->
                        <!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
                        <!-- <script>
                            (function (d, s, id) {
                                var js,
                                    fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) {
                                    return;
                                }
                                js = d.createElement(s);
                                js.id = id;
                                js.src =
                                    "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
                                fjs.parentNode.insertBefore(js, fjs);
                            })(document, "script", "frogue-embed");
                        </script>
                        제일 위로 돌아가기 버튼
                        <div id="movetop">↑</div>
                    </div>
                
            </div> -->
        </div>
       <%@include file="/WEB-INF/views/inc/userchat.jsp" %>

        <script src="/AtTicketProject/js/slick.min.js"></script>
        <script>
        
	        var index = 0;
	     	
	     	if("${sort}" == "regdate"){
	    		index = 0;
	    	} else if("${sort}" == "opendate") {
	    		index = 1;
	    	}  else if("${sort}" == "nview") {
	    		index = 2;
	    	}
	     	
	     	
	     	$(".noticemenu").children().eq(index).addClass("active");
     	
            //상단 메뉴 css
            $(".menubar").mouseover(function () {
                $(this).css("border-bottom", "5px solid orange");
            });
            $(".menubar").mouseout(function () {
                $(this).css("border-bottom", "");
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

            //movetop
            $("#movetop").click(function () {
                event.preventDefault();
                $("html, body").animate(
                    {
                        scrollTop: 0,
                    },
                    1000
                );
            });
        </script>
    </body>
</html>
        