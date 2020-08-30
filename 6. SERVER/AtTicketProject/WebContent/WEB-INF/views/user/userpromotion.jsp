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
        <link rel="stylesheet" href="css/slick-theme.css" />
        <link rel="stylesheet" href="css/slick.css" />
        <link rel="shortcut icon" href="./images/favicon.ico" />
        
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
                height: 1100px;
                margin: 0 auto;
                background-image: url("./images/back1.jpg");
            }
            #middle {
                /* border: 1px solid black; */
                width: 100%;
                margin: 0 auto;
                background-image: url("./images/배경색2.png");
            }
            #middle2 {
                /* border: 1px solid black; */
                width: 100%;
                margin: 0 auto;
                background-color: rgb(0, 0, 0);
            }
            #middle3 {
                /* border: 1px solid black; */
                width: 100%;
                margin: 0 auto;
                background-image: url("./images/배경색.png");
            }
            #bottom {
                /* border: 1px solid black; */
                width: 100%;
                min-width: 1600px;
                height: 200px;
                background-color: black;
                color: white;
            }
            #topmenu {
                border-bottom: 1px solid #ddd;
                background-color: white;
                width: 100%;
                min-width: 1600px;
                height: 40px;
                color: black;
                text-align: center;
                font-size: 18px;
                font-weight: bold;
                padding: 40px 0;
                position: absolute;
                z-index: 10;
            }
            .menubar {
                margin: 0 5px;
                cursor: pointer;
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
            .comebackbar {
                margin: 0px auto;
                position: relative;
                top: 90px;
            }
            .comebackimg {
                width: 100%;
                margin-left: 500px;
            }
            .comebackavi {
                width: 100%;
                margin-left: 640px;
                margin-top: 40px;
            }
            #safety {
                width: 100%;
                margin-left: 500px;
                /* margin-top: 20px; */
            }
            #manner {
                width: 100%;
                margin-left: 500px;
                /* margin-top: 20px; */
            }
            #coupon {
                width: 100%;
                margin-left: 500px;
                /* margin-top: 20px; */
            }
            .backimage {
                transform: scale(0.8);
            }
        </style>
    </head>
    <body>
        <div id="main">
            <!-------------------------------- 화면 상단부 -------------------------------->
            <div id="top">
            <div id="topmenu">
                <!-- 상단메뉴 좌측(메인화면으로 돌아가기) -->
                <a href="userindex.do" id="topleft"></a>
                <!-- 상단메뉴 센터(콘서트, 뮤지컬, 연극, 클래식, 전시) -->
                <div id="topcenter">
                    <span data-lo="userconcert.do" class="menubar">콘서트</span>
                    <span data-lo="usermusical.do" class="menubar">뮤지컬</span>
                    <span data-lo="usertheater.do" class="menubar">연극</span>
                    <span data-lo="userclassic.do" class="menubar">클래식</span>
                    <span data-lo="userexhibition.do" class="menubar">전시</span>
                </div>
                <!-- 상단메뉴 우측(랭킹, 이벤트, 검색창, 마이페이지) -->
                <div id="topright">
                    <span data-lo="userranking.do" class="menubar">랭킹</span>
                    <span data-lo="userevent.do" class="menubar">이벤트</span>
                    <input type="text" value="" id="search">
                    <label for="search" class="glyphicon glyphicon-search"
                        style="font-size: 14px; cursor: pointer;"></label>
                        <c:if test = "${empty userid}">
        <span class="menubar" id="slogin">로그인</span>
        </c:if>
        <c:if test = "${!empty userid}">
        <div
            class="glyphicon glyphicon-user"
            id="mypage"
            style="
                font-size: 14px;
                cursor: pointer;
                margin: 0 10px;
            "
        ></div>
        <span class="menubar" id="slogout">로그아웃</span>
        </c:if>
                        
                </div>
            </div>
                <div class="comebackbar">
                    <div class="comebackimg">
                        <img src="./images/eventPro.gif" alt="" />
                    </div>
                    <div class="comebackavi">
                        <iframe
                            class="youtubebar"
                            width="673"
                            height="349"
                            src="https://www.youtube.com/embed/cDUN-nusaW8"
                            frameborder="0"
                            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen
                        ></iframe>
                    </div>
                </div>
            </div>

            <!-------------------------------- 내용부분 -------------------------------->
            <style>
             	#coupon:hover {
             		cursor : pointer;
             	}
            
            </style>
            <div id="middle">
                <div id="safety">
                    <img
                        class="backimage"
                        src="./images/backstage1.jpg"
                        alt=""
                    />
                </div>
            </div>
            <div id="middle2">
                <div id="manner">
                    <img class="backimage" src="./images/manner1.jpg" alt="" />
                </div>
            </div>
            <div id="middle3">
                <div id="coupon">
                    <img class="backimage" src="./images/coupon1.jpg" alt="" />
                    <img 
                        class="backimage"
                        
                        src="./images/couponmenu1.jpg"
                        alt=""
                    />
                </div>
            </div>
            <!-------------------------------- 화면 하단부 -------------------------------->
            <!-- <div id="bottom">
                <div>
                    회사 마크
                    <img
                        src="./images/title2.png"
                        style="transform: translate(0, 40px);"
                    />
                </div>
            </div> -->
        </div>

        <script src="js/slick.min.js"></script>
        <script>
            //상단 메뉴 css
            $(".menubar").mouseover(function () {
                $(this).css("border-bottom", "5px solid orange");
            });
            $(".menubar").mouseout(function () {
                $(this).css("border-bottom", "");
            });
            //상단 메뉴 클릭시
            $(".menubar").click(function () {
                location.href = $(this).data("lo");
            });

            $(window).resize(function () {
                if ($(window).width() < 970) {
                    // console.log($(window).width());
                    $("#topcenter").css("transform", "translate(-100px, 0)");
                } else {
                    $("#topcenter").css("transform", "translate(0, 0)");
                }
            });
            
            //쿠폰
            $("#coupon").click(function(){
            	//여기서 session 이 있을때랑 없을때랑 나눠주면 된다.
            	<c:if test = "${not empty userseq}">
	            	
	            	$.ajax({
                		type : "GET",
                		url : "/AtTicketProject/userpromotionadd.do",
                		data : "",
                		async: true,
                		dataType: "text",
                		success : function(result) {
                			
                			if (result == 1) {
                				//이미 발급받은 경우
                				alert("해당 쿠폰을 소유중입니다.");
                			} else {
                				//발급받은적이 없는 경우
                				alert("쿠폰이 발급되었습니다.");
                			}
							
                			
                		},
                		error : function(a,b,c) {
                			console.log(a,b,c);
                		}
                	});//여기까지가 ajax
	            	
	            	
            	</c:if>
	            <c:if test = "${empty userseq}">
	            	alert("로그인이 필요한 서비스 입니다.");
	            </c:if>
            	
            	
            }); 

            //마이페이지 클릭시 이동
            $("#mypage").click(function () {
                location.href = "usermypage.do";
            });
            
          //로그인 java 로 이동
            $("#login").click(function() {
                location.href = "/AtTicketProject/userlogin.do";
            });
            
            //로그아웃 java 로 이동
            $("#logout").click(function() {
                location.href = "/AtTicketProject/userlogout.do";
            });
            
            //로그인 java 로 이동
            $("#slogin").click(function() {
                location.href = "/AtTicketProject/userlogin.do";
            });
            
            //로그아웃 java 로 이동
            $("#slogout").click(function() {
                location.href = "/AtTicketProject/userlogout.do";
            });
        </script>
    </body>
</html>
        