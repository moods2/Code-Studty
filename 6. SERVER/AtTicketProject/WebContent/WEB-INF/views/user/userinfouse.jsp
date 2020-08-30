<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="shortcut icon" href="./images/favicon.ico">
    <link rel="stylesheet" href="./css/jquery-ui.css">
    <link rel="stylesheet" href="./css/bootstrap.css">
    <script src="./js/jquery-1.12.4.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <script src="./js/bootstrap.js"></script>
    <script src="js/Backstretch.js"></script>
    <!-- Kakao Map -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d54ec4ee3d75f5d446f2cddfc3e41d4"></script>

    <style>

        * {
            outline: none;
        }

    body { margin: 0 auto; }
        h1 { font-family: "Arial Black"; }
        #main { width: 100%; }
        #top {
            /* border: 1px solid black; */
            min-width: 1600px;
            height: 50px;
            margin: 0 auto;
        }
        #middle {
            /* border: 1px solid black; */
            width: 1600px;
            margin: 0 auto;
        }
        #bottom {
            /* border: 1px solid black; */
            min-width: 1300px;
            height: 250px;
            background-color: #eee;
        }
        #bottom > div {
            float: left;
            position: relative;
            left: 21%;
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
            margin-left: 200px;
            top: 18%;
        }
        #bottom #service p:first-child {
            border-bottom: 1px solid #BBB;
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
            cursor: pointer;
        }
        #topmenu > span {
            cursor: pointer;
        }
        .switch {
            /* border: 1px solid white; */
            position: relative;
            top: 50%;
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

        #search {
            border: 0;
            border-bottom: 1px solid black;
            background-color: transparent;
            outline: none;
            color: black;

        }

        #chatbot {
            width: 88px;
            height: 88px;
            position: fixed;
            bottom: 10px;
            left: 10px;
            cursor: pointer;
            z-index: 1;
        }

        #frogue-container, .frogue-chat {
            position: absolute;
            left:20px;
            bottom: 0;
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
        /* 내용======================================================================================================== */

        #mainBox {
            width: 1200px;
            /* text-align: center; */
            margin: 120px auto;
        }

        #mainBox h1 {
            text-align: center;
        }

        #call {
            border: 1px solid #eee;
            width: 1200px;
            height: 240px;
            margin-top: 80px;
            background-color: #eee;
        }

        #center {
            width: 50%;
            height: 240px;
            border: 1px solid #eee;
            float: left;
        }
        #center::after{
            content: ' ';
            display: block;
            clear: both;
        }

        #oneOne {
            width: 50%;
            height: 240px;
            border: 1px solid #eee; 
            float: left;
        }

        /* #call::after{
            content: ' ';
            display: block;
            clear: both;
        }
        #oneOne::after{
            content: ' ';
            display: block;
            clear: both;
        } */

        .icons {
            float: left;
            width: 170px;
            text-align: center;
        }


        .icons span {
            border: 1px solid #bbb;
            border-radius: 60px;
            width: 110px;
            height: 110px;
            font-size: 50px;
            padding-top: 30px;
            color: gray;
            margin-top: 60px;
            text-align: center;
        }

        .callName{
            /* float: left; */
            margin-top: 60px;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        #qLink {
            border: 1px solid orange;
            width: 80px;
            height: 30px;
            font-size: 15px;
            position: relative;
            top: -40px;
            left: 80px;
            outline: none;
            background-color: #eee;
            color: orange;

        }

        #oneOne div:last-child {
            margin-top: -30px;
        }

        #call dt, #call dd {
            float: left;
        }

        #call dd::after{
            content: ' ';
            display: block;
            clear: both;
        }

        #oneOne span:nth-child(3) {
            color: orange;
        }

        #tabs {
            width: 1200px;
            padding-bottom: 100px;
            text-align: center;
            margin-top: 100px;
        }

        .tabMenu {
            border: 1px solid #eee;
            width: 171.4px;
            height: 70px;
            float: left;
            text-align: center;
            padding-top: 25px;
            border-right: none;
            color: black;
        }
        .tabMenu:first-child{
            background-color: orange;
            color: white;
        }
        .tabMenu:last-child{
            border-right: 1px solid #eee;
        }


        /* #tab1 {
            text-align: center;
            margin-top: 100px;
        } */

        #tab1 img:first-child {
            margin-top: 50px;
        }

        .tabss img:first-child {
            margin-top: 100px;
        }

        #tab1 h1 {
            margin: 30px;
            margin-top: 90px;
            padding-top: 70px;
            border-top: 1px solid #eee;
        }
        #tab1 h1:nth-child(2){
            border: none;
            padding: 0px;
        }

        #tab1 p {
            margin-bottom: 30px;
        }
        .guideImg {
            /* border: 1px solid black; */
            float: left;
            margin-left: 103px;
        }

        .guideP {
            /* font-size: 14px; */
            /* border: 1px solid black; */
            /* padding-left: 600px; */
            margin-left: 650px;
            margin-top: 40px;
            text-align: left;
            height: 320px;
        }

        .guideP span {
            color: tomato;
        }

        .tabMenu2 {
            border-bottom: 2px solid #eee;
            width: 171.4px;
            height: 70px;
            float: left;
            text-align: center;
            padding-top: 25px;
            border-right: none;
            color: black;
            margin-top: 50px;
        }

        .tabMenu2:first-child{
            /* background-color: orange; */
            color: orange;
            border-bottom: 2px solid orange;
        }

        #searchFAQ {
            padding-top: 150px;
        }

        #searchFAQBox {
            width: 630px;
            height: 60px;
            border: 2px solid black;
            padding: 0px 20px;
            padding-right: 80px;
        }

        #searchFAQ div {
            width: 60px;
            height: 60px;
            font-size: 30px;
            display: block;
            float: left;
            position: relative;
            left: 885px;
            text-align: center center;
        }

        #searchFAQ span {
            position: relative;
            top: 15px;
        }

        .badge {
            margin-left: 10px;
            background-color: #ddd;
            color: gray;
        }
        #badge1 {
            background-color: rgb(214, 179, 114);
            color: white;
        }

        /* 아코디언 */
        .a1 {
            margin-top: 50px;
            text-align: left;
            outline: none;
        }
        .aSpan {
            width: 250px;
            display: inline-block;
            text-align: center;
        }
        #tabs2 .a1 div {
            padding-left: 290px;
        }

        .ui-state-active {
            background-image: url();
        }

        /* .ui-state-hover {
            background-color: orange;
            background-image: url();
        }

        .ui-accordion-header {
            background-color: orange;
        } */

        .ui-accordion-header{
            border: 0px;
            background: #FECA52;
            color: white;
        }
        .ui-accordion-content{
            border: 1px solid #FECA52;
            background: white;
            color: gray;
        }

        /* 태그 */
        #tagsearch {
            border: 1px solid #111;
            width: 170px;
            height: 205px;
            position: relative;
            left: -15px;
            float: right;
            background-color: white;
            margin-right: 60px;
            margin-top: 2px;
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
        <%@include file="/WEB-INF/views/inc/usertopbar.jsp" %>
        </div>
            
            <!-- 챗봇 : 단비봇 --------------------------------------------------------------------------------------------------------------------------------->
            <%@include file="/WEB-INF/views/inc/userchat.jsp" %>
            <!-- 제일 위로 돌아가기 버튼 -->
            <div id="movetop"><a href="#top">↑</a></div>
        </div>
            <!-- 내용============================================================================================================================================= -->
            <div id="mainBox">
                <h1>이용안내</h1>
                <div id="call">
                    <div id="center">
                        <div class="icons">
                            <span class="glyphicon glyphicon-earphone"></span>
                        </div>
                        <div class="callName">고객센터</div>
                        <dl>
                            <dt>전화문의 : </dt>
                                <dd>1544-6399</dd>
                                <br>
                                <!-- <div style="clear:both;"></div> -->
                            <dt>이용시간 : </dt>
                                <dd>평일 09:00~18:00 / 토요일 09:00~17:00<br>
                                    (점심시간: 12:00~13:00 / 일요일, 공휴일 휴무)</dd>
                            <div style="clear:both;"></div>
                        </dl>
                    </div>
                    <div id="oneOne">
                        <div class="icons">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </div>
                        <!-- <div class="callName">1:1문의</div><div id="qLink"><span>문의하기</span></div> -->
                        <div class="callName">1:1문의</div><button id="qLink">문의하기</button>
                        <div>평일 오후 5시 이후 문의는 당일 답변이 어려울 수 있습니다.<br>
                            토,일요일/공휴일 문의는 운영 시간 내 순차적으로 답변 드리겠습니다.<br>
                            <span><span class="glyphicon glyphicon-exclamation-sign"></span>잠깐!</span> 1:1 문의 전 FAQ 를 먼저 확인해보세요.</div>
                    </div>
                </div>

                <div id="tabs">
                    <div id="tabMenu">
                        <div class="tabMenu" data-tab="tab1">예매방법</div>
                        <div class="tabMenu" data-tab="tab2">결제방법</div>
                        <div class="tabMenu" data-tab="tab3">수수료</div>
                        <div class="tabMenu" data-tab="tab4">취소/환불</div>
                        <div class="tabMenu" data-tab="tab5">티켓수령</div>
                        <div class="tabMenu" data-tab="tab6">FAQ</div>
                        <div class="tabMenu" data-tab="tab7">티켓반매/재휴문의</div>
                    </div>
                    <div id="tab1" class="tabss">
                        <img src="./images/ticketing1.jpg" alt="">
                        <h1>1. 본인인증/로그인</h1>
                        <p>빠른 예매를 위해 로그인을 먼저 해주세요.<br>
                            예매는 <span>본인인증된 ID로만 가능</span>합니다.<br>
                            개인 정보 보호 및 관리를 위해 예매 전 가입된 회원 정보를 확인해주시기 바라며, 주기적으로 비밀번호를 변경해주시기 바랍니다.
                        </p>
                            <img src="./images/guide-img2.jpg">
                        <h1>2. 공연 및 관람일시 선택</h1>
                        <p>관람 원하는 공연 선택 > [예매하기] 버튼 클릭 > 관람하실 날짜와 시간을 선택합니다.<br>
                            (공연 상세페이지에서 관람일 및 회차를 선택 한 경우 이후 단계에 자동 적용 됩니다.)
                        </p>
                        <img src="./images/guide-img3.jpg">
                        <h1>3. 좌석 선택</h1>
                        <img src="./images/guide-img4.jpg" class="guideImg">

                        <p class="guideP">
                            좌석도에서 원하는 좌석을 선택합니다. 좌석 선택 시 티켓 결제 가격이 자동 적용 됩니다.<br>
                            규모가 큰 공연장은 미니맵을 이용하여 구역, 층을 이동하여 다른 좌석을 선택할 수 있습니다.<br>
                            다른 일시로의 변경을 원하는 경우 좌석도 상단에서 관람일/회차 변경을 선택해주세요.<br>
                            <span>
                                - 동시 접속 회원이 많아 예매가 집중되면, 간혹 선택한 좌석이 다른 회원과 중복될 수 있습니다.<br>
                                이 때는 결제를 먼저 완료한 분께 좌석이 지정됩니다.<br>
                                - 좌석을 선점한 경우에도 일정 시간이 지나도록 결제 완료를 하지 않으면 선점 해제가 됩니다.<br><br>
                            </span>
                            비지정석 공연의 경우 좌석 선택 단계 없이 등급/매수만 선택합니다.<br>
                            * 안내되어 있는 잔여석 정보는 현재 예매 진행 중인(결제 전) 좌석이 포함되어 있어 실제 예매 가능 좌석수와 다를 수 있습니다.
                        </p>
                        <div style="clear:both;"></div>
                        <h1>4. 할인/쿠폰 선택</h1>
                        <img src="./images/guide-img5.jpg" class="guideImg">
                        <p class="guideP">
                            적용 받고자 하는 할인 종류와 매수를 선택합니다.<br>
                            장애인, 국가유공자 할인 등 증빙이 필요한 할인이 있을 수 있으니 반드시
                            유의사항을 확인해주시기 바랍니다.<br>
                            신용카드 할인을 선택한 경우 해당 카드로만 결제가 가능합니다.<br><br>
                            사용 가능한 쿠폰이 있는 경우 해당 쿠폰을 선택합니다. 
                        </p>
                        <div style="clear:both;"></div>
                        <h1>5. 수령방법 선택</h1>
                        <img src="./images/guide-img6.jpg" class="guideImg">
                        <p class="guideP">
                            현장수령, 배송 중 원하는 수령 방법을 선택합니다.(상품의 특성에 따라 수령방법 선택이 제한될 수 있습니다.)<br><br>
                            현장 수령 은 공연 당일 매표소에서 예매자 본인 신분증,예매내역서(예약번호) 로 본인 확인 후 티켓을 수령하는 방법입니다.<br>
                            <span>* 공연에 따라 예매자 본인 외 티켓 수령이 불가할 수 있습니다.</span><br>
                            배송 인 경우 배송비가 추가 결제 되며, 예매 완료 후 영업일 기준 5~7일이내에 수령 가능합니다. (단, 일괄배송 상품은 배송 시작일이 지정되어있습니다.)<br>
                            배송 선택 시 수령자 정보를 정확히 입력합니다.<br>
                            <span>* 티켓 분실 시 재발행 되지 않으니, 보관에 유의하시기 바랍니다.</span>
                        </p>
                        <div style="clear:both;"></div>
                        <h1>6. 결제방법 선택</h1>
                        <img src="./images/guide-img7.jpg" class="guideImg">
                        <p class="guideP">
                            원하는 결제 수단을 선택합니다.<br>
                            상품별로 사용 가능한 결제 수단에 제한이 있을 수 있습니다.
                        </p>
                        <div style="clear:both;"></div>
                        <h1>7. 정책 동의</h1>
                        <img src="./images/guide-img8.jpg" class="guideImg">
                        <p class="guideP">
                            취소 마감 시간 및 취소 수수료 정책을 확인하고 이에 동의합니다.<br>
                            예매/관람 서비스 제공을 위한 제3자 정보 제공을 확인하고 이에 동의합니다.
                        </p>
                        <div style="clear:both;"></div>
                        <h1>8. 예매내역 확인</h1>
                        <p>
                            결제 완료 후 예매 내역은 회원 정보 상의 이메일 또는 카카오톡 알림톡/SMS 로 발송되며, MY티켓의 [예매확인/취소] 에서도 확인 가능합니다.
                        </p>

                                
                    </div>
                    <div id="tab2" class="tabss">
                        <img src="./images/guide1.JPG">
                        <img src="./images/guide2.JPG">
                        <img src="./images/guide3.JPG">
                    </div>
                    <div id="tab3" class="tabss">
                        <img src="./images/guide4.JPG">
                        <img src="./images/guide5.JPG">
                        <img src="./images/guide6.JPG">
                    </div>
                    <div id="tab4" class="tabss">
                        <img src="./images/guide7.JPG">  
                        <img src="./images/guide8.JPG">  
                        <img src="./images/guide9.JPG">  
                        <img src="./images/guide10.JPG">  
                    </div>
                    <div id="tab5" class="tabss">
                        <img src="./images/guide11.JPG">  
                        
                    </div>
                    <div id="tab6" class="tabss">
                        <div id="searchFAQ">
                            <input type="text" placeholder="궁금하신 내용을 입력해주세요" id="searchFAQBox">
                            <div><span class="glyphicon glyphicon-search"></span></div>
                        </div>
                        <div id="tabs2">
                            <div id="tabMenu2">
                                <div class="tabMenu2" data-tab="tab11">전체<span class="badge" id="badge1">59</span></div>
                                <div class="tabMenu2" data-tab="tab12">회원<span class="badge" id="badge2">7</span></div>
                                <div class="tabMenu2" data-tab="tab13">예매/결제<span class="badge" id="badge3">14</span></div>
                                <div class="tabMenu2" data-tab="tab14">취소/환불<span class="badge" id="badge4">8</span></div>
                                <div class="tabMenu2" data-tab="tab15">티켓수령<span class="badge" id="badge5">10</span></div>
                                <div class="tabMenu2" data-tab="tab16">팬클럽<span class="badge" id="badge6">15</span></div>
                                <div class="tabMenu2" data-tab="tab17">기타<span class="badge" id="badge7">5</span></div>
                                <div style="clear:both;"></div>
                            </div>
                            <div id="tab11" class="tabFAQ">

                                <div class="a1">

                                    <h3><span class="aSpan">취소/환불</span>환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!</h3>
                                    <div>
                                        <img src="./images/faq.JPG" style="position: relative; top: -70px;">
                                    </div>
                                    <h3><span class="aSpan">팬클럽</span>[SM팬클럽] 기존에 구매했던 At-ticket 계정 말고 다른 계정으로 연장이 가능한가요?</h3>
                                    <div>
                                        이전에 ACE 회원코드를 구입했던 계정으로만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 코드를 구매하길 원하시는 경우 이전에 ACE 회원코드를 구매, 인증했던 YES24 계정으로 연장 코드 구매 및 등록하시어 ACE Ⅱ회원 혜택을 받으시길 바랍니다.
                                    </div>
                                    <h3><span class="aSpan">팬클럽</span>[SM팬클럽] ACE 회원 연장 기간을 놓쳤어요</h3>
                                    <div>
                                        현재 ACE 회원인 경우에만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 기간이 지난 경우 이미 ACE 회원 연장 코드를 구입하셨더라도 ACE Ⅱ회원으로 전환이 불가합니다.<br>
                                        연장 기간이 지난 후 ACE 회원코드를 구입하시길 원한다면 연장 코드가 아닌 신규 ACE 회원코드를 구입 및 등록하여 서비스 이용이 가능합니다.<br>
                                        Lysn>가입한 팬클럽 내 설정에서 [ACE 회원코드 구매하기] 버튼을 클릭하여 ACE 회원코드를 구매해 주시기 바랍니다.<br><br>
                                        * 만약 ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 상태에서 ACE 회원 기간이 만료된 경우, 해당 ACE 회원 연장 코드는 사용이 불가합니다. 따라서 ACE회원 연장 기간 내 구매 및 전환을 완료해주시기 바랍니다.
                                    </div>
                                    <h3><span class="aSpan">팬클럽</span>[SM팬클럽] ACE 회원 연장 코드를 입력했는데 아직 ACE등급이예요!</h3>
                                    <div>
                                        ACE 회원 연장 코드 등록 시점이 아닌 회원 기간 연장이 시작되는 시점에 ACE Ⅱ회원으로 전환이 됩니다.<br>
                                        (ex. 2020년 3월 16일 ACE 회원 만료인 회원이 2020년 3월 10일에 연장한 경우,<br>
                                        2020년 3월 16일까지 ACE 회원 유지, 2020년 3월 17일에 ACE Ⅱ 회원으로 전환)
                                    </div>
                                    <h3><span class="aSpan">팬클럽</span>[SM팬클럽] 회원 연장 코드를 구입했는데 상품 옵션을 변경하고 싶어요</h3>
                                    <div>
                                        ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 회원에 한해 가능합니다.<br>
                                        옵션 변경을 원하는 경우, MY공연 - 예매상세내역에서 구입하신 ACE 회원 연장 코드 구매 취소 후 새로운 ACE 회원 연장 코드 상품 옵션을 선택하여 구매 바랍니다.<br>
                                        단, ACE Ⅱ회원으로 전환이 완료 된 시점부터는 환불이 불가할 수 있으니 신중한 선택 후 구입 부탁 드립니다.<br><br>
                                        ※ 상품 옵션 변경을 위해 팬클럽을 탈퇴하신 경우, 팬클럽 탈퇴 시 안내드린 대로 탈퇴일로부터 180일 동안 같은 팬클럽 내 재가입이 불가합니다. 환불이 필요한 경우 고객센터(T.1544-6399)로 문의 바랍니다. 단, 팬클럽 선예매 대상자 또는 OFFICIAL FANCLUB KIT 제작이 시작된 경우 ACE 회원 코드 및 연장 코드의 전액 환불 및 재구매가 불가합니다.
                                    </div>

                                </div>
                            </div>
                            <div id="tab12" class="tabFAQ">
                                <div class="a1">
                                    <h3><span>취소/환불</span>환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!</h3>
                                    <div>
                                        <img src="./images/faq.JPG" style="position: relative; top: -70px;">
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 기존에 구매했던 At-ticket 계정 말고 다른 계정으로 연장이 가능한가요?</h3>
                                    <div>
                                        이전에 ACE 회원코드를 구입했던 계정으로만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 코드를 구매하길 원하시는 경우 이전에 ACE 회원코드를 구매, 인증했던 YES24 계정으로 연장 코드 구매 및 등록하시어 ACE Ⅱ회원 혜택을 받으시길 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 기간을 놓쳤어요</h3>
                                    <div>
                                        현재 ACE 회원인 경우에만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 기간이 지난 경우 이미 ACE 회원 연장 코드를 구입하셨더라도 ACE Ⅱ회원으로 전환이 불가합니다.<br>
                                        연장 기간이 지난 후 ACE 회원코드를 구입하시길 원한다면 연장 코드가 아닌 신규 ACE 회원코드를 구입 및 등록하여 서비스 이용이 가능합니다.<br>
                                        Lysn>가입한 팬클럽 내 설정에서 [ACE 회원코드 구매하기] 버튼을 클릭하여 ACE 회원코드를 구매해 주시기 바랍니다.<br><br>
                                        * 만약 ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 상태에서 ACE 회원 기간이 만료된 경우, 해당 ACE 회원 연장 코드는 사용이 불가합니다. 따라서 ACE회원 연장 기간 내 구매 및 전환을 완료해주시기 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 코드를 입력했는데 아직 ACE등급이예요!</h3>
                                    <div>
                                        ACE 회원 연장 코드 등록 시점이 아닌 회원 기간 연장이 시작되는 시점에 ACE Ⅱ회원으로 전환이 됩니다.<br>
                                        (ex. 2020년 3월 16일 ACE 회원 만료인 회원이 2020년 3월 10일에 연장한 경우,<br>
                                        2020년 3월 16일까지 ACE 회원 유지, 2020년 3월 17일에 ACE Ⅱ 회원으로 전환)
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 회원 연장 코드를 구입했는데 상품 옵션을 변경하고 싶어요</h3>
                                    <div>
                                        ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 회원에 한해 가능합니다.<br>
                                        옵션 변경을 원하는 경우, MY공연 - 예매상세내역에서 구입하신 ACE 회원 연장 코드 구매 취소 후 새로운 ACE 회원 연장 코드 상품 옵션을 선택하여 구매 바랍니다.<br>
                                        단, ACE Ⅱ회원으로 전환이 완료 된 시점부터는 환불이 불가할 수 있으니 신중한 선택 후 구입 부탁 드립니다.<br><br>
                                        ※ 상품 옵션 변경을 위해 팬클럽을 탈퇴하신 경우, 팬클럽 탈퇴 시 안내드린 대로 탈퇴일로부터 180일 동안 같은 팬클럽 내 재가입이 불가합니다. 환불이 필요한 경우 고객센터(T.1544-6399)로 문의 바랍니다. 단, 팬클럽 선예매 대상자 또는 OFFICIAL FANCLUB KIT 제작이 시작된 경우 ACE 회원 코드 및 연장 코드의 전액 환불 및 재구매가 불가합니다.
                                    </div>

                                </div>
                            </div>
                            <div id="tab13" class="tabFAQ">
                                <div class="a1">
                                    <h3><span>취소/환불</span>환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!</h3>
                                    <div>
                                        <img src="./images/faq.JPG" style="position: relative; top: -70px;">
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 기존에 구매했던 At-ticket 계정 말고 다른 계정으로 연장이 가능한가요?</h3>
                                    <div>
                                        이전에 ACE 회원코드를 구입했던 계정으로만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 코드를 구매하길 원하시는 경우 이전에 ACE 회원코드를 구매, 인증했던 YES24 계정으로 연장 코드 구매 및 등록하시어 ACE Ⅱ회원 혜택을 받으시길 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 기간을 놓쳤어요</h3>
                                    <div>
                                        현재 ACE 회원인 경우에만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 기간이 지난 경우 이미 ACE 회원 연장 코드를 구입하셨더라도 ACE Ⅱ회원으로 전환이 불가합니다.<br>
                                        연장 기간이 지난 후 ACE 회원코드를 구입하시길 원한다면 연장 코드가 아닌 신규 ACE 회원코드를 구입 및 등록하여 서비스 이용이 가능합니다.<br>
                                        Lysn>가입한 팬클럽 내 설정에서 [ACE 회원코드 구매하기] 버튼을 클릭하여 ACE 회원코드를 구매해 주시기 바랍니다.<br><br>
                                        * 만약 ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 상태에서 ACE 회원 기간이 만료된 경우, 해당 ACE 회원 연장 코드는 사용이 불가합니다. 따라서 ACE회원 연장 기간 내 구매 및 전환을 완료해주시기 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 코드를 입력했는데 아직 ACE등급이예요!</h3>
                                    <div>
                                        ACE 회원 연장 코드 등록 시점이 아닌 회원 기간 연장이 시작되는 시점에 ACE Ⅱ회원으로 전환이 됩니다.<br>
                                        (ex. 2020년 3월 16일 ACE 회원 만료인 회원이 2020년 3월 10일에 연장한 경우,<br>
                                        2020년 3월 16일까지 ACE 회원 유지, 2020년 3월 17일에 ACE Ⅱ 회원으로 전환)
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 회원 연장 코드를 구입했는데 상품 옵션을 변경하고 싶어요</h3>
                                    <div>
                                        ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 회원에 한해 가능합니다.<br>
                                        옵션 변경을 원하는 경우, MY공연 - 예매상세내역에서 구입하신 ACE 회원 연장 코드 구매 취소 후 새로운 ACE 회원 연장 코드 상품 옵션을 선택하여 구매 바랍니다.<br>
                                        단, ACE Ⅱ회원으로 전환이 완료 된 시점부터는 환불이 불가할 수 있으니 신중한 선택 후 구입 부탁 드립니다.<br><br>
                                        ※ 상품 옵션 변경을 위해 팬클럽을 탈퇴하신 경우, 팬클럽 탈퇴 시 안내드린 대로 탈퇴일로부터 180일 동안 같은 팬클럽 내 재가입이 불가합니다. 환불이 필요한 경우 고객센터(T.1544-6399)로 문의 바랍니다. 단, 팬클럽 선예매 대상자 또는 OFFICIAL FANCLUB KIT 제작이 시작된 경우 ACE 회원 코드 및 연장 코드의 전액 환불 및 재구매가 불가합니다.
                                    </div>

                                </div>
                            </div>
                            <div id="tab14" class="tabFAQ">
                                <div class="a1">
                                    <h3><span>취소/환불</span>환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!</h3>
                                    <div>
                                        <img src="./images/faq.JPG" style="position: relative; top: -70px;">
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 기존에 구매했던 At-ticket 계정 말고 다른 계정으로 연장이 가능한가요?</h3>
                                    <div>
                                        이전에 ACE 회원코드를 구입했던 계정으로만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 코드를 구매하길 원하시는 경우 이전에 ACE 회원코드를 구매, 인증했던 YES24 계정으로 연장 코드 구매 및 등록하시어 ACE Ⅱ회원 혜택을 받으시길 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 기간을 놓쳤어요</h3>
                                    <div>
                                        현재 ACE 회원인 경우에만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 기간이 지난 경우 이미 ACE 회원 연장 코드를 구입하셨더라도 ACE Ⅱ회원으로 전환이 불가합니다.<br>
                                        연장 기간이 지난 후 ACE 회원코드를 구입하시길 원한다면 연장 코드가 아닌 신규 ACE 회원코드를 구입 및 등록하여 서비스 이용이 가능합니다.<br>
                                        Lysn>가입한 팬클럽 내 설정에서 [ACE 회원코드 구매하기] 버튼을 클릭하여 ACE 회원코드를 구매해 주시기 바랍니다.<br><br>
                                        * 만약 ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 상태에서 ACE 회원 기간이 만료된 경우, 해당 ACE 회원 연장 코드는 사용이 불가합니다. 따라서 ACE회원 연장 기간 내 구매 및 전환을 완료해주시기 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 코드를 입력했는데 아직 ACE등급이예요!</h3>
                                    <div>
                                        ACE 회원 연장 코드 등록 시점이 아닌 회원 기간 연장이 시작되는 시점에 ACE Ⅱ회원으로 전환이 됩니다.<br>
                                        (ex. 2020년 3월 16일 ACE 회원 만료인 회원이 2020년 3월 10일에 연장한 경우,<br>
                                        2020년 3월 16일까지 ACE 회원 유지, 2020년 3월 17일에 ACE Ⅱ 회원으로 전환)
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 회원 연장 코드를 구입했는데 상품 옵션을 변경하고 싶어요</h3>
                                    <div>
                                        ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 회원에 한해 가능합니다.<br>
                                        옵션 변경을 원하는 경우, MY공연 - 예매상세내역에서 구입하신 ACE 회원 연장 코드 구매 취소 후 새로운 ACE 회원 연장 코드 상품 옵션을 선택하여 구매 바랍니다.<br>
                                        단, ACE Ⅱ회원으로 전환이 완료 된 시점부터는 환불이 불가할 수 있으니 신중한 선택 후 구입 부탁 드립니다.<br><br>
                                        ※ 상품 옵션 변경을 위해 팬클럽을 탈퇴하신 경우, 팬클럽 탈퇴 시 안내드린 대로 탈퇴일로부터 180일 동안 같은 팬클럽 내 재가입이 불가합니다. 환불이 필요한 경우 고객센터(T.1544-6399)로 문의 바랍니다. 단, 팬클럽 선예매 대상자 또는 OFFICIAL FANCLUB KIT 제작이 시작된 경우 ACE 회원 코드 및 연장 코드의 전액 환불 및 재구매가 불가합니다.
                                    </div>

                                </div>
                            </div>
                            <div id="tab15" class="tabFAQ">
                                <div class="a1">
                                    <h3><span>취소/환불</span>환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!</h3>
                                    <div>
                                        <img src="./images/faq.JPG" style="position: relative; top: -70px;">
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 기존에 구매했던 At-ticket 계정 말고 다른 계정으로 연장이 가능한가요?</h3>
                                    <div>
                                        이전에 ACE 회원코드를 구입했던 계정으로만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 코드를 구매하길 원하시는 경우 이전에 ACE 회원코드를 구매, 인증했던 YES24 계정으로 연장 코드 구매 및 등록하시어 ACE Ⅱ회원 혜택을 받으시길 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 기간을 놓쳤어요</h3>
                                    <div>
                                        현재 ACE 회원인 경우에만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 기간이 지난 경우 이미 ACE 회원 연장 코드를 구입하셨더라도 ACE Ⅱ회원으로 전환이 불가합니다.<br>
                                        연장 기간이 지난 후 ACE 회원코드를 구입하시길 원한다면 연장 코드가 아닌 신규 ACE 회원코드를 구입 및 등록하여 서비스 이용이 가능합니다.<br>
                                        Lysn>가입한 팬클럽 내 설정에서 [ACE 회원코드 구매하기] 버튼을 클릭하여 ACE 회원코드를 구매해 주시기 바랍니다.<br><br>
                                        * 만약 ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 상태에서 ACE 회원 기간이 만료된 경우, 해당 ACE 회원 연장 코드는 사용이 불가합니다. 따라서 ACE회원 연장 기간 내 구매 및 전환을 완료해주시기 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 코드를 입력했는데 아직 ACE등급이예요!</h3>
                                    <div>
                                        ACE 회원 연장 코드 등록 시점이 아닌 회원 기간 연장이 시작되는 시점에 ACE Ⅱ회원으로 전환이 됩니다.<br>
                                        (ex. 2020년 3월 16일 ACE 회원 만료인 회원이 2020년 3월 10일에 연장한 경우,<br>
                                        2020년 3월 16일까지 ACE 회원 유지, 2020년 3월 17일에 ACE Ⅱ 회원으로 전환)
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 회원 연장 코드를 구입했는데 상품 옵션을 변경하고 싶어요</h3>
                                    <div>
                                        ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 회원에 한해 가능합니다.<br>
                                        옵션 변경을 원하는 경우, MY공연 - 예매상세내역에서 구입하신 ACE 회원 연장 코드 구매 취소 후 새로운 ACE 회원 연장 코드 상품 옵션을 선택하여 구매 바랍니다.<br>
                                        단, ACE Ⅱ회원으로 전환이 완료 된 시점부터는 환불이 불가할 수 있으니 신중한 선택 후 구입 부탁 드립니다.<br><br>
                                        ※ 상품 옵션 변경을 위해 팬클럽을 탈퇴하신 경우, 팬클럽 탈퇴 시 안내드린 대로 탈퇴일로부터 180일 동안 같은 팬클럽 내 재가입이 불가합니다. 환불이 필요한 경우 고객센터(T.1544-6399)로 문의 바랍니다. 단, 팬클럽 선예매 대상자 또는 OFFICIAL FANCLUB KIT 제작이 시작된 경우 ACE 회원 코드 및 연장 코드의 전액 환불 및 재구매가 불가합니다.
                                    </div>

                                </div>
                            </div>
                            <div id="tab16" class="tabFAQ">
                                <div class="a1">
                                    <h3><span>취소/환불</span>환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!</h3>
                                    <div>
                                        <img src="./images/faq.JPG" style="position: relative; top: -70px;">
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 기존에 구매했던 At-ticket 계정 말고 다른 계정으로 연장이 가능한가요?</h3>
                                    <div>
                                        이전에 ACE 회원코드를 구입했던 계정으로만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 코드를 구매하길 원하시는 경우 이전에 ACE 회원코드를 구매, 인증했던 YES24 계정으로 연장 코드 구매 및 등록하시어 ACE Ⅱ회원 혜택을 받으시길 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 기간을 놓쳤어요</h3>
                                    <div>
                                        현재 ACE 회원인 경우에만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 기간이 지난 경우 이미 ACE 회원 연장 코드를 구입하셨더라도 ACE Ⅱ회원으로 전환이 불가합니다.<br>
                                        연장 기간이 지난 후 ACE 회원코드를 구입하시길 원한다면 연장 코드가 아닌 신규 ACE 회원코드를 구입 및 등록하여 서비스 이용이 가능합니다.<br>
                                        Lysn>가입한 팬클럽 내 설정에서 [ACE 회원코드 구매하기] 버튼을 클릭하여 ACE 회원코드를 구매해 주시기 바랍니다.<br><br>
                                        * 만약 ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 상태에서 ACE 회원 기간이 만료된 경우, 해당 ACE 회원 연장 코드는 사용이 불가합니다. 따라서 ACE회원 연장 기간 내 구매 및 전환을 완료해주시기 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 코드를 입력했는데 아직 ACE등급이예요!</h3>
                                    <div>
                                        ACE 회원 연장 코드 등록 시점이 아닌 회원 기간 연장이 시작되는 시점에 ACE Ⅱ회원으로 전환이 됩니다.<br>
                                        (ex. 2020년 3월 16일 ACE 회원 만료인 회원이 2020년 3월 10일에 연장한 경우,<br>
                                        2020년 3월 16일까지 ACE 회원 유지, 2020년 3월 17일에 ACE Ⅱ 회원으로 전환)
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 회원 연장 코드를 구입했는데 상품 옵션을 변경하고 싶어요</h3>
                                    <div>
                                        ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 회원에 한해 가능합니다.<br>
                                        옵션 변경을 원하는 경우, MY공연 - 예매상세내역에서 구입하신 ACE 회원 연장 코드 구매 취소 후 새로운 ACE 회원 연장 코드 상품 옵션을 선택하여 구매 바랍니다.<br>
                                        단, ACE Ⅱ회원으로 전환이 완료 된 시점부터는 환불이 불가할 수 있으니 신중한 선택 후 구입 부탁 드립니다.<br><br>
                                        ※ 상품 옵션 변경을 위해 팬클럽을 탈퇴하신 경우, 팬클럽 탈퇴 시 안내드린 대로 탈퇴일로부터 180일 동안 같은 팬클럽 내 재가입이 불가합니다. 환불이 필요한 경우 고객센터(T.1544-6399)로 문의 바랍니다. 단, 팬클럽 선예매 대상자 또는 OFFICIAL FANCLUB KIT 제작이 시작된 경우 ACE 회원 코드 및 연장 코드의 전액 환불 및 재구매가 불가합니다.
                                    </div>

                                </div>
                            </div>
                            <div id="tab17" class="tabFAQ">
                                <div class="a1">
                                    <h3><span>취소/환불</span>환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!</h3>
                                    <div>
                                        <img src="./images/faq.JPG" style="position: relative; top: -70px;">
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 기존에 구매했던 At-ticket 계정 말고 다른 계정으로 연장이 가능한가요?</h3>
                                    <div>
                                        이전에 ACE 회원코드를 구입했던 계정으로만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 코드를 구매하길 원하시는 경우 이전에 ACE 회원코드를 구매, 인증했던 YES24 계정으로 연장 코드 구매 및 등록하시어 ACE Ⅱ회원 혜택을 받으시길 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 기간을 놓쳤어요</h3>
                                    <div>
                                        현재 ACE 회원인 경우에만 ACE 회원 연장 코드 구입 및 전환이 가능합니다.<br>
                                        만약 연장 기간이 지난 경우 이미 ACE 회원 연장 코드를 구입하셨더라도 ACE Ⅱ회원으로 전환이 불가합니다.<br>
                                        연장 기간이 지난 후 ACE 회원코드를 구입하시길 원한다면 연장 코드가 아닌 신규 ACE 회원코드를 구입 및 등록하여 서비스 이용이 가능합니다.<br>
                                        Lysn>가입한 팬클럽 내 설정에서 [ACE 회원코드 구매하기] 버튼을 클릭하여 ACE 회원코드를 구매해 주시기 바랍니다.<br><br>
                                        * 만약 ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 상태에서 ACE 회원 기간이 만료된 경우, 해당 ACE 회원 연장 코드는 사용이 불가합니다. 따라서 ACE회원 연장 기간 내 구매 및 전환을 완료해주시기 바랍니다.
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] ACE 회원 연장 코드를 입력했는데 아직 ACE등급이예요!</h3>
                                    <div>
                                        ACE 회원 연장 코드 등록 시점이 아닌 회원 기간 연장이 시작되는 시점에 ACE Ⅱ회원으로 전환이 됩니다.<br>
                                        (ex. 2020년 3월 16일 ACE 회원 만료인 회원이 2020년 3월 10일에 연장한 경우,<br>
                                        2020년 3월 16일까지 ACE 회원 유지, 2020년 3월 17일에 ACE Ⅱ 회원으로 전환)
                                    </div>
                                    <h3><span>팬클럽</span>[SM팬클럽] 회원 연장 코드를 구입했는데 상품 옵션을 변경하고 싶어요</h3>
                                    <div>
                                        ACE 회원 연장 코드 구매 후 Lysn에 등록하지 않은 회원에 한해 가능합니다.<br>
                                        옵션 변경을 원하는 경우, MY공연 - 예매상세내역에서 구입하신 ACE 회원 연장 코드 구매 취소 후 새로운 ACE 회원 연장 코드 상품 옵션을 선택하여 구매 바랍니다.<br>
                                        단, ACE Ⅱ회원으로 전환이 완료 된 시점부터는 환불이 불가할 수 있으니 신중한 선택 후 구입 부탁 드립니다.<br><br>
                                        ※ 상품 옵션 변경을 위해 팬클럽을 탈퇴하신 경우, 팬클럽 탈퇴 시 안내드린 대로 탈퇴일로부터 180일 동안 같은 팬클럽 내 재가입이 불가합니다. 환불이 필요한 경우 고객센터(T.1544-6399)로 문의 바랍니다. 단, 팬클럽 선예매 대상자 또는 OFFICIAL FANCLUB KIT 제작이 시작된 경우 ACE 회원 코드 및 연장 코드의 전액 환불 및 재구매가 불가합니다.
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab7" class="tabss">
                        <img src="./images/guide12.JPG">  
                        <img src="./images/guide13.JPG">  
                        <!-- <img src="./images/guide14.JPG">   -->
                        
                    </div>
                </div>
            </div>




            <!-------------------------------- 화면 하단부 -------------------------------->
            <%@include file="/WEB-INF/views/inc/userbottombar.jsp" %>

            

    <script>

        //상단 메뉴 css
        $(".menubar").mouseover(function() {
        $(this).css("border-bottom", "5px solid orange");
        });
        $(".menubar").mouseout(function() {
            $(this).css("border-bottom", "");
        });

        //상단 메뉴 클릭시
        $(".menubar").click(function () {
            location.href = $(this).data("lo");
        });

        var flag = false;

        $(document).scroll(function() {
            //메뉴가 시야에서 사라지는 순간 -> 메뉴를 붙박이로 만들기
            // if (!flag) {
                if ($(document).scrollTop() > $("#tabs").position().top) {
                    $("#topmenu").css({
                        width: "100%",
                        position: "fixed",
                        top: "0px",
                        bottom: "",
                        zIndex: "1"
                    });
                };

            //상단 헤더(top)이 눈에 보일때 쯤
            if ($(document).scrollTop() <= $("#tabs").position().top) {
                $("#topmenu").css({
                    position: "absolute",
                    top: "0px",
                    bottom: ""
                });
                // flag = false;                
            }
        });

        //검색창 커서 있을때 팝업 띄우기
        $("#search").focusin(function () {
            $("#tagsearch").css("display", "block");
            //$("#search").css("border-bottom", "2px solid black");
        });
        //검색창 팝업 닫기
        $("#search").focusout(function () {
            $("#tagsearch").css("display", "none");
        });
        $("#tagremove").click(function () {
            $("#tagsearch").css("display", "none");
        });

 
        //이미지에 마우스 올릴때
        $(".img").mouseover(function() {
            $(this).css("box-shadow", "1px 1px 1px 2px gray");
        });
        //이미지에 마우스 뗄때
        $(".img").mouseout(function() {
            $(this).css("box-shadow", "");
        });
        
        //이미지 클릭시 이동
        $(".img").click(function() {
            location.href = "#";
        });

        //챗봇 클릭시 행동
        $("#chatbot").dblclick(function() {
            alert("챗봇입니다!");
        });
        //챗봇 이동 가능
        $("#chatbot").draggable();

        $("#movetop").click(function() {
            //<a> 본연의 기능을 제거
			event.preventDefault();

            $("html,body").animate({
                scrollTop: 0
            }, 1000);
        });

        // 내용==================================================================================================================================================================
        // $("#tabs").tabs({
        //     active: 0
        // });

        $(".tabss").css("display","none");
        $("#tab1").css("display","block");

            $(".tabMenu").click(function(){
                // alert(this);
                $(".tabMenu").css({
                    "background-color" : "white",
                    "color": "black"
                })
                $(this).css({
                    "background-color" : "orange",
                    "color": "white"
                })

                $(".tabss").css("display","none");
                $('#'+$(this).attr("data-tab")).css("display","block");

            });
            
        $(".tabFAQ").css("display","none");
        $("#tab11").css("display","block");

            $(".tabMenu2").click(function(){
                // alert(this);
                $(".tabMenu2").css({
                    "border-bottom" : "2px solid #eee",
                    "color": "black"
                })
                $(".tabMenu2").children().css({
                    "background-color" : "#ddd",
                    "color" : "gray"
                })
                $(this).css({
                    "border-bottom" : "2px solid rgb(214, 179, 114);",
                    "color": "orange"
                })
                $(this).children().css({
                    "background-color" : "rgb(214, 179, 114);",
                    "color" : "white"
                })


                $(".tabFAQ").css("display","none");
                $('#'+$(this).attr("data-tab")).css("display","block");

            });
            

        // 개시물 개수 넣기
        var n = 0;
        var m = 0;

        for(var i=11; i<30; i++){

            n++;

        $("#badge"+n).html($('#tab' + i + ' h3').length);

            m++;

        };

        // 아코디언
		$(".a1").accordion({
			collapsible: true,
	        active: false,
			heightStyle: "content"
        });

        // 문의하기 링크
        $("#qLink").click(function() {
            $(location).attr('href','/AtTicketProject/userqna.do');
        });
        
        //로그인 java 로 이동
        $("#login").click(function() {
            location.href = "/AtTicketProject/userlogin.do";
        });
        
        //로그아웃 java 로 이동
        $("#logout").click(function() {
            location.href = "/AtTicketProject/userlogout.do";            
        //로그인 java 로 이동
        });

    </script>






</body>
</html>