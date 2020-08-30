<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="shortcut icon" href="./images/favicon.ico">
    <link rel="stylesheet" href="css/usermypage.css" />
    <style>

        #right {
            /* border: 1px solid black; */
            float: right;
            width: 850px;
            height: 993px;
            margin-left: 15px;
        }
        #right > h1 {
            font-size: 18px;
            margin-top: 0px;
            color: #444;
        }
        #right #datesearch {
            border: 1px solid #DDD;
            padding: 15px 20px;
            font-size: 12px;
            background-color: #F8F8F8;
            margin: 20px 0;
        }
        #right #datesearch > p {
            border-bottom: 1px dotted #CCC;
            padding-bottom: 10px;
        }
        #right #datesearch > p > span:first-child {
            font-weight: bold;
        }
        #right #datesearch > p > span:nth-child(2) {
            font-weight: bold;
            color: red;
            text-decoration: underline;
        }
        #right #datesearch > ul > li {
            display: inline-block;
            margin-top: 15px;
            margin-bottom: -15px;
        }
        #right #datesearch > ul > li:first-child {
            margin-left: -40px;
            margin-right: 30px;
        }
        #right #datesearch > ul > li > input {
            outline: none;
        }
        #from, #to {
            margin-right: 5px;
        }
        #genre {
            padding: 2px 5px;
            width: 150px;
        }
        #right #datesearch > ul > li:last-child {
            display: block;
            margin-left:  -40px;
        }
        #right #datesearch > ul > li:last-child > input:first-child {
            width: 250px;
            padding: 2px 5px;
        }
        #list {
            border-top: 1px solid #CCC;
            border-bottom: 1px solid #CCC;
            width: 100%;
            min-height: 250px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }
       
       	#tbl1 {
       		width:850px;
       		margin-top:10px;
       	}
        
        #tbl1 th{
        	text-align:center;
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
                <h1>나의 관람 공연</h1>
                <div id="datesearch">
                    <p><span>${username}</span>님의 관람 공연은 총<span id = "totalcount">${totalCountV}</span>건 입니다.(<span id="today"></span>기준)</p>
                    <ul>
                        <li>
                            ▶ 기간별
                            <input type="text" id="from" name = "from">
                            ~
                            <input type="text" id="to" name = "to">
                        </li>
                        <li>
                            ▶ 장르별
                            <select name="genre" id="genre">
                                <option value="default">장르선택</option>
                                <option value="concert">콘서트</option>
                                <option value="musical">뮤지컬</option>
                                <option value="theater">연극</option>
                                <option value="classic">클래식</option>
                                <option value="Exhibition">전시</option>
                            </select>
                            <input type="button" value="조회" class="btn btn-default btn-sm" id="genresearch">
                        </li>
                        <li>
                            ▶ 공연명
                            <input type="text" id="nametxt" placeholder="공연명을 입력해주세요.">
                            <input type="button" value="조회" class="btn btn-default btn-sm" id="namesearch">
                        </li>
                    </ul>
                </div>
                <div id="list">
                    <div id = "box">
                        <table id = "tbl1" class = "table table-bordered table-striped table-hover">
	                       	<tbody>
	                    	<c:if test = "${vlist.size() == 0}">
	                        	<td style="text-align:center;padding-top: 100px;padding-bottom: 100px;">관람하신 공연이 없습니다.</td>
	                        </c:if>
	                        <c:if test = "${vlist.size() != 0}">
	                  		<tr>
                        		<th>
                        			공연 이미지
                        		</th>
                        		<th>
                        			내용
                        		</th>
                        	</tr>
	                        <c:forEach items="${vlist}" var="dto">
	                        		<tr>
	                        			<td>
	                        				<img style="height:200px;margin-left:100px;" src = "/AtTicketProject/images/${dto.showposter}">
	                        			</td>
	                        			<td style="text-align:center;line-height:2em;vertical-align:middle;">
	                        				<b>공연명:</b> ${dto.showtitle}<br>
	                        				<b>관람일:</b> ${dto.bdate}<br>
	                        				<b>예매번호:</b> ${dto.bookseq}<br>	
	                        				<b>주소:</b> ${dto.showaddr}
	                        			</td>
	                        		</tr>
	                        </c:forEach>
	                        </c:if>
                       		</tbody>
                        </table>
                    </div>
                </div>
                <div style="margin:5px 370px;width:300px;">
	                <button style="float:left;display:inline-block;margin-right:5px;" id = "btnBefore" class = "btn btn-default btn-sm" type = "button">이전</button>
	            	<button style="float:left;" id = "btnMore" class = "btn btn-default btn-sm" type = "button">더 보기</button>
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

	var begin = ${map.begin};
	var end = ${map.end};
	
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth()+1;
	var day = now.getDate();
	
    $("#usermenu p:nth-child(4)").css("color","#4C7CCE");
    $("#usermenu p:nth-child(4)").mouseout(function(){
    	$("#usermenu p:nth-child(4)").css("color","#4C7CCE");
    });	
	
	if((month+"").length < 2) {
		month = "0" + month;
	}
	
	if((day+"").length < 2) {
		day = "0" + day;
	}
	
	$("#today").text(year+"년 "+month+"월 "+day+"일");
	
    $("#genresearch").click(function() {
    	begin = 1;
    	end = 3;
    	var from = $("#from").val();
    	var to = $("#to").val();
    	var genre = $("#genre").val();
    	
		$.ajax({
			type: "GET",
			url: "/AtTicketProject/mypagewatchedgenreok.do",
			data: "begin=" + begin + "&end=" + end + "&from=" + from + "&to=" + to + "&genre=" + genre,
			dataType: "json",
			success: function(result) {
				
				if (result.length == 0) {
					return;
				}
				
				//alert(result.length);
				$("tbody").empty();
				$(result).each(function(index, item) {
					//게시물 1개
					var temp = "";
					temp += "<tr>";
					temp += "<th>공연 이미지</th>";
					temp += "<th>내용</th>";
					temp += "</tr>";
					temp += "<tr>";
					temp += "<td><img style='height:200px;margin-left:100px;' src = '/AtTicketProject/images/"+item.showposter+"'></td>";
					temp += "<td style='text-align:center;line-height:2em;vertical-align:middle;'>" + "<b>공연명:</b> "+item.showtitle+"<br>";
					temp += "<b>관람일:</b> "+item.bdate+"<br>";
					temp += "<b>예매번호:</b> " + item.bookseq +"<br>"
					temp += "<b>주소:</b> " + item.showaddr + "</td>";
					temp += "</tr>";
			
					$("table > tbody").append(temp);
					$("#totalcount").text(item.totalCountG);
				});
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
			
		}); //ajax
		
		$("#btnMore").click(function() {
			
	    	var from = $("#from").val();
	    	var to = $("#to").val();
	    	var showtitle = $("#nametxt").val();
	    	begin+=3;
	    	end+=3;
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/mypagewatchedgenreok.do",
				data: "begin=" + begin + "&end=" + end + "&from=" + from + "&to=" + to + "&genre=" + genre,
				dataType: "json",
				success: function(result) {
					
					if (result.length == 0) {
						$("#btnMore").attr("disabled",true);
						return;
					}
					
					//alert(result.length);
					$("tbody").empty();
					$(result).each(function(index, item) {
						//게시물 1개
						var temp = "";
						temp += "<tr>";
						temp += "<th>공연 이미지</th>";
						temp += "<th>내용</th>";
						temp += "</tr>";
						temp += "<tr>";
						temp += "<td><img style='height:200px;margin-left:100px;' src = '/AtTicketProject/images/"+item.showposter+"'></td>";
						temp += "<td style='text-align:center;line-height:2em;vertical-align:middle;'>" + "<b>공연명:</b> "+item.showtitle+"<br>";
						temp += "<b>관람일:</b> "+item.bdate+"<br>";
						temp += "<b>예매번호:</b> " + item.bookseq +"<br>"
						temp += "<b>주소:</b> " + item.showaddr + "</td>";
						temp += "</tr>";
						
						$("table > tbody").append(temp);
						$("#totalcount").text(item.totalCountG);
					});
					
				},
				error: function(a,b,c) {
					$("#btnMore").attr("disabled",true);
					console.log(a,b,c);
				}
				
			}); //ajax
			
			/* begin += 3;
			end += 3;  */
			
		});
		
		$("#btnBefore").click(function() {
			
	    	var from = $("#from").val();
	    	var to = $("#to").val();
	    	var showtitle = $("#nametxt").val();
	    	begin-=3;
	    	end-=3;
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/mypagewatchedgenreok.do",
				data: "begin=" + begin + "&end=" + end + "&from=" + from + "&to=" + to + "&genre=" + genre,
				dataType: "json",
				success: function(result) {
					
					if (result.length == 0) {
						$("#btnBefore").attr("disabled",true);
						return;
					}
					
					//alert(result.length);
					$("tbody").empty();
					$(result).each(function(index, item) {
						//게시물 1개
						var temp = "";
						temp += "<tr>";
						temp += "<th>공연 이미지</th>";
						temp += "<th>내용</th>";
						temp += "</tr>";
						temp += "<tr>";
						temp += "<td><img style='height:200px;margin-left:100px;' src = '/AtTicketProject/images/"+item.showposter+"'></td>";
						temp += "<td style='text-align:center;line-height:2em;vertical-align:middle;'>" + "<b>공연명:</b> "+item.showtitle+"<br>";
						temp += "<b>관람일:</b> "+item.bdate+"<br>";
						temp += "<b>예매번호:</b> " + item.bookseq +"<br>"
						temp += "<b>주소:</b> " + item.showaddr + "</td>";
						temp += "</tr>";
						
						$("table > tbody").append(temp);
						$("#totalcount").text(item.totalCountG);
					});
					
				},
				error: function(a,b,c) {
					$("#btnBefore").attr("disabled",true);
					console.log(a,b,c);
				}
				
			}); //ajax
			
			/* begin += 3;
			end += 3;  */
			
		});
	    
	});
    
    $("#namesearch").click(function() {
		
    	begin = 1;
    	end = 3;
    	var from = $("#from").val();
    	var to = $("#to").val();
    	var showtitle = $("#nametxt").val();
    	
		$.ajax({
			type: "GET",
			url: "/AtTicketProject/mypagewatchedtitleok.do",
			data: "begin=" + begin + "&end=" + end + "&showtitle=" + showtitle,
			dataType: "json",
			success: function(result) {
				
				if (result.length == 0) {
					return;
				}
				
				//alert(result.length);
				$("tbody").empty();
				$(result).each(function(index, item) {
					//게시물 1개
					var temp = "";
					temp += "<tr>";
					temp += "<th>공연 이미지</th>";
					temp += "<th>내용</th>";
					temp += "</tr>";
					temp += "<tr>";
					temp += "<td><img style='height:200px;margin-left:100px;' src = '/AtTicketProject/images/"+item.showposter+"'></td>";
					temp += "<td style='text-align:center;line-height:2em;vertical-align:middle;'>" + "<b>공연명:</b> "+item.showtitle+"<br>";
					temp += "<b>관람일:</b> "+item.bdate+"<br>";
					temp += "<b>예매번호:</b> " + item.bookseq +"<br>"
					temp += "<b>주소:</b> " + item.showaddr + "</td>";
					temp += "</tr>";
					$("#totalcount").text(item.totalCountT);
					
					$("table > tbody").append(temp);
				});
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
			
		}); //ajax
		
		$("#btnMore").click(function() {
			
	    	var from = $("#from").val();
	    	var to = $("#to").val();
	    	var showtitle = $("#nametxt").val();
	    	begin+=3;
	    	end+=3;
			//서버에게 그 다음 10개 게시물을 주세요~ 요청
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/mypagewatchedtitleok.do",
				data: "begin=" + begin + "&end=" + end + "&showtitle=" + showtitle,
				dataType: "json",
				success: function(result) {
					
					if (result.length == 0) {
						$("#btnMore").attr("disabled",true);
						return;
					}
					
					//alert(result.length);
					$("tbody").empty();
					$(result).each(function(index, item) {
						//게시물 1개
						var temp = "";
						temp += "<tr>";
						temp += "<th>공연 이미지</th>";
						temp += "<th>내용</th>";
						temp += "</tr>";
						temp += "<tr>";
						temp += "<td><img style='height:200px;margin-left:100px;' src = '/AtTicketProject/images/"+item.showposter+"'></td>";
						temp += "<td style='text-align:center;line-height:2em;vertical-align:middle;'>" + "<b>공연명:</b> "+item.showtitle+"<br>";
						temp += "<b>관람일:</b> "+item.bdate+"<br>";
						temp += "<b>예매번호:</b> " + item.bookseq +"<br> </td>";
						temp += "<b>주소:</b> " + item.showaddr + "</td>";
						temp += "</tr>";
						$("#totalcount").text(item.totalCountT);
						
						$("table > tbody").append(temp);
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			}); //ajax
			
			/* begin += 3;
			end += 3;
			 */
		});
		
		$("#btnBefore").click(function() {
			
	    	var from = $("#from").val();
	    	var to = $("#to").val();
	    	var showtitle = $("#nametxt").val();
	    	begin-=3;
	    	end-=3;
			//서버에게 그 다음 10개 게시물을 주세요~ 요청
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/mypagewatchedtitleok.do",
				data: "begin=" + begin + "&end=" + end + "&showtitle=" + showtitle,
				dataType: "json",
				success: function(result) {
					
					if (result.length == 0) {
						$("#btnBefore").attr("disabled",true);
						return;
					}
					
					//alert(result.length);
					$("tbody").empty();
					$(result).each(function(index, item) {
						//게시물 1개
						var temp = "";
						temp += "<tr>";
						temp += "<th>공연 이미지</th>";
						temp += "<th>내용</th>";
						temp += "</tr>";
						temp += "<tr>";
						temp += "<td><img style='height:200px;margin-left:100px;' src = '/AtTicketProject/images/"+item.showposter+"'></td>";
						temp += "<td style='text-align:center;line-height:2em;vertical-align:middle;'>" + "<b>공연명:</b> "+item.showtitle+"<br>";
						temp += "<b>관람일:</b> "+item.bdate+"<br>";
						temp += "<b>예매번호:</b> " + item.bookseq +"<br> </td>";
						temp += "<b>주소:</b> " + item.showaddr + "</td>";
						temp += "</tr>";
						$("#totalcount").text(item.totalCountT);
						
						$("table > tbody").append(temp);
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			}); //ajax
			
			/* begin += 3;
			end += 3;
			 */
		});
	});
    
     //주문일자 텍스트창 css
     $("#from, #to").css("width", "90px");
     $("#genresearch, #namesearch")
         .css("background-color", "#666")
         .css("color", "white")
         .css("padding", "3px 7px");

     //주문일자 선택
     $(function() {
         $.datepicker.setDefaults({
             dateFormat: "yy-mm-dd",
             showOn: "button",
             buttonText: "달력"
         });
         $("#from").datepicker();
         $("#to").datepicker();

         $("#from").datepicker("setDate", "-6M");
         $("#to").datepicker("setDate", "today");
     });

     //기간별 조회 클릭시
     $(".month").click(function() {
         $("#from").datepicker("setDate", "-" + $(this).data("month") + "M");
     });

     //조회 클릭시
     $("#genresearch, #namesearch").click(function() {
         console.log($("#from").val());
         console.log($("#to").val());
     });

     //movetop
     $("#movetop").click(function() {
         event.preventDefault();
         $("html, body").animate({
             scrollTop: 0
         }, 500);
     });

         //주문일자 텍스트창 css
         $("#from, #to").css("width", "90px");
         $("#genresearch, #namesearch")
             .css("background-color", "#666")
             .css("color", "white")
             .css("padding", "3px 7px");

         //주문일자 선택
         $(function() {
             $.datepicker.setDefaults({
                 dateFormat: "yy-mm-dd",
                 showOn: "button",
                 buttonText: "달력"
             });
             $("#from").datepicker();
             $("#to").datepicker();

             $("#from").datepicker("setDate", "-6M");
             $("#to").datepicker("setDate", "today");
         });

         //기간별 조회 클릭시
         $(".month").click(function() {
             $("#from").datepicker("setDate", "-" + $(this).data("month") + "M");
         });

         //조회 클릭시
         $("#genresearch, #namesearch").click(function() {
             console.log($("#from").val());
             console.log($("#to").val());
         });

         //movetop
         $("#movetop").click(function() {
             event.preventDefault();
             $("html, body").animate({
                 scrollTop: 0
             }, 500);
         });
			
            
    </script>

</body>
</html>