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
         #chart {
                width: 800px;
            }

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
            color: white;
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
        
    

.event-division {
    text-align: center;
    font-size: 0;
    margin-bottom: 60px;
}








   
.pbar {
    width: 370px;
}

#title {
                margin: 0;
                padding: 20px;
                padding-top: 35px;
            }

            #tblList {
                width: 1200px;
                margin: 15px auto;
            }

            #tblList th:nth-child(1) {
                width: 60px;
            }
            #tblList th:nth-child(2) {
                width: 360px;
            }
            #tblList th:nth-child(3) {
                width: 90px;
            }
            #tblList th:nth-child(4) {
                width: 110px;
            }
            #tblList th:nth-child(5) {
                width: 60px;
            }
            #tblList th:nth-child(6) {
                width: 60px;
            }

            tblList th,
            #tblList td {                
                text-align: center;
            }
            #tblList td:nth-child(2) {
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
                margin-bottom: 20px;
                
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

            
            
            .btns {
                /* border: 1px solid black; */
                width: 750px;
                margin: 0px auto;
                margin-bottom: 50px;                
            }

            .btns button {
                position: relative;
                left: 220px;
                bottom: -20px;
            }
            .banner2 {                            
                
                width: 1200px;
                margin: 0px auto;
                
                
                
            }
            .banner3 {
                position: relative;
                bottom: 350px;
                width: 200px;
                height: 500px;
            }
            .banner4 {
                position: relative;
                bottom: 850px;
                width: 200px;
                height: 500px;
                left: 1650px;
            }



    </style>
</head>
<body>
     <form method="POST" enctype="multipart/form-data" action="/AtTicketProject/userrevieweditok.do" >
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
            
            
            
        <hr>
<!-------------------------------- 내용부분 -------------------------------->
        <p class="event-main-tit" style="margin-top: 150px; font-size:2em;"></p>
        <h2 style="text-align: center;">리뷰 게시판</h2>

            <table class="table table-borderd" style="width: 1200px; margin: 0px auto;">
                <tr>
                    <th style="width: 120px;">제목</th>
                    <th style="width: 650px;">
                        <input type="text" name="title" class="form-control" value="${dto.title}" required/>
                    </th>
                </tr>
                <tr>
                    <th style="width: 150px;">장르</th>
                    <th style="width: 650px;">
                       <select id="genre" name="genre" class="form-control" required>
                        	<option value="0" selected disabled hidden>장르를 고르세요.</option>
                            <option value="concert">콘서트</option>
                            <option value="musical">뮤지컬</option>
                            <option value="theater">연극</option>
                            <option value="classic">클래식</option>
                            <option value="exhibition">전시</option>
                        </select>

                    </th>
                </tr>
                <tr>
                    <th style="width: 150px;">공연제목</th>
                    <th style="width: 650px;">
                        <select class="form-control" id="showTitle" name="showTitle" required>
                            <option value="0" selected disabled hidden>공연 제목을 선택하세요.</option>
                            
                        </select>
                    </th>
                </tr>
                
                <tr>
                    <th style="width: 150px;">내용</th>
                    <th style="width: 650px;">
                        <textarea
                        	name = "content"
                            class="form-control"
                            style="height: 200px;"
                            required
                        >${dto.content}</textarea>
                    </th>
                </tr>
               
                <tr>
                    <th style="width: 150px;">파일</th>
                    <th style="width: 650px;">
                    	
                        <input type="file" class="form-control" name="rfile"/>
                        <c:if test="${not empty dto.rfile}">
                        <span>${dto.rfile}</span>
                        </c:if>
                    </th>
                </tr>
               
            </table>
            <div class="banner3">
                <img style="margin-left: 40px; width: 200px; height: 600px;" src="./images/banner3.jpg" alt="">
            </div>
            <div class="banner4">
                <img style="margin-right: 40px; width: 200px; height: 600px;" src="./images/banner4.jpg" alt="">
            </div>

            

        </div>
        </div>
        <div class="event-main-list">                
                    
                    
                     
        </div>
        <div class="btns">                
            <button class="btn btn-primary">
                <span class="glyphicon glyphicon-ok"></span>글수정
            </button>
        </div>
        <div class="banner2">
        <img style="margin-bottom: 40px; width: 1200px;" src="./images/banner2.png" alt="">
        </div>
        
        <input type="hidden" value="${dto.rseq}" name="rseq">
       	
        </form>

        
        
         
            
            
            
<!-------------------------------- 화면 하단부 -------------------------------->
        <div id="bottom">
            <div style="width: 1600px; margin: auto;">
                <!-- 회사 마크 -->
                <img src="./images/title2.png" style="transform: translate(0, 40px);">
            </div>
        </div>



    <script src="js/slick.min.js"></script>
    <script>
    
	  //예매한 공연 목록
		
		var userseq = ${userseq};
		
		$("#genre").change(function(){
			$("#showTitle *").remove();
			//alert($(this).find(":selected").val());
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/userreviewshow.do",
				data: "genre=" + $(this).find(":selected").val() + "&cseq=" + userseq,
				dataType: "json",
				success: function(result) {
					$(result).each(function(index, item){
						$("#showTitle *").remove();
						$("#showTitle").append("<option value = " + item.showseq + ">" + item.showname +"</option>");
					});
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});

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