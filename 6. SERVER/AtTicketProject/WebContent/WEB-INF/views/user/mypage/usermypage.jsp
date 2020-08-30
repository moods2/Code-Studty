<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/usermypage.css" />

    <style>

        #right {
            /* border: 1px solid black; */
            float: right;
            width: 850px;	
            height: 993px;
            margin-left: 15px;
        }
        .event {
            border: 1px solid #D3D3D3;
            width: 410px;
            height: 100px;
            float: left;
            margin-bottom: 25px;
        }
        .event:nth-child(2) {
            float:right;
        }
        .event > p:first-child {
            background-color: #7E9CB6;
            border: 1px solid #6D88A3;
            height: 35px;
            color: white;
            font-weight: bold;
            padding: 6px 20px;
            font-size: 16px;
        }
        .event > p:first-child > span {
            font-weight: normal;
            font-size: 14px;
        }
        .event > p:first-child > span > span { text-decoration: underline; }
        .event > ul > li {
            margin-bottom: 5px;
            font-size: 13px;
        }
        .event > ul > li > span {
            text-decoration: underline;
            color: red;
            cursor: pointer;
        }
        .mycount > p > span > span { color: red; text-decoration: underline; }
        .mycount {
            /* border: 1px solid #DBE4F3; */
            width: 100%;
            height: 150px;
            margin-bottom: 25px;
        }
        .mycount > p:first-child {
            color: #444;
            font-size: 15px;
            font-weight: bold;
        }
        .mycount > p > i {
            margin-right: 3px;
            font-size: 12px;
            color: #888;
        }
        .mycount > p > span {
            font-weight: normal;
            margin-left: 10px;
            font-size: 12px;
        }
        .mycount #tbl1 {
            border-collapse: collapse;
            width: 100%;
        }
        #tbl1 th, #tbl1 td {
            border: 1px solid #D3D3D3;
            text-align: center;
            font-size: 13px;
            color: #444;
            padding: 10px 0;
        }
        #tbl1 th {
            background-color: #EEE;
            border-top: 3px solid #4E7AD1;
            border-bottom: 1px solid #CCC;
        }
        #tbl1 td {
            border-left: 0;
            border-right: 0;
        }
        .mylist {
            border: 1px solid #ccc;
            border-top: 3px solid #4E7AD1;
            height: 133px;
            overflow: hidden;
        }
        .mylist > ul > li {
            width: 34%;
            height: 110px;
            font-size: 12px;
            list-style-type: none;
            padding: 5px;
            display: inline-block;
            margin-top: 10px;
            border-right: 1px dotted #ccc;
        }
        .mylist > ul > li:first-child { margin-left: -32px; }
        .mylist > ul > li:nth-child(3) { border: 0; }
        .mylist > ul > li > img {
            width: 60px;
            height: 70px;
        }
        .mylist > ul > div {
            text-align: center;
            margin-top: 40px;
            margin-left: -32px;
            font-size: 13px;
            padding: 5px;
        }
        .mylist button span {
            color: blue;
        }
        #tbl2 {
            border: 3px solid #4E7AD1;
            width: 100%;
        }
        #tbl2 th, #tbl2 td {
            border: 1px solid #B6C1DD;
            padding: 10px 15px;
            font-size: 13px;
        }
        #tbl2 th {
            background-color: #EEE;
            width: 150px;
        }
        
        
        
        /* ================================== */
        .mylist > ul > .myShowInterest {
        	width: 250px;
            padding: 5px 0;
            text-align: left;
            margin-top: 10px;
            float: left;
            margin-left: 20px;
            border-right: 1px solid #eee;
        }
        .mylist > ul > .myShowInterest:first-child{
            margin-left: -10px;
        }
        .mylist > ul > .myShowInterest:last-child{
            border-right: 0px;
        }
        .myShowInterest > img {
            width: 80px;
            height: 100px;
            float: left;
            margin: 0 10px;
        }
        .myShowInterest > p {
            margin-top: 30px;
            font-size: 12px;
            color: #444;
        }
		
		 #tblbook th, td{
        	text-align:center;
        }
        #tblbook th {border-top: 3px solid #4E7AD1;}
        
        #tblbook td{
        	text-align:center;
        }
        
        #tblbook td:nth-child(3){
        	text-align:left;
        }
        
        #tblwatch th{
        	text-align:center;
        	border-top: 3px solid #4E7AD1;
        }
        
        #tblwatch td {
        	text-align:center;
        }
        
         #tblwatch td:nth-child(1) {
        	text-align:left;
        }
        
         #tblwatch td:nth-child(4) {
        	text-align:left;
        }
        
        .tbl1 th, .tbl1 td {
            border: 1px solid #D3D3D3;
            text-align: center;
            font-size: 13px;
            color: #444;
            padding: 10px 0;
        }
        .tbl1 th {
           background-color: #EEE;
            border-top: 3px solid #4E7AD1;
            border-bottom: 1px solid #CCC;
        }
        .tbl1 td {
            border-left: 0;
            border-right: 0;
        }
    </style>
</head>
<body>
    
    <div id="main">
<!-------------------------------- 화면 상단부 -------------------------------->
        <%@include file="/WEB-INF/views/inc/mypagetopbar.jsp" %>
<!-------------------------------- 내용부분 -------------------------------->
        <div id="middle">
            <!-- 마이페이지 좌측 -->
        <%@include file="/WEB-INF/views/inc/mypageleft.jsp" %>
<!----------------------------------------------------------------------------->

            <!-- 마이페이지 우측 -->
            <div id="right">
                <div class="event">
                    <p>COUPON</p>
                    <ul>
                        <li>공연 할인 쿠폰 : 사용가능 <span class="coupon">${fn:length(clist)}</span> 매</li>
                        <li>공연 예매권 : 사용가능 <span class="coupon">0</span> 매</li>
                    </ul>
                </div>
                <div class="event">
                    <p>EVENT <span>| 현재 진행 중인 이벤트 <span>${fn:length(elist)}</span>건</span><input type="button" value="더보기" class="btn btn-default btn-xs" id="eventmore" style="float: right; outline: none;"></p>
                    <ul>
                    <c:forEach items="${elist}" var="event" begin="0" end="1" step="1">
                    
                        <li><a href="/AtTicketProject/userevent.do">${event.title}</a></li>
                        
                        <c:if test="${empty event.title}">
                        	<li><a href="#!">진행중인 이벤트가 없습니다.</a></li>
                        </c:if>
                        
                    </c:forEach>
                    </ul>
                </div>
                <div style="clear: both;"></div>
                 <div class="mycount">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>최근 예매내역<span>${username}님께서 최근 3개월간 예매하신 내역입니다.</span></p>
                    <table id="tblbook" class = "table table-bordered table-striped table-hover tbl1">
                        <thead>
                            <th>예매일</th>
                            <th>예매번호</th>
                            <th>공연명</th>
                            <th>관람일시</th>
                            <th>매수</th>
                            <th>예매상태</th>
                        </thead>
                        <tbody id = "tby1">
                        	 <c:if test = "${rlist.size() == 0}"> 
                            <tr>
                                <td colspan="6">최근 예매내역이 없습니다.</td>
                            </tr>
                            </c:if>
                            <c:if test = "${rlist.size() != 0 }">
                            <c:forEach items="${rlist}" var="rdto">
	                            <tr>       
	                            	<td>${rdto.bookdate}</td>
	                            	<td>${rdto.bookseq}</td>
	                            	<td>${rdto.showtitle}</td>
	                            	<td>${rdto.bookdate}</td>
	                            	<td>${rdto.cnt}</td>
	                            	<td>${rdto.bookstate}</td>
	                            </tr>
                            </c:forEach>
                            </c:if>
                        </tbody>
                    </table> 
                </div>
                 <div style="margin-left:350px;margin-top:-10px;" id="paging">
                        <button type = "button" id = "btnleft" class="glyphicon glyphicon-menu-left left"></button>
                        <span id = "page"> 
                        <span>${nowPageB}</span>
                        <span>(<span id = "nowPage">${nowPageB}</span>/${totalPageB})</span>
                        </span>
                        <button type = "button" class="glyphicon glyphicon-menu-right right" id = "btnright"></button>
                 </div>
                <div class="mycount">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>Egg포인트 적립내역<span>공연 예매로 인해 적립된 egg포인트 내역입니다.</span></p>
                    <table id="tbl1">
                        <thead>
                            <th>공연명(예매번호)</th>
                            <th>적립일</th>
                            <th>Egg포인트</th>
                            <th>적립상태</th>
                            <th>적립유형</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5">공연 예매로 인한 Egg포인트 적립내역이 존재하지 않습니다.</td>
                            </tr>
                        </tbody>
                    </table>
                    <p style="font-size: 11px; float: right; margin-top: 5px;">Egg포인트는 공연 관람일 혹은 후기 작성일 익일 지급됩니다.</p>
                </div>
                <div class="mycount">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>나의 관심 공연<span>'나의 관심 공연'이 <span>${totalCount}</span>개 있습니다.</span></p>
                    <div class="mylist">
                    
                        <ul>
                            <!-- <li>
                                <img src="http://tkfile.yes24.com/upload2/PerfBlog/202007/20200720/20200720-angel_new_36898.jpg">
                                <a href="#">
                                    뮤지컬 <어쩌면 해피엔딩> 2020
                                </a>
                                <a href="#">
                                    2020.06.30 ~ 2020.09.13<br>
                                    예스24스테이지 1관
                                </a>
                            </li> -->
                            
                            	<c:if test="${list.size() == 0}">
                                	<p>'나의 관심 공연'으로 담은 공연이 없습니다.</p>
                                	<button class="btn btn-default btn-xs" style="outline: none; margin-top: -5px;" id="add">관심 공연 담기<span>+</span></button>
                                </c:if>
                            	<c:forEach items="${list}" var="dto">
	                                <div class="myShowInterest">
	                                <img src="./images/${dto.myShowPoster}">
	                                <strong>${dto.myShowTitle }</strong>
	                                <p>${dto.myShowstart } ~ ${dto.myShowend }<br>
	                                ${dto.myShowTheater}</p>
	                                </div>
                        		</c:forEach>
                        </ul>
                    </div>
                </div>
               <div id = "mycountw" class="mycount">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>나의 관람 공연</p>
                    <div class="mylist" id = "mylist">
                    	<c:if test= "${wlist.size() == 0}">
                        <ul>
                            <div>
                                <p>'나의 관람 공연'이 없습니다.</p>
                            </div>
                        </ul>
                        </c:if>
                        
                        <c:if test = "${wlist.size() != 0}">
                        	<table class = "table table-bordered table-striped table-hover tbl1" id = "tblwatch" style="height:auto;">
                        		<thead>
                        			<th>공연명</th>
                        			<th>관람일</th>
                        			<th>예매번호</th>
                        			<th>주소</th>
                        		</thead>
        						<tbody id = "tby2">
	                        		<c:forEach items = "${wlist}" var = "wdto">
	                        			<tr>
	                        				<td>${wdto.showtitle}</td>
	                        				<td>${wdto.bdate}</td>
	                        				<td>${wdto.bookseq}</td>
	                        				<td>${wdto.showaddr}</td>
	                        			</tr>
	                        		</c:forEach>
                        		</tbody>
                        	</table>
                        </c:if>
                    </div>
                </div>
                     <div style="margin-left:350px;margin-top:-10px;" id="paging">
                        <button type = "button" id = "btnleftW" class="glyphicon glyphicon-menu-left left"></button>
                        <span id = "pageW"> 
                        <span>${nowPageW}</span>
                        <span>(<span id = "nowPageW">${nowPage}</span>/${totalPageW})</span>
                        </span>
                        <button type = "button" class="glyphicon glyphicon-menu-right right" id = "btnrightW"></button>
                    </div>
                <div class="mycount">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>나의 맞춤 알람 소식<span>최근 1주일 간 업데이트된 맞춤 알람 소식입니다.</span></p>
                    <table id="tbl2">
                        <tbody>
                            <tr>
                                <th>맞춤알람 공연</th>
                                <c:if test="${list1.size() == 0}">
                                	<td>최근 업데이트 소식이 없습니다.</td>
                                </c:if>
                                <c:if test="${list1.size() != 0}">
                                <td>
	                            	<p>
	                                <strong>${list1.get(0).myShowTitle}</strong> (
	                                ${list1.get(0).myShowstart } ~ ${list1.get(0).myShowend }
	                                ${list1.get(0).myShowTheater} )
	                                <button class="btn btn btn-default" style="padding: 2px 12px; margin-left: 10px;" onclick="location.href='/AtTicketProject/usertickekting.do?seq=${list1.get(0).myShowseq}'">예매하기</button>
	                                </p>
                                </td>
                                </c:if>
                            </tr>
                            <tr>
                                <th>티켓오픈 알람</th>
                                <c:if test="${list2.size() == 0}">
                                	<td>최근 업데이트 소식이 없습니다.</td>
                                </c:if>
                                <c:if test="${list2.size() != 0}">
                                <td>
	                            	<p>
	                                <strong>${list2.get(0).velltitle}</strong> (
						                                티켓 오픈 : ${list2.get(0).vellopenDate } / 
						                                알람 일시 : ${list2.get(0).velldate} )
						              <button class="btn btn btn-default" style="padding: 2px 12px; margin-left: 10px;" onclick="location.href='/AtTicketProject/show/usernoticetemp.do?noticeseq='+ ${list2.get(0).noticeseq }+'&page=&search='">상세정보</button>
	                                </p>
                                </td>
                                </c:if>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 챗봇 : 단비봇 -->
            <%@include file="/WEB-INF/views/inc/userchat.jsp" %>
            <!-- 제일 위로 돌아가기 버튼 -->
            <div id="movetop">↑</div>
        </div>
<!-------------------------------- 화면 하단부 -------------------------------->
        <%@include file="/WEB-INF/views/inc/mypagebottom.jsp" %>
    </div>



    <script>
    var begin = ${mapB.begin};
	var end = ${mapB.end};
	var totalPageB= ${totalPageB};
	var nowPageB = ${nowPageB};
	
	var beginW = ${map1.beginW};
	var endW = ${map1.endW};
	var totalPageW= ${totalPageW};
	var nowPageW = ${nowPageW};
	if(${wlist.size()}!=0){
		$("#mylist").css("border","none");
	}
    $("#btnleft").click(function() {

		nowPageB-=1;
		begin-=2;
		end-=2;
		$.ajax({
			type: "GET",
			url: "/AtTicketProject/myreok.do",
			data: "begin=" + begin + "&end=" + end + "&totalPageB=" + totalPageB + "&nowPageB=" + nowPageB,
			dataType: "json",
			success: function(result) {
				
				if (result.length == 0) {
					/* $(".left").attr("disabled",true); */
					return;
				}
				
				//alert(result.length);
				$("#tby1").empty();
				$(result).each(function(index, item) {
					//게시물 1개
					var temp = "";
					temp += "<tr>";
					temp += "<td style='width:15%;'>" + item.bookdate + "</td>";
					temp += "<td style='width:10%;'>" + item.bookseq + "</td>";
					temp += "<td style='width:43%;'>" + item.showtitle + "</td>";
					temp += "<td style='width:15%;'>" + item.bdate + "</td>";
					temp += "<td style='width:7%;'>" + item.cnt + "</td>";
					temp += "<td style='width:10%;'>" + item.bookstate + "</td>";
					temp += "</tr>";
						
					$("#tblbook > #tby1").append(temp); 
					$("#page").empty();
					var temp = "";		
					temp+="<span>"+ item.nowPageB+"</span>";
					temp+=" <span>(<span id = 'nowPage'>"+item.nowPageB+"</span>/"+item.totalPageB+")</span>";
					$("#page").append(temp);  
				});
				
			},
			error: function(a,b,c) {
				/* $(".left").attr("disabled",true); */
				console.log(a,b,c);
			}
			
		}); //ajax
		
	});

	$("#btnright").click(function() {
		
	begin+=2;
	end+=2;
	nowPageB +=1;
	$.ajax({
		type: "GET",
		url: "/AtTicketProject/myreok.do",
		data: "begin=" + begin + "&end=" + end + "&totalPageB=" + totalPageB + "&nowPageB=" + nowPageB,
		dataType: "json",
		success: function(result) {
			
			if (result.length == 0) {
				/* $(".right").attr("disabled",true); */
				return;
			}
			
			//alert(result.length);
			$("#tby1").empty();
			
			$(result).each(function(index, item) {
				//게시물 1개
				var temp = "";
				temp += "<tr>";
				temp += "<td style='width:15%;'>" + item.bookdate + "</td>";
				temp += "<td style='width:10%;'>" + item.bookseq + "</td>";
				temp += "<td style='width:43%;'>" + item.showtitle + "</td>";
				temp += "<td style='width:15%;'>" + item.bdate + "</td>";
				temp += "<td style='width:7%;'>" + item.cnt + "</td>";
				temp += "<td style='width:10%;'>" + item.bookstate + "</td>";
				temp += "</tr>";
					
				$("#tblbook > #tby1").append(temp); 
				$("#page").empty();
				var temp = "";
				temp+="<span>"+ item.nowPageB+"</span>";
				temp+=" <span>(<span id = 'nowPage'>"+item.nowPageB+"</span>/"+item.totalPageB+")</span>";
				$("#page").append(temp); 
			});
			
		},
		error: function(a,b,c) {
			/* $(".right").attr("disabled",true); */
			console.log(a,b,c);
		}
		
	}); //ajax

	});
	
	  $("#btnleftW").click(function() {

			nowPageW-=1;
			beginW-=2;
			endW-=2;
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/mywaok.do",
				data: "beginW=" + beginW + "&endW=" + endW + "&totalPageW=" + totalPageW + "&nowPageW=" + nowPageW,
				dataType: "json",
				success: function(result) {
					
					if (result.length == 0) {
						/* $(".left").attr("disabled",true); */
						return;
					}
					
					//alert(result.length);
					$("#tby2").empty();
					$("#mylist").css("border","none");
					$(result).each(function(index, item) {
						//게시물 1개
						
						var temp = "";
						temp += "<tr>";
						temp += "<td style='width:40%'>" + item.showtitle + "</td>";
						temp += "<td style='width:15%'>" + item.bdate + "</td>";
						temp += "<td style='width:10%'>" + item.bookseq + "</td>";
						temp += "<td>" + item.showaddr + "</td>";
						temp += "</tr>";
							
						$("#tblwatch > #tby2").append(temp); 
						$("#pageW").empty();
						var temp = "";		
						temp+="<span>"+ item.nowPageW+"</span>";
						temp+=" <span>(<span id = 'nowPageW'>"+item.nowPageW+"</span>/"+item.totalPageW+")</span>";
						$("#pageW").append(temp);  
					});
					
				},
				error: function(a,b,c) {
					/* $(".left").attr("disabled",true); */
					console.log(a,b,c);
				}
				
			}); //ajax
			
	});

		$("#btnrightW").click(function() {
			
		beginW+=2;
		endW+=2;
		nowPageW +=1;
		
		$.ajax({
			type: "GET",
			url: "/AtTicketProject/mywaok.do",
			data: "beginW=" + beginW + "&endW=" + endW + "&totalPageW=" + totalPageW + "&nowPageW=" + nowPageW,
			dataType: "json",
			success: function(result) {
				
				if (result.length == 0) {
					/* $(".right").attr("disabled",true); */
					return;
				}
				
				//alert(result.length);
				$("#tby2").empty();
				$("#mylist").css("border","none");
				$(result).each(function(index, item) {
					//게시물 1개
					var temp = "";
					temp += "<tr>";
					temp += "<td style='width:40%'>" + item.showtitle + "</td>";
					temp += "<td style='width:15%'>" + item.bdate + "</td>";
					temp += "<td style='width:10%'>" + item.bookseq + "</td>";
					temp += "<td>" + item.showaddr + "</td>";
					temp += "</tr>";
						
					$("#tblwatch > #tby2").append(temp); 
					$("#pageW").empty();
					var temp = "";
					temp+="<span>"+ item.nowPageW+"</span>";
					temp+=" <span>(<span id = 'nowPageW'>"+item.nowPageW+"</span>/"+item.totalPageW+")</span>";
					$("#pageW").append(temp); 
				});
				
			},
			error: function(a,b,c) {
				/* $(".right").attr("disabled",true); */
				console.log(a,b,c);
			}
			
		}); //ajax

		});
        //이벤트 더보기 클릭시 이동
        $("#eventmore").click(function() {
            location.href = "/AtTicketProject/userevent.do";
        });

        //movetop
        $("#movetop").click(function() {
            event.preventDefault();
            $("html, body").animate({
                scrollTop: 0
            }, 500);
        });

        //팝업창 가운데 배치
        var popupWidth = 900;
        var popupheight = 650;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        var popupY = (window.screen.height / 2) - (popupheight / 2);
        //관심 공연 담기 팝업창
        $("#add").click(function() {
            window.open("mypage_interest_popup.html","_black",`left=${popupX}, top=${popupY}, width=${popupWidth}, height=${popupheight};`);
        });

        //쿠폰에 매수 클릭시
        $(".coupon").click(function() {
            location.href = "/AtTicketProject/mypagecoupon.do";
        });

    </script>

</body>
</html>