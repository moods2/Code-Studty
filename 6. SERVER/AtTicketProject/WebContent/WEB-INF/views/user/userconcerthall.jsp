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
        
        
        .local-main-tit {
    text-align: center;
    font-size: 26px;
    font-weight: bold;
    font-family: 'Noto Sans KR', 'NanumBarunGothic', '맑은 고딕', 'Malgun Gothic', sans-serif;
    margin-bottom: 38px;
}

.local-division {
    text-align: center;
    font-size: 0;
    margin-bottom: 60px;
}


.local-main-list {
    /* display: inline-block; */
    width: 1500px;
    margin: 0px auto;
    margin-left: 185px;
}





.evetit{
    text-align: center;
}
.evetxt{
    color: orange;
    /* font-size: 11px; */
    text-align: center;
}
#localbox {
    display: inline-block;
    width: 240px;
    height: 240px;
    margin-left: 50px;
    background-image: url("./images/Yes24hall.png");
    background-repeat: no-repeat;
    background-size: cover;
    border-radius: 100%;
    z-index: 2;
    
    

}

#localbox > img {
    /* transform: scale(.9); */
    transition: all .5s;
}
   
.pbar {
    width: 370px;
}

.localimg {
    width: 240px;
    height: 240px;
    border: 1px solid white;
    border-radius: 100%;
    opacity: 0.4;
    z-index: 1;
    cursor: pointer;
    
    
}

.localimg:hover {
/* transform: scale(1.2); */
    opacity: 1;
}
#title {
                margin: 0;
                padding: 20px;
                padding-top: 35px;
            }

            #tblList {
                width: 1200px;
                margin: 20px auto;
                
            }

            #tblList th:nth-child(1) {
                width: 100px;
            }
            #tblList th:nth-child(2) {
                
                width: 250px;
            }
            #tblList th:nth-child(3) {
                width: 350px;
            }
            #tblList th:nth-child(4) {
                width: 200px;
            }
             #tblList td:nth-child(2):hover {
                cursor: pointer;
                
            }
            #tblList td:nth-child(3):hover {
                 cursor: pointer;
            }
            

            tblList th,
            #tblList td {                
                text-align: center;
            }
            #tblList td:nth-child(3) {
                text-align: left;
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
                width: 700px;
                
                
                position: relative;
                /* left: 600px; */
                top: 0px;
             
                
                
            }

            .pagebar {
                text-align: center;
            }
            th {
                background-color: #eeeeee;
                text-align: center;
            }

            .noticemenu{
                font-size: 15px;
                color: gray;
                padding-right: 15px;
                padding-bottom: 15px;
            }

            .local {
                display: inline-block;
                color: #888888;
                font-size: 18px;
                font-weight: bold;
                border-bottom: 5px solid gray;
                width: 160px;
                text-align: center;
            }
            .hallname {
                margin-left: 100px;
                color: white;
                font-size: 20px;
                
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


    </style>
</head>
<body>
    
    <div id="main">
<!-------------------------------- 화면 상단부 -------------------------------->
        <div id="top">
            <div id="topmenu">
                <!-- 상단메뉴 좌측(메인화면으로 돌아가기) -->
                <a href="#" id="topleft"></a>
                <!-- 상단메뉴 센터(콘서트, 뮤지컬, 연극, 클래식, 전시) -->
                <span data-item="item1" class="menubar">콘서트</span>
                <span data-item="item2" class="menubar">뮤지컬</span>
                <span data-item="item3" class="menubar">연극</span>
                <span data-item="item4" class="menubar">클래식</span>
                <span data-item="item5" class="menubar">전시</span>
                <!-- 상단메뉴 우측(랭킹, 이벤트, 검색창, 마이페이지) -->
                <div id="topright">
                    <span data-item="item6" class="menubar">랭킹</span>
                    <span data-item="item7" class="menubar">이벤트</span>
                    <input type="text" value="" id="search">
                    <label for="search" class="glyphicon glyphicon-search"
                        style="font-size: 14px; cursor: pointer;"></label>
                    <div class="glyphicon glyphicon-user" 
                        style="font-size: 14px; cursor: pointer; margin: 0 10px; "></div>
                </div>
            </div>
            <!-- 메인화면 슬라이더 -->
            
        <hr>
<!-------------------------------- 내용부분 -------------------------------->
        <p class="local-main-tit" style="margin-top: 150px; font-size:3em;">공연장 정보</p>
        <div class="local-division">
            
            

        </div>
        <div class="local-main-list">                
                    <div id="localbox">
                        
                        <img class="localimg" src="./images/hall1.jpeg" alt="">                        
                        
                        
                    </div>                    
                    <div id="localbox">
                        <img class="localimg" src="./images/hall2.jpeg" alt="">
                        
                    </div>
                    <div id="localbox">
                        <img class="localimg" src="./images/hall3.jpeg" alt="">
                                        
                    </div>
                    <div id="localbox">
                        <img class="localimg" src="./images/hall4.jpeg" alt="">
                                        
                    </div>
                    <div id="localbox">
                        <img class="localimg" src="./images/hall5.jpeg" alt="">
                                         
                    </div>
                     
        </div>
        <!-- 검색창 -->
        <div class="searchbox">           
                
                <!-- <span style="position:relative; top : 50px; right: 380px;;" class="noticemenu">등록순</span>                                
                <span style="position:relative; top : 50px; right: 380px;;" class="noticemenu">오픈일순</span>                
                <span style="position:relative; top : 50px; right: 380px;;" class="noticemenu">조회순</span> -->
            <div class="search">
                <div class="form-group">
                    <div class="input-group">
                        
                        <input
                            type="text"
                            class="form-control"
                            placeholder="공연장명을 입력하세요"
                            style="height: 70px;"
                        />
                        <span class="input-group-addon"
                            ><i class="glyphicon glyphicon-search"></i
                        ></span>
                    </div>
                </div>
            </div>
            </div>
            <div style="width: 1200px; margin: 80px auto; padding-left: 20px;">
                <div class="local">전체</div>
                <div class="local">서울</div>
                <div class="local">경기/인천</div>
                <div class="local">대전/충청/강원</div>
                <div class="local">부산/대구/울산/경상</div>
                <div class="local">광주/전라</div>
                <div class="local">제주</div>

            </div>
         <table id="tblList" class="table table-striped">
                <thead>
                    <tr>
                        <th>지역</th>
                        <th>공연장명</th>
                        <th>주소</th>
                        <th>전화번호</th>                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>서울</td>
                        <td>M컨템포러리</td>
                        <td>서울특별시 강남구 봉은사로 120 1F</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>강원</td>
                        <td>강릉시 정동초등학교.</td>
                        <td>강원도 강릉시 강동면 헌화로 1055</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>대학로 소극장 알과핵</td>
                        <td>서울특별시 종로구 동숭길 25</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>글루호텔 라운지</td>
                        <td>서울특별시 종로구 율곡로 228 글로호텔 라운지 B1</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>세종</td>
                        <td>세종호수공원 수상무대섬</td>
                        <td>세종특별자치시 연기면 세종리 1201</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>경상</td>
                        <td>밀양아리나 스튜디오Ⅱ</td>
                        <td>경남 밀양시 부북면 가산리 82</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>대전</td>
                        <td>대백프라임홀(대백프라자 10층)</td>
                        <td>대구광역시 중구 명덕로 333</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>대전</td>
                        <td>대전 프랑스문화원(앙트르뽀)</td>
                        <td>대전광역시 중구 대전천서로 201 대전 프랑스문화원</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>비어바나</td>
                        <td>서울특별시 영등포구 도림로129길 5-1 비어바나</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>서울 코엑스 C, D홀</td>
                        <td>서울특별시 강남구 영동대로 513 코엑스</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>스페이스 코르</td>
                        <td>서울특별시 종로구 대학로 19</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>낙타브루잉</td>
                        <td>서울특별시 강남구 강남대로106길 14</td>
                        <td>-1</td>
                        
                    </tr>
                    <tr>
                        <td>경상</td>
                        <td>밀양아리나 성벽극장(야외극장)</td>
                        <td>경남 밀양시 부북면 가산리 82</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>대학로 스타시티 7층 후암씨어터</td>
                        <td>서울특별시 종로구 대학로11길 23 7층</td>
                        <td>-</td>
                        
                    </tr>
                    <tr>
                        <td>서울</td>
                        <td>노들섬 라이브하우스 외</td>
                        <td>서울특별시 용산구 양녕로 445</td>
                        <td>-</td>
                        
                    </tr>
                </tbody>
            </table>

            
            <nav class="pagebar">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
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

        $(".noticemenu").mouseover(function() {
            $(this).css("border-top", "5px solid orange");
            $(this).css("color", "black");
            $(this).css("font-weight", "bold");
        });
        $(".noticemenu").mouseout(function() {
            $(this).css("border-top", "");
            $(this).css("color", "gray");
            $(this).css("font-weight", "none");
        });

        $(".local").mouseover(function() {
            $(this).css("border-bottom", "5px solid orange");
            $(this).css("color", "black");
            $(this).css("font-weight", "bold");
        });
        $(".local").mouseout(function() {
            $(this).css("border-bottom", "5px solid gray");
            $(this).css("color", "gray");
            $(this).css("font-weight", "none");
        });

        

       

        

        


    </script>

</body>
</html>