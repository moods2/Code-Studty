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
            margin-bottom: 30px;
        }
        #right > h2 {
            font-size: 16px;
            letter-spacing: -1px;
            margin-bottom: 5px;
        }
        #right > p {
            padding: 5px 10px;
            font-size: 13px;
        }
        #right > p > i {
            font-size: 10px;
            border: 1px solid #7A98B4;
            border-radius: 50%;
            background-color: #7A98B4;
            color: white;
            margin-right: 5px;
        }
        #right > p > span {
            font-weight: bold;
            text-decoration: underline;
        }
        #coupon {
            border: 1px solid #ccc;
            border-left: 0;
            border-right: 0;
            text-align: center;
            background-color: rgb(248, 248, 248);
            padding: 50px 0;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        #coupon > input {
            outline: none;
        }
        #coupontxt {
            padding: 5px 10px;
            border: 4px solid #777;
            text-align: center;
            color: #777;
            width: 300px;
            font-size: 13px;
            height: 35px;
            margin-right: 10px;
        }
        #tbl1 {
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
            border-top: 3px solid #666;
            border-bottom: 1px solid #CCC;
        }
        #tbl1 th:first-child {
            width: 30%;
        }
        #paging {
            text-align: center;
            letter-spacing: 1px;
            margin: 40px 0;
        }
        #precaution {
            border-top: 2px solid #666;
            padding: 20px 10px 10px 10px;
            border-bottom: 2px solid #CCC;
            background-color: rgb(248, 248, 248);
        }
        #precaution > p {
            font-size: 12px;
            letter-spacing: -1px;
        }
        #precaution > p:first-child {
            font-weight: bold;
        }
        #precaution > p > i {
            margin-right: 5px;
        }
        #precaution > p:nth-child(5) {
            margin-top: -7px;
        }
        #line {
            border: 1px solid #7A98B4;
            margin-left: 5px;
            margin-top: -10px;
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
                <h1>할인쿠폰/예매권</h1>
                <div id="line"></div>
                <p><i class="glyphicon glyphicon-menu-right
                    "></i><span>${username}</span>님이 가지고 계신 <span style="color: #7A98B4">할인쿠폰 번호</span>를 입력해 주세요.
                </p>
                
                <form method="POST" action="/AtTicketProject/mypagecouponok.do" name="signup" id="signup">	
	                <div id="coupon">
	                   	공연 할인쿠폰 
	                   <input type="text" id="coupontxt" placeholder="할인쿠폰 번호" name="couponseq">
	                   <input type="submit" value="등록하기" class="btn btn-default" id="btncoupon">
	                </div>
                </form>
                
                <h2>사용가능한 쿠폰</h2>
                <p><i class="glyphicon glyphicon-menu-right
                    "></i>현재 사용 가능한 공연 할인 쿠폰은 <span style="color: red;">${totalCount }</span>매 입니다.
                </p>
                <table id="tbl1">
                    <thead>
                        <th>쿠폰</th>
                        <th>할인금액</th>
                        <th>사용기간</th>
                        <th>등록일</th>
                    </thead>
                    <tbody>
                    	<!-- 쿠폰 없을때  -->
		                <c:if test="${empty search and list.size() == 0}">
		                	<tr>
		                		<td colspan="4">사용 가능한 쿠폰 목록이 없습니다.</td>
		                	</tr>                    	
		               	</c:if>
		                 
		          	     <c:forEach items="${list}" var="dto">
				            <tr>
	                        	<td>${dto.couponName}</td>
	                        	<td>${dto.couponDiscount}</td>
	                        	<td>${dto.couponStart} ~ ${dto.couponEnd}</td>
	                        	<td>${dto.couponRegistration}</td>
                        	</tr>
                        	<%-- <div class="couponSeq">${dto.couponSeq}</div> --%>
				         </c:forEach>
                        
                    </tbody>
                </table>
                <div id="paging">
                    ${pagebar}
                </div>
                <div id="precaution">
                    <p><i class="glyphicon glyphicon-ok-sign"></i>공연 할인쿠폰 사용 안내</p>
                    <p>- 쿠폰은 사용조건에 따라 장르 , 특정 공연, 회차, 좌석등급 등에 대한 제한이 있을 수 있으니, 사용조건을 반드시 확인해주시기 바랍니다.</p>
                    <p>- 예매 시 사용하실 쿠폰을 클릭하시면 결제 시점에 자동으로 할인가격 만큼 차감되어 결제 총 금액에 표시됩니다.</p>
                    <p>- 예매 취소 시 해당 공연에 적용된 할인금액을 제외하고 실 결제금액만큼 환불됩니다.</p>
                    <p>(단, 쿠폰을 사용한 경우 부분취소는 불가합니다. 부분취소를 원할 경우 고객센터로 문의해주세요.)</p>
                    <p>- 사용기간이 지난 쿠폰은 사용하실 수 없습니다.</p>
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

        //할인쿠폰 등록 시
        $("#btncoupon").click(function() {
            console.log($("#coupontxt").val());
        });

        //movetop
        $("#movetop").click(function() {
            event.preventDefault();
            $("html, body").animate({
                scrollTop: 0
            }, 500);
        });
        
        
        var couponSeq = [];
        
        
         <c:forEach items="${seqAllGet}" var="dto">
        	couponSeq.push("${dto.couponSeq}");
		</c:forEach> 
        
         $(document).ready(function() {
        	 
        	 
            $('#signup').submit(function() {
                if ($('#coupontxt').val() == '') {
                    alert('쿠폰번호를 입력해 주세요.');
                    return false;
                } 
                 else if (couponSeq.indexOf($('#coupontxt').val()) != "-1") {
                	alert('이미 등록된 쿠폰번호 입니다.');
                    return false;
                }
            }); 
        });   
        

        
        //alert(couponSeq.indexOf($('#coupontxt').val()));
		 $("#usermenu p:nth-child(2)").css("color","#4C7CCE");
	    $("#usermenu p:nth-child(2)").mouseout(function(){
	    	$("#usermenu p:nth-child(2)").css("color","#4C7CCE");
	    });
        


    </script>

</body>
</html>