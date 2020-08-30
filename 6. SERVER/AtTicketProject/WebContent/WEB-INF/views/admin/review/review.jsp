<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/AtTicketProject/css/adminmain.css">
<style> /* 랭킹 */
  /* 등록순, 오름차순, 내림차순 */
        .selectNotice {
            width: 80px;
            /* text-align: center; */
            margin: 10px 0px;
            margin-bottom: -10px;
            background-color: white;
            border: 0px;
            height: 20px;
            border-right: 1px solid #999;
            color: #777;
            padding: 0px;
            padding-right: 5px;
            /* font-size: 1.5em; */
        }
        
        #left {
           position: absolute;
           left: 0px;
           top: 0px;
           width: 250px;
           height: 1500px;
           background-color: #444;
           text-align: center;
           z-index: 10;
       }

        .selectNotice:last-child {
            border-right: 0px;
        }

        .selectNotice:hover {
            color: #111;
            font-weight: bold;
        }

        #selectable {
            margin-top: 10px;
            margin-left: 280px;
        }

        #title {
            /* text-align: center; */
            margin-left: 280px;
            margin-top: 50px;
            width: 1500px;
            border-bottom: 1px dashed black;
        }

        th,
        td {
            text-align: center;
        }

        tr td:nth-child(4) {
            text-align: left;
        }

        th {
            background-color: #999;
            /* color : white; */
        }

        #slctp1,
        #slctp2 {
            float: left;
            margin-left : 100px; 
            margin-bottom: 0px;
        }

        #slctp2 {
            margin-top: 10px;
            margin: 10px auto;
            margin-bottom: 10px;
            width: 300px;
            margin-left: 450px;
        }

        #searchlogo:hover {
            cursor: pointer;
            /* background-color: rgb(red, green, blue); */
        }

        #manipulate {
            margin-left: 1040px;
        }

        /* 수정하는 버튼  */
        .edit {
            width: 120px;
            height: 50px;
            border: 0px;
            font-size: 1.3em;
            font-weight: bold;
            margin: auto 30px;
            margin-top: 80px;
            background-color: #D5D5D5;
            color: #333;
            border-radius: 10px;
            visibility: hidden;
        }

        .pagebar {
            margin-left: 400px;
        }

        /* 페이징바 색상 */
        .pagination>.active>a,
        .pagination>.active>span,
        .pagination>.active>a:hover,
        .pagination>.active>span:hover,
        .pagination>.active>a:focus,
        .pagination>.active>span:focus {
            background-color: #999999;
            border-color: #eeeeee;
        }

        .pagination>li>a,
        .pagination>li>span {
            color: black;
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
            /* background-color: #333; */

        }
        
        #manipulate2 {
            margin-left: 1560px;
        }
        
          .modified2 {
            border : 0px;
            border-radius: 5px;
            background-color: #999;
            outline: none;
            font-weight: border;
            color : rgb(220,220,220);
            height : 35px;
            font-weight: bold    
        }
        .modified2:hover {
            color : white;
            /* background-color: #333; */

        }

        tr td:nth-child(4):hover {
            cursor: pointer;
            width: 250px;
            text-decoration: underline;
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
                margin-left: 185px;
            }

            .eve-mlist-dday {
                text-align: center;
            }

            .evemark {
                width: 60px;
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
            
             .noticeimg {
                width: 250px;
            }
            
            .event-main-list {
            	margin-top:20px;
            	margin-left:280px;
            }
            
             #boxtable {
            	margin-left:150px;
            }
            
            #topmenu{
            	margin-left:-150px;
            }
            
             
</style>


</head>
<body>
    <div id="title">
        <h1 style="color: #555; font-weight: bold;
        font-family: Arial;
        font-size: 3em;">리뷰 게시판 <small>> Home </small></h1>
    </div>
    <!-- 그림 부분 -->
	<div class="event-main-list">
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="../images/notice1.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">이벤트</p>
                            <p class="evetit">연극 <가족사진> 리뷰 이벤트</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">1000 포인트 지급</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="../images/notice2.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">이벤트</p>
                            <p class="evetit">
                                뮤지컬 <베르테르> 리뷰 이벤트
                            </p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">1000 포인트 지급</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="../images/notice3.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">이벤트</p>
                            <p class="evetit">연극 <가족사진> 리뷰 이벤트</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">1000 포인트 지급</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="../images/notice4.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">이벤트</p>
                            <p class="evetit">뮤지컬 <오페라의 유령> 리뷰 이벤트 -</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">1000 포인트 지급</p>
                        </div>
                    </div>
                    <div id="eventbox">
                        <img
                            class="noticeimg"
                            src="../images/notice4.jpg"
                            alt=""
                        />
                        <div class="eve-mlist-box">
                            <p class="evemark">이벤트</p>
                            <p class="evetit">뮤지컬 <오페라의 유령> 리뷰 이벤트 -</p>
                            <p class="evetxt">2020.07-15 ~ 2020.08.31</p>

                            <p class="eve-mlist-dday">1000 포인트 지급</p>
                        </div>
                    </div>
                </div>
                
      <!-- 그림 끝 부분 -->
  <div id = "boxtable">
    <div id="selectable">

        <div id="slctp1">
            <button class="selectNotice" style="outline : none;"><span><i
                        class="glyphicon glyphicon-sort"></i></span>등록순</button>
            <button class="selectNotice" style="outline : none;"><span><i
                        class="glyphicon glyphicon-sort"></i>오름차순</button>
            <button class="selectNotice" style="outline : none;"><span><i
                        class="glyphicon glyphicon-sort"></i>내림차순</button>
            <!-- <input type="button" class = "selectNotice" value = "등록순">
            <input type="button" class = "selectNotice" value = "오름차순">
            <input type="button" class = "selectNotice" value = "내림차순"> -->
        </div>
        <div id="slctp2">
            <div class="input-group">
                <input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력하세요." value="${search}">
                <span class="input-group-addon" id="searchlogo"><i class="glyphicon glyphicon-search"></i></span>
            </div>
        </div>
		 
        <table style="margin-left: 110px; margin-top: 30px; width: 990px;" class="table table-bordered table-striped">
            <tr>

                <th><input type="checkbox" id="cbAll"></th>
                <th style="width: 70px;">번호</th>
                <th style="width: 70px;">태그</th>
                <th style="width: 500px;">제목</th>
                <th style="width: 100px;">이름</th>
                <th style="width: 100px;">날짜</th>
                <th style="width: 70px;">읽음</th>
                <th style="width: 80px;">좋아요</th>
            </tr>
            
            <c:if test="${not empty search and list.size() == 0}">
              	<tr>
              		<td colspan="8">검색 결과가 없습니다.</td>
              	</tr>                    	
            </c:if>
            
            <c:if test="${empty search and list.size() == 0}">
              	<tr>
              		<td colspan="8">게시물이 없습니다.</td>
              	</tr>                    	
            </c:if>
            
            <c:forEach items="${list}" var="list">
				<tr>
				    <td><input type="checkbox" class="cb" name="cb" value="${list.seq}">
				    <td>${list.seq}</td>
				    <td>후기</td>
				    <td data-seq="${list.seq}">${list.title}</td>
				    <td>${list.cname}</td>
				    <td>${list.regdate}</td>
				    <td>${list.rview}</td>
				    <td>0</td>
				</tr>
            </c:forEach>
            
        </table>

        <!-- 내용물 수정/삭제 페이지 -->
        <div id="manipulate">
            <button class="modified" id="delbtn" onclick="deleteReview();"><i class="glyphicon glyphicon-trash"></i> 삭제</button>
        </div>

        <!-- 하단 페이지 선택 바 -->
		${pagebar}

		</div>
		
		
	<%@include file="/WEB-INF/views/inc/menu.jsp"%>
	<script>
	<%@include file="/WEB-INF/views/inc/adminScript.jsp" %>	
	var cbAll = document.getElementById("cbAll");
    var cb = document.getElementsByClassName("cb");
    var count = 0;
    var tr = document.getElementsByTagName("tr");

    cbAll.onchange = function(){
        for(var i=0;i<cb.length;i++){
                cb[i].checked = cbAll.checked;
            }
    }

    function deleteReview() {
        
        if ($(".cb:checked").length > 0) {
        	//alert($(".cb").serialize());
        	location.href="/AtTicketProject/review/adminreviewdelete.do?" + $(".cb").serialize();
		} else {
			alert("삭제할 리뷰를 선택하세요.");
		}
        
    };
    
    
    $("#delbtn2").click(function(){
        if($('.eventch').is(':checked') == true) {
            if(confirm("정말로 삭제하시겠습니까?")){

            }
        } else {
            alert("하나 이상을 체크하시오.");
        }
    });

    for (var i = 0; i < tr.length; i++) {
        tr[i].children[3].onclick = function () {
        	 //alert($(this).data("seq"));
        	 location.href = "/AtTicketProject/review/reviewupdate.do?seq=" + $(this).data("seq");
        };
    }
	
    $("#makebtn2").click(function(){
    	   window.open("/AtTicketProject/review/eventupdate.do", "예매추가", "width=500,height=300");
    });
    
    $("#modifybtn2").click(function(){
    	if($('.eventch').is(':checked') == true) {
 	   		window.open("/AtTicketProject/event/eventinfoupdate.do", "예매수정", "width=500,height=300");
    	} else {
    		  alert("하나 이상을 체크하시오.");
    	}
 	});
    
    
    
    $("#search").keydown(function() {
    	if (event.keyCode == 13) {
    		location.href = "/AtTicketProject/review/adminreview.do?search=" + $("#search").val();
    	}
    });
    
    $("#searchlogo").click(function() {
    	location.href = "/AtTicketProject/review/adminreview.do?search=" + $("#search").val();
    });
  

    </script>
</body>
</html>