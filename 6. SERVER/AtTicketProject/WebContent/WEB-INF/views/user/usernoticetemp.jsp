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
        <link rel="stylesheet" href="/AtTicketProject/css/slick.css" />
        <link rel="shortcut icon" href="/AtTicketProject/images/favicon.ico" />
        
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

        .noticebar {
            width: 1200px;
            margin: 0px auto;
            border-top: 2px solid black;
            border-bottom: 2px solid black;
            padding-top: 20px;
            padding-bottom: 20px;
            
        }
        .golist {
            cursor: pointer;
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
           
           #openAlarm{ cursor: pointer; }
       
		 #tel { 
		 	margin: 0 auto;
		 	margin-bottom:40px;
		    color: #333;
		    font-size: 18px;
		    text-align: center;
		    font-weight: 700;
		    height: 58px;
		    line-height: 50px;
		    border: 1px solid #ec7d2c;
		    background: #fbe5d5;
		    font-style: normal;
		    vertical-align: baseline;
		    font-family: 'NanumBarunGothic', '���� ����', 'Malgun Gothic', sans-serif;
		} 
        
         #alarm {
        	padding: 25px 0 18px 0;
		    border-bottom: 2px solid #333;
		    font-size: 18px;
		    color: #ec7d2c;
        } 
        
        #dialog1 a {
		    font-size: 13px;
		    line-height: 20px;
		    color: #000;
		    text-decoration: underline;
        }
        
        #dialog1 div,p,span,a{
         outline: none;
        }
        
        .ui-dialog .ui-dialog-buttonpane button {
        	position:relative;
        	left:-180px;
        	display: inline-block;
		    width: 78px;
		    height: 32px;
		    line-height: 32px;
		    text-align: center;
		    font-size: 13px;
		    margin: 0 5px;
		    border: 1px solid #ec7d2c;
		    background: #ec7d2c;
		    color: #fff;
		   
        }
        
        #mcontent{
        font-size: 14px;
	    line-height: 22px;
	    text-align: center;
	    padding: 26px 0 21px 0;   
        }
      
      	#bcontent{
      		font-size: 13px;
		    line-height: 20px;
		    padding: 22px 0 19px 0;
      		display: block;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-style: normal;
		    vertical-align: baseline;
		    font-family: 'NanumBarunGothic', '���� ����', 'Malgun Gothic', sans-serif;
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
 		
        <h2 style="text-align: center; margin-top: 200px; margin-bottom: 50px; font-size: 4em; font-weight: bold;">공지사항</h2>
        <div class="noticebar">
            <div style="display: inline-block; width:90px; border: 1px solid orange; color: orange; text-align: center;">${dto.nindex}</div>
            <span>${dto.title}</span>
        </div>
        <p style="text-align: center; margin-left: 1000px; padding-top: 10px; color: gray;">등록일 : ${dto.regdate} 조회수: ${dto.nview}</p>
		
        <div style="width: 1200px; height: 370px; background-color: #eeeeee; margin: 0px auto;" >
            <div style="width: 180px; height: 252px; margin-left: 50px; "><img style="margin-top: 50px; width: 180px; height: 252px;" src="/AtTicketProject/images/${showdto.poster}" alt=""></div>
            <span style="font-size: 18px; margin-left: 300px; position: relative; bottom: 180px; left: 0px;">${showdto.title}</span>
            <div style=" padding-left: 30px; padding-top: 18px; background-color: rgb(253, 221, 190); position: relative; bottom: 120px; margin-left: 300px; margin-bottom: 500px; border: 1px solid gray; width: 840px; height: 60px;">
                <span class="glyphicon glyphicon-time" style= "color: orange; font-weight: bold;">&nbsp;${dto.nindex}</span><span style="padding-left: 30px;">|</span>
                <span style="padding-left: 30px; font-weight: bold; font-size: 17px;">${dto.opendate}(${dto.dy})</span>                
                <div id="openAlarm" style=" width: 236px; height: 46px; border: 3px solid orange; margin-top: 80px; position: relative; left: -30px; padding-top: 10px; text-align: center; background-color: white; color: orange; font-weight: bold; font-size: 18px;">티켓오픈 알림<span class="glyphicon glyphicon-bell"></span></div>
		        
		        <form id="form1" method = "POST" action="/AtTicketProject/useralarm.do?noticeseq=${noticeseq}&page=${page}&search=${search}&showseq=${showseq}">
		     
		        <div role="dialog" id="dialog1" style="border:0px;">
		        	<p id = "alarm">티켓오픈 알람 신청</p>
		        	<p id = "mcontent">티켓오픈 알람 신청 시<br>
		        		<span style="color:red;">티켓 오픈 1시간 전에 </span>회원님께 SMS를 보내드립니다.</p>
		        		<div id = "tel">${tel}</div>
		        		<p id = "bcontent">일반 티켓 오픈 시간을 기준으로 발송됩니다.<br>
							(팬클럽 선예매 등은 발송 대상이 아닙니다.)<br>
							알림 받을 휴대전화번호 변경을 원하시면, <a href = "/AtTicketProject/mypagepersonalize.do" target="_blank">마이페이지>회원정보관리</a> 에서<br>
							변경하신 후 신청하시면 됩니다.</p>
							 <input type = "hidden" name = "showseq" value = "${showseq}">
							<!-- <button type="submit" class="btn btn-primary">확인</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button> -->
		        </div> 
				  
		        </form>
	    	</div>
           </div>
            
        </div>
        <div style="width: 1200px; margin: 200px auto;">

        <hr>
        <p style="font-size: 1.8em; font-weight: bold;">공연 개요</p>
        <br>
        <br>
        <p style="font-size: 12px; color: #333333; line-height: 1.8em;">
            ※ 티켓 판매 기간: 7월 21일(화) 오후 2시 ~ 7월 24일(금) 오후 11시 59분 <br>
※ 티켓 오픈 공연기간: 7월 22일(수) ~ 8월 5일(수) <br>
※ 할인율: 비지정 VIP 40%, R석 50%(BC카드 결제 시) / VIP석 30%, R석 40%(일반 결제 시)<br>
*보다 자세한 내용은 오픈 당일, 공연 상세페이지에서 확인하실 수 있습니다.<br>
*본 상품은 7월 24일까지 4일 간 선착순 판매되며, 한정 수량으로 소진 시 조기마감 될 수 있습니다.<br>
*해당 티켓은 비지정석으로, 예매처 마감 후 등급 내 잔여석 중 구매순(입금순)으로 배정됩니다.<br>
*구매 가능 매수는 한 ID 당 1인 4매로 제한됩니다.<br>
*예매 및 관람 전 반드시 공연 상세페이지 관람수칙 및 공지사항 등을 숙지 부탁 드립니다.<br>
*7월 22일(수)부터 VIP/R석 굿바이 할인 20% 권종 선택 시, 2,000부의 프로그램북을 선착순으로 드립니다.(예매 건당 1부 증정/프로그램북 소진 시, 이벤트는 별도 종료 멘트없이 종료됩니다.)<br>
*굿바이 할인 20% 권종은 지정석 <오페라의 유령> 월드투어-서울 예매 페이지에서 가능합니다.<br>
<br>
공 연 명: 뮤지컬 <오페라의 유령> 월드투어-서울 (The Phantom of the Opera)<br>
공연일정: 2020년 3월 14일~8월 7일<br>
공 연 장: 블루스퀘어 인터파크홀<br>
공연시간: 평일(화-금) 오후 8시, 주말 및 공휴일 오후 2시/7시 *월요일 공연 없음<br>
단, 7/22(수), 7/29(수) 오후 3시 1회 공연 (8시 공연없음)<br>
단, 8/5(수), 8/7(금) 오후 3시/8시 2회 공연<br>
티켓가격: VIP석 17만원 / R석 14만원<br>
러닝타임: 150분(인터미션 포함)<br>
관람연령: 8세 이상 관람가(미취학 아동 입장불가/2013년 12월 31일 이전 출생자 관람)<br>
공연문의: 1577-3363(클립서비스)<br>
<br>
<br>
*본 공연은 영어로 진행되는 월드투어입니다. 자막기를 통해 한글 자막이 서비스될 예정입니다.<br>
*<오페라의 유령> 월드투어 캐스팅은 전 세계 프로덕션과 동일하게 당일 극장에서 공지 됩니다.<br>
캐스팅에 의한 변경 및 환불은 불가하오니 예매 시 참고 부탁 드립니다.<br>
*<오페라의 유령> 월드투어와 블루스퀘어는 안전한 공연 관람을 위해 최선을 다하겠습니다. 불편한 점이 있으시더라도 관객 여러분의 개인위생 관리의 동참과 협조가 안전한 관람 문화를 만드오니 많은 협조 부탁드립니다. 공연을 관람하시는 동안만큼은 그간의 스트레스를 풀고 마음의 위로를 받으시는 시간이 되시길 진심으로 바랍니다. 감사합니다.<br>
        </p><br>
<hr>
<br>
<p style="font-size: 1.8em; font-weight: bold;">공연 소개</p>
<p style="color: red; font-weight: bold; text-align: center;">남은 시간 단 3주! <br> 

<오페라의 유령> 서울 공연 8월 7일 종연! <br>

<br>
뮤지컬 <오페라의 유령>을<br>
<br>
오리지널로 만날 수 있는 마지막 기회! <br>
<br>
지금이 아니면 <br>
<br>
앞으로 수년간 만날 수 없습니다! <br>
<br>
 
Good Bye! <오페라의 유령><br>
<br>
Special 1. 비지정석 VIP/R석 최대 50% <br>
<br>
Special 2. 지정석 20% <br>
<br>
선착순 한정 수량, 서두르세요!</p>        <br>
<br>
<br>
<p style=" text-align: center;">
    ★★★★★<br>
“신이 내린 뮤지컬!”<br>
“God’s Gift to Musical Theatre”<br>
-The Times<br>
 <br>
아시아, 중동을 아우르는 역대 최대규모의 월드투어!<br>
마닐라, 싱가포르, 쿠알라룸푸르, 텔아비브, 두바이를 거쳐 한국 공연 <br>
국내 최초 3개 도시 투어, 7년 만의 내한!
<p style=" text-align: center; font-weight: bold; color: cornflowerblue;">지금이 아니면 수년간 만나기 힘든 오리지널 무대! <br>
서울 공연 8월 7일 종연!</p> <br>
<br>
<p style=" text-align: center;">전 세계 39개국, 188개 도시, 1억 4천만 명의 찬사! <br>
토니상 7개 부문을 비롯해 전 세계 메이저 어워즈 70여 개 석권! <br>
웨스트 엔드, 브로드웨이에서 30년 이상 연속 공연된 유일한 작품! <br> 
‘브로드웨이 최장기 공연’ 기네스북 등재!</p>
<p style=" text-align: center; font-weight: bold; color: cornflowerblue;">전 세계를 사로잡은 유령의 마력! <br>
다시 태어나기 힘든 불멸의 명작!</p> <br>
<br> 
<p style=" text-align: center;">
<오페라의 유령>의 무대가 선택한 매혹적인 캐스팅 <br>
오리지널의 진수를 고스란히 전할 가면 속 러브스토리의 주인공! <br>
웨버의 6편의 작품의 주역을 거머쥔 스타 유령 役 조나단 록스머스 <br>
<오페라의 유령>, <러브 네버 다이즈> 웨버의 뮤즈 크리스틴 役 클레어 라이언 <br>
브로드웨이 및 전 세계 무대에서 활약하는 배우 라울 役 맷 레이시</p> 
<p style=" text-align: center; font-weight: bold; color: cornflowerblue;">
전 세계에서 찬사를 받은 최상의 캐스트! <br>
오리지널의 진수를 전할 월드 클래스 무대 </p> <br>
<br>
<p style=" text-align: center;">
 ‘The phantom of the opera’, ‘The music of the night’, ‘All I ask of you’ 등 <br>
앤드루 로이드 웨버의 매혹적인 명곡으로 풀어낸 러브 스토리! <br>
오케스트라의 환상적 라이브 연주! </p>
<p style=" text-align: center; font-weight: bold; color: cornflowerblue;">
아름다운 음악, 가면 속의 러브 스토리…<br>
영원한 당신의 첫 감동!</p><br>
<br>
<p style=" text-align: center;">
파리 오페라 하우스를 재현한 웅장한 세트! <br>
무대를 뒤덮는 375벌의 화려한 의상! <br>
무대 위로 곤두박질치는 거대한 샹들리에! <br>
지하 미궁의 자욱한 안개 사이로 솟아오르는 촛불! </p>
<p style=" text-align: center; font-weight: bold; color: cornflowerblue;">
환영과도 같은 무대…<br>
매 순간 감탄사가 터져 나오는 무대 예술의 극치!</p> <br>
<br>
<br>
<p style=" text-align: center;">
현재, 지구에서 공연되고 있는 <br>
유일한 <오페라의 유령>을 직접 볼 수 있는 <br>
마지막 기회를 놓치지 마세요! </p>
<br>

<hr style="margin-bottom: 50px">
<p style="font-size: 1.8em; font-weight: bold;">기획사 정보</p>

<p style=" text-align: center;">
주최: MBC, 오페라의유령문화산업전문회사 <br>
제작: S&CO, The Really Useful Group, TROIKA ENTERTAINMENT, LOTTE ENTERTAINMENT <br>
제작투자: IBK 기업은행, 대구MBC, 인터파크, 인터파크씨어터, 현대엘리베이터 <br>
협찬: 메르세데스-벤츠 코리아, BC카드 <br>
주관: 클립서비스 <br>
<br>
[오피셜 사이트] <br>
홈페이지▶ 페이스북▶ 인스타그램▶<br>
<br>
</p>
<hr>
<p style="color: gray; text-align: right;"> <span style="color: orange;" class="glyphicon glyphicon-exclamation-sign"></span>티켓오픈 일정은 At-Ticket 또는 기획사의 사정에 의해 사전예고 없이 변경 또는 취소 될 수 있습니다.</p>
<br>
<br>
<div class="golist" style="width: 220px; height: 50px; border: 1px solid rgb(207, 204, 204); text-align: center; padding-top: 15px; margin: 0px auto;">목록보기</div>
<br>
<br>




        
</div>        
            

        
      
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
        </div>
                <!-- 챗봇 : 단비봇 -->
                        <!-- <div
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
                        </script> -->
                        <!-- 제일 위로 돌아가기 버튼 -->
                       <!--  <div id="movetop">↑</div>
                    </div> -->
       <%@include file="/WEB-INF/views/inc/userchat.jsp"%>



    <script src="/AtTicketProject/js/slick.min.js"></script>
    <script>
    	
    	$("#dialog1").hide();
    	
    	$("#openAlarm").click(function() {
			if(${cusseq == null}) {
				alert("로그인이 필요한 서비스 입니다.");
				return;
			}else {
				//모달
				$(".ui-dialog-buttonset button:first-child").hide();
				 $("#dialog1").dialog({//작은 팝업창 생성
		                title: "티켓오픈 알람 신청",
		                width: 600,
		                height: 550,
		                draggable: false,
		                resizable: false,
		                modal: true,
		                buttons: {
		                    // "text": function() { alert(); }
		                    "등록":
			                   function() {  
		                    	alert(${repeat});
		                    	if(${repeat}==0) {
			                        alert("[${showtitle} - 티켓오픈 안내 SMS 알림서비스가 신청되었습니다.MY공연>나의맞춤설정 에서 확인해주세요.]");
			                        
			                        $("#dialog1").dialog("close");
			                        
			                        $("#form1").submit();
		                    	} else {
		           					alert("이미 등록되어있습니다.");
		           					$("#dialog1").dialog("close");
		                    	}
		                    },
		                    "취소" : function () {
		                        $("#dialog1").dialog("close");
		                    }
		                } 
		            }); 
				}
			
		});
    	


        //상단 메뉴 css
        $(".menubar").mouseover(function() {
            $(this).css("border-bottom", "5px solid orange");
        });
        $(".menubar").mouseout(function() {
            $(this).css("border-bottom", "");
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
      

       $(".golist").click(function(){
    	  	location.href="/AtTicketProject/usernotice.do?page=${page}&search=${search}&sort=${sort}"; 
       });

        

        


    </script>

</body>
</html>