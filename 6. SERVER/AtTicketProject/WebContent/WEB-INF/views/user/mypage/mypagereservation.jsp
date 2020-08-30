<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AtTicket</title>
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
            margin-top: 0;
            color: #444;
        }
        #right #datesearch {
            border: 1px solid #D3D3D3;
            padding: 15px 20px;
            font-size: 12px;
            background-color: #F8F8F8;
            margin: 20px 0;
        }
        #right #datesearch > p > span:first-child {
            font-weight: bold;
        }
        #right #datesearch > p > span:nth-child(2) {
            font-weight: bold;
            color: red;
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
        .mycount > p:first-child,
        #precaution > p:first-child {
            color: #444;
            font-size: 15px;
            font-weight: bold;
        }
        .mycount > p > i,
        #precaution > p > i {
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
        #paging {
            text-align: center;
            letter-spacing: 1px;
            margin: 40px 0;
        }
        .left, .right {
            font-size: 10px;
        }
        #paging > span > span {
            font-weight: bold;
        }
        #precaution {
            margin-top: 40px;
        }
        #precaution > div {
            border-top: 2px solid #666;
            padding: 20px 0;
            border-bottom: 2px solid #CCC;
        }
        #precaution > div > p {
            font-size: 12px;
            letter-spacing: -1px;
        }
        #precaution > div > p > span {
            color: red;
        }
        #precaution > div > p:nth-child(4),
        #precaution > div > p:nth-child(5),
        #precaution > div > p:nth-child(6),
        #precaution > div > p:nth-child(7),
        #precaution > div > p:nth-child(9) {
            text-indent: 2em;
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
                <h1>예매확인/취소</h1>
                <div id="datesearch">
                    <p><span>${username}</span>님의 <span id = "monthsearch">최근 1개월</span> 예매내역입니다. 지난 예매확인을 원하시면 조회조건을 선택해 주세요.</p>
                    <ul>
                        <li>
                            ▶ 기간별 조회
                            <input style="background-color:#EFEFEF;" type="button" class="btn btn-default btn-xs month" value="1개월" data-month="1">
                            <input type="button" class="btn btn-default btn-xs month" value="3개월" data-month="3">
                            <input type="button" class="btn btn-default btn-xs month" value="6개월" data-month="6">
                        </li>
                        <li>
                            ▶ 주문일자별 조회
                            <input type="text" id="from" name = "from">
                            ~
                            <input type="text" id="to" name = "to">
                            <button type="button" class="btn btn-default btn-sm" id="btnsearch">조회</button>
                        </li>
                    </ul>
                </div>
                <div class="mycount">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>최근 예매내역</p>
                    <form method = "POST" id = "deleteForm">
                    
                    <table id="tbl1">
                        <thead>
                        	<th><input type = "checkbox" id = "cbAll"></th>
                            <th>예매일</th>
                            <th>예매번호</th>
                            <th>공연명</th>
                            <th>관람일시</th>
                            <th>매수</th>
                            <th>에매상태</th>
                        </thead>
                        <tbody>
                        	<c:if test="${rlist.size() == 0}">
                            <tr>
                                <td colspan="7">검색된 예매내역이 없습니다.</td>
                            </tr>
                            </c:if>
                             <c:forEach items="${rlist}" var="dto">
                             	 <tr>	
                             	 	 <td><input type = "checkbox" class = "cb1" name = "cb1" value = "${dto.bookseq}"></td>
	                             	 <td id = "bookdate">${dto.bookdate}</td>
	                             	 <td id = "bookseq">${dto.bookseq}</td>
	                             	 <td id = "showtitle">${dto.showtitle}</td>
	                             	 <td id = "bdate">${dto.bdate}</td>
	                             	 <td id = cnt>${dto.cnt}</td>
	                             	 <td id = "bookstate">${dto.bookstate}</td>
                             	 </tr>
                             </c:forEach>
                        </tbody>           
                    </table>
                    <div id="paging">
                        <button type = "button" id = "btnleft" class="glyphicon glyphicon-menu-left left"></button>
                        <span id = "page"> 
                        <span>${nowPage}</span>
                        <span>(<span id = "nowPage">${nowPage}</span>/${totalPage})</span>
                        </span>
                        <button type = "button" class="glyphicon glyphicon-menu-right right" id = "btnright"></button>
                    </div>
                    <div style="text-align: right; margin:10px 0px;">
                    <button id = "delbtn" type = "button" class = "btn btn-default btn-sm">예매취소</button> 
                    </div>
                 	
                    </form>
                    <div style="text-align: right;">
                        <p style="font-size: 11px;">▶ 패키지 상품은 결제완료 후 해당공연의 예매권이 회원님 계정으로 자동등록됩니다.</p>
                        <p style="font-size: 11px; margin-top: -10px;">▶ 패키지는 구성상품별로 반드시 회차와 좌석지정을 하셔야 공연 관람이 가능합니다.</p>
                    </div>
                </div>
                <div id="precaution">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>유의사항</p>
                    <div>
                        <p><span>- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</span></p>
                        <p>- 티켓 수령 방법 변경(현장수령 -> 배송)은 예매 완료된 건에 한하며, 배송비 결제는 신용카드만 결제 가능합니다.(단 공연일 기준 12일 전까지 / 일부 공연 불가)</p>
                        <p>- 다음과 같은 경우 PC/모바일에서는 취소 또는 부분취소가 불가하오니 고객센터로 문의해주시기 바랍니다.</p>
                            <p>1) YES머니, YES상품권, 쿠폰 등 예스24 결제수단을 사용하여 예매한 경우</p>
                            <p>2) 무통장입금 예매 후 신용카드로 배송비를 추가 결제한 경우</p>
                            <p>3) 티켓 배송이 완료되었거나 시작된 경우</p>
                            <p>(취소마감시간 이전에 고객센터로 반송되어야 취소 가능, 취소 수수료는 티켓 도착일 기준으로 부과되며 배송비는 환불 불가)</p>
                        <p>- 예매 티켓 배송은 예매완료 후 4~5일 이내(영업일 기준) 배송해드립니다. 티켓 분실 시 재발권이 불가하오니, 보관에 주의해주시기 바랍니다.</p>
                        <p>(일괄배송 공연일 경우 일괄배송일 기준 4~5일(영업일 기준) 이내에 수령 가능)</p>
                        <p>- 무통장입금 예매 취소 시 결제금액에서 수수료를 제외한 금액만큼 환불처리됩니다. 부분 취소 시에는 취소수수료 + 잔여티켓금액 등을 제외한
                        금액만큼 환불처리 됩니다.</p>
                        <p>- 신용카드 예매 취소 시에는 발생되는 수수료(부분취소 시에는 취소수수료+잔여티켓금액 등)에 대한 금액을 재 결제 후 기존 결제내역은 전체 취소됩니다.</p>
                        <p>- 복합결제로 예매한 경우 전체 취소 시 각 결제 수단(YES머니, YES상품권 등)으로 자동환급됩니다. 단 YES상품권, 예매권 등 사용기한이
                        만료된 경우 재사용하실 수 없습니다.</p>
                        <p>- 예매 취소 시점과 해당 카드사의 환불 처리 기준에 따라 환급방법과 환급일은 다소 차이가 있을 수 있습니다.</p>
                        <p>- 기타 문의사항은 [이용안내]를 참고하시거나, 고객센터(1544-6399) 또는 [1:1문의]를 이용해주시기 바랍니다.</p>
                    </div>
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
    
    $("#usermenu p:first-child").css("color","#4C7CCE");
    $("#usermenu p:first-child").mouseout(function(){
    	$("#usermenu p:first-child").css("color","#4C7CCE");
    });	
    var begin = ${map.begin};
	var end = ${map.end};
	var totalPage= ${totalPage};
	var nowPage = ${nowPage};

	/* if(totalPage == 1){
		$(".left").attr("disabled",true);
		$(".right").attr("disabled",true);
	}
	
	if(nowPage == 1){
		$(".left").attr("disabled",true);	
	} */
	
	var index = 0;
 	var loop = false;
 	var month = '1개월';

 	$(".month").click(function(){
 		$(".month").css("background-color","#FFFFFF");
 		$(this).css("background-color","#EFEFEF");
 		month = $(this).val();
 		/* if(loop){
 			$("#monthsearch").empty();
 			$("#monthsearch").text("최근 "+$(this).val());
 			loop = false;
 		} */
 		
 	});
 	
	$("#cbAll").click(function () {
		if($("#cbAll").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
			$("input[name=cb1]:checkbox").prop("checked",true); // 전체선택 체크박스가 해제된 경우
			} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[name=cb1]:checkbox").prop("checked",false); }
	});
	
	
	 $("#delbtn").click(function () {
         if ($('input').is(':checked') == true) {
             if (confirm("정말로 삭제하시겠습니까?")) {
            	 
            	 //alert("/AtTicketProject/mypagereservationdelete.do?monthsearch="+$("#monthsearch").val()+"&from="+$("#from").val()+"&to="+$("#to").val());
             	
            	$("#deleteForm").attr("action", "/AtTicketProject/mypagereservationdelete.do?monthsearch="+$("#monthsearch").val()+"&from="+$("#from").val()+"&to="+$("#to").val());
             	$("#deleteForm").submit();	
             }
         } else {
             alert("하나 이상을 체크하시오.");
         }
     });
	 
	 $("#btnleft").click(function() {

			var from = $("#from").val();
			var to = $("#to").val();
			nowPage-=1;
			begin-=3;
			end-=3;
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/mypage/mypagereservationok.do",
				data: "begin=" + begin + "&end=" + end +"&from=" + from + "&to=" + to + "&totalPage=" + totalPage + "&nowPage=" + nowPage,
				dataType: "json",
				success: function(result) {
					
					if (result.length == 0) {
						/* $(".left").attr("disabled",true); */
						return;
					}
					
					//alert(result.length);
					$("tbody").empty();
					$(result).each(function(index, item) {
						//게시물 1개
						var temp = "";
						temp += "<tr>";
						temp += "<td><input type = 'checkbox' class = 'cb1' name = 'cb1' value = '"+item.bookseq+"'></td>";
						temp += "<td>" + item.bookdate + "</td>";
						temp += "<td>" + item.bookseq + "</td>";
						temp += "<td>" + item.showtitle + "</td>";
						temp += "<td>" + item.bdate + "</td>";
						temp += "<td>" + item.cnt + "</td>";
						temp += "<td>" + item.bookstate + "</td>";
						temp += "</tr>";
							
						$("table > tbody").append(temp); 
						$("#page").empty();
						var temp = "";		
						temp+="<span>"+ item.nowPage+"</span>";
						temp+=" <span>(<span id = 'nowPage'>"+item.nowPage+"</span>/"+item.totalPage+")</span>";
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
		var from = $("#from").val();
		var to = $("#to").val();

		begin+=3;
		end+=3;
		nowPage +=1;
		$.ajax({
			type: "GET",
			url: "/AtTicketProject/mypage/mypagereservationok.do",
			data: "begin=" + begin + "&end=" + end +"&from=" + from + "&to=" + to + "&totalPage=" + totalPage + "&nowPage=" + nowPage,
			dataType: "json",
			success: function(result) {
				
				if (result.length == 0) {
					/* $(".right").attr("disabled",true); */
					return;
				}
				
				//alert(result.length);
				$("tbody").empty();
				
				$(result).each(function(index, item) {
					//게시물 1개
					var temp = "";
					temp += "<tr>";
					temp += "<td><input type = 'checkbox' class = 'cb1' name = 'cb1' value = '"+item.bookseq+"'></td>";
					temp += "<td>" + item.bookdate + "</td>";
					temp += "<td>" + item.bookseq + "</td>";
					temp += "<td>" + item.showtitle + "</td>";
					temp += "<td>" + item.bdate + "</td>";
					temp += "<td>" + item.cnt + "</td>";
					temp += "<td>" + item.bookstate + "</td>";
					temp += "</tr>";
						
					$("table > tbody").append(temp); 
					$("#page").empty();
					var temp = "";
					temp+="<span>"+ item.nowPage+"</span>";
					temp+=" <span>(<span id = 'nowPage'>"+item.nowPage+"</span>/"+item.totalPage+")</span>";
					$("#page").append(temp); 
				});
				
			},
			error: function(a,b,c) {
				/* $(".right").attr("disabled",true); */
				console.log(a,b,c);
			}
			
		}); //ajax
	
		});
	
	
		$("#btnsearch").click(function() {
			var from = $("#from").val();
			var to = $("#to").val();
			loop = true;
			begin = 1;
			end = 3;
			$.ajax({
				type: "GET",
				url: "/AtTicketProject/mypage/mypagereservationok.do",
				data: "begin=" + begin + "&end=" + end +"&from=" + from + "&to=" + to + "&totalPage=" + totalPage + "&nowPage=" + nowPage,
				dataType: "json",
				success: function(result) {
					
					$("#monthsearch").text(month);
					
					if (result.length == 0) {
						return;
					}
					
					//alert(result.length);
					$("tbody").empty();
					
					$(result).each(function(index, item) {
						//게시물 1개
						var temp = "";
						temp += "<tr>";
						temp += "<td><input type = 'checkbox' class = 'cb1' name = 'cb1'value = '"+item.bookseq+"'></td>";
						temp += "<td>" + item.bookdate + "</td>";
						temp += "<td>" + item.bookseq + "</td>";
						temp += "<td>" + item.showtitle + "</td>";
						temp += "<td>" + item.bdate + "</td>";
						temp += "<td>" + item.cnt + "</td>";
						temp += "<td>" + item.bookstate + "</td>";
						temp += "</tr>";
							
						$("table > tbody").append(temp); 
						var temp = "";
						$("#page").empty();
						var temp = "";
						temp+="<span>"+ item.nowPage+"</span>";
						temp+=" <span>(<span id = 'nowPage'>"+item.nowPage+"</span>/"+item.totalPage+")</span>";
						$("#page").append(temp); 
					});
					
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			}); //ajax		
			
		});
			

        //주문일자 텍스트창 css
        $("#from, #to").css("width", "90px");
        $("#btnsearch").css("background-color", "#666").css("color", "white");

        //주문일자 선택
        $(function() {
            $.datepicker.setDefaults({
                dateFormat: "yy-mm-dd",
                showOn: "button",
                buttonText: "달력"
            });
            $("#from").datepicker();
            $("#to").datepicker();

            $("#from").datepicker("setDate", "-1M");
            $("#to").datepicker("setDate", "today");
        });

        //기간별 조회 클릭시
        $(".month").click(function() {
            $("#from").datepicker("setDate", "-" + $(this).data("month") + "M");
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