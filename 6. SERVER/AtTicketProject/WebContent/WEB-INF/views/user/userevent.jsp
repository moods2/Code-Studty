<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
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
        body { margin: 0 auto; }
        h1 { font-family: "Arial Black"; font-weight: bold; }
        #main { width: 100%; }
        #top {
            /* border: 1px solid black; */
            min-width: 1600px;
            height: 650px;
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
            min-width: 1600px;
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
        .prev {
            float: left;
            padding-left: 20px;
            cursor: pointer;
        }
        .after {
            float:right;
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
        #frogue-container, .frogue-chat {
            position: absolute;
            left:20px;
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
        .rank, .region {
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
        .slider {
            margin: 0px auto;
            position: relative;
            top: 150px;
        }
        .slick-slide img {
            transform: scale(.9);
            transition: all .5s;
        }
        .slick-center img {
            transform: scale(1);
            transition: all .5s;
        }
        .event-main-tit {
    text-align: center;
    font-size: 26px;
    font-weight: bold;
    font-family: 'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;
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
    width: 1500px;
    margin: 0px auto;
}





.evemark{
    margin-top: 5px;
    border: 1px solid red;
    color: red;
    width: 80px;
    text-align: center;
    
}

.evetxt{
    color: rgba(156, 156, 156, 0.76);
    font-size: 11px;
}
#eventbox {
    display: inline-block;
    width: 400px;
    margin-left: 80px;
}
   
.pbar {
    width: 370px;
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
            
            #submenu {
                border: 1px solid rgb(202, 202, 202);
                background-color: rgb(82, 82, 82);
                border-radius: 5px;
                color: white;
                position: fixed;
                left: 20px;
                top: 100px;

                width: 120px;
                text-align: center;
                display: none;
                box-shadow: 1px 1px 4px rgb(158, 158, 158);
            }
            #submenu > ul {
                list-style-type: none;
                padding: 10px;
                margin: 0;
            }
            #submenu > ul > li {
                padding: 15px 5px;
                cursor: pointer;
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
            <!-- 메인화면 슬라이더 -->
            <div class="slider">
                <div><img src="./images/eventslide1.png"></div>
                <div><img src="./images/eventslide2.png"></div>
                <div><img src="./images/eventslide3.png"></div>
                <div><img src="./images/eventslide4.png"></div>
                <div><img src="./images/eventslide5.png"></div>
            </div>
        </div>
        <hr>
<!-------------------------------- 내용부분 -------------------------------->
        <p class="event-main-tit">이벤트</p>
        <div class="event-division">
            <a href="#" class="on">"전체보기"::after</a>            

        </div>
        
        
        <div class="event-main-list">     
       		 <c:forEach items="${list}" var="dto">        
       		 <c:if test="${dto.delflag==0}">   
                    <div id="eventbox">
                    <a href="http://localhost:8090/AtTicketProject/userpromotion.do" target='_self'>
                        <img style="cursor: pointer;" src="./images/${dto.banner}" ></a>
                        <div class="eve-mlist-box">
                            <p class="evemark">${dto.eindex}</p>
                            <p class="evetit">${dto.title}</p>
                            <p class="evetxt">${dto.startdate} ~ ${dto.enddate}</p>
                            <div class="evepc" data-percent="90">
                                <progress value="90" max="100" class="pbar"></progress>                         
                            </div>
                            <p class="eve-mlist-dday">10일 남음</p>
                        </div>           
                    </div>      
             </c:if>
             </c:forEach>               
        </div>
        
<!-------------------------------- 화면 하단부 -------------------------------->
        <div id="bottom">
                <div>
                    <!-- 회사 마크 -->
                    <img src="./images/title2.png" />
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
        </div>



    <script src="js/slick.min.js"></script>
    <script>

        //상단 메뉴 css
        $(".menubar").mouseover(function() {
            $(this).css("border-bottom", "5px solid orange");
        });
        $(".menubar").mouseout(function() {
            $(this).css("border-bottom", "");
        });
        //상단 메뉴 클릭시
        $(".menubar").click(function() {
            location.href = $(this).data("lo");
        });

        var flag = false;

        $(document).scroll(function() {
            //메뉴가 시야에서 사라지는 순간 -> 메뉴를 붙박이로 만들기
            if ($(document).scrollTop() > $("#middle").position().top) {
                $("#topmenu").css({
                    width: "100%",
                    position: "fixed",
                    top: "0px",
                    bottom: "",
                    zIndex: "1",
                    "background-color": "white"
                });
                $(window).resize(function() {
                    if($(window).width() < 970) {
                        // console.log($(window).width());
                        $("#topcenter").css("transform", "translate(-100px, 0)");
                    } else {
                        $("#topcenter").css("transform", "translate(0, 0)");
                    }
                });
            };

            //상단 헤더(top)이 눈에 보일때 쯤
            if ($(document).scrollTop() <= $("#middle").position().top) {
                $("#topmenu").css({
                    position: "absolute",
                    top: "0px",
                    bottom: "",
                    "background-color": "transparent"
                });
            }
        });


        //이미지에 마우스 올릴때
        $(".img, .rank, .region").mouseover(function() {
            $(this).css("box-shadow", "1px 1px 1px 2px gray");
        });
        //이미지에 마우스 뗄때
        $(".img, .rank, .region").mouseout(function() {
            $(this).css("box-shadow", "");
        });
        
        //이미지 클릭시 이동
        $(".img").click(function() {
            location.href = "#";
        });

        //주간랭킹
        var temp = 0;
        $("#rankprev").click(function() {
            if (temp == 0) {
                temp -= 1478;
            } else {
                temp += 1478;
            }
            $("#rankpage").css("transform", "translate(" + temp + "px, 0)")
            $("#rankpage").css("transition", "all .5s linear")
        });
        $("#rankafter").click(function() {
            temp -= 1478;
            if (temp <= -(1478*2)) {
                temp = 0;
            }
            $("#rankpage").css("transform", "translate(" + temp + "px, 0)")
            $("#rankpage").css("transition", "all .5s linear")
        });
        
        //상단 이미지 슬라이더
        $('.slider').slick({
            centerMode: true,
            infinite : true,
            autoplay : true,
            autoplaySpeed : 3000,
            dots : true,
            dotsClass : "slick-dots",
            centerPadding: '180px',
            slidesToShow: 3,
            responsive: [
                {
                breakpoint: 768,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '180px',
                    slidesToShow: 3
                }
                },
                {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '180px',
                    slidesToShow: 1
                }
                }
            ]
        });

        //마이페이지 클릭시 이동
        $("#mypage").click(function() {
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