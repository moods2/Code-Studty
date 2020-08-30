<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet"/>
	<link rel="stylesheet" href="css/jquery-ui.css">
    <script src="js/jquery-1.12.4.js"></script>
   	<script src="js/jquery-ui.js"></script>
   	<script src = "js/bootstrap.js"></script>
	
   <style>
                            	 	
/*                             			.btncoupon {
                            			border: 1px solid white; 
                            			background-color: #7E9CB6; 
                            			color: white; 
                            			padding: 5px;
                            			
                            			} */
                            		

        body {
            margin: 0px;
            padding: 0px;
        }

        * {
            outline: none;
        }

        #mainBox {
            /* border: 1px solid black; */
            width: 970px;
            height: 650px;
        }

        #tabs {
            padding: 0px;
            width: 710px;
        }

        #tabs ul {
            padding-left: 110px;
            height: 50px;
        }

        #tabs ul li {
            width: 115.5px;
            font-size: 16px;
        }

        #tabs ul li span {
            font-size: 12px;
            display: block;
            color: rgb(197, 194, 194);
        }


        .ui-widget.ui-widget-content {
            border: 0px;
        }

        .ui-corner-all {
            border-bottom-right-radius: 0px;
            border-bottom-left-radius: 6px;
        }

        .ui-widget-content {
            background: white url();
        }

        .ui-tabs .ui-tabs-nav {
            padding-top: 13px;
        }

        /* 해더 전체 */
        .ui-widget-header {
            border: 0px;
            background: rgb(61, 61, 61);
            border-radius: 0px;
        }

        /* 탭안 */
        .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
            border: 0px;
            background: none;
        }

        /* 디폴트 해더 글자색 */
        .ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited {
            color: white;
            height: 31px;
        }

        /* 탭 안쪽 패딩 */
        .ui-tabs .ui-tabs-panel {
            padding: 15px;
        }

        /* 선택 */
        #tabs .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active{
            border-left: 0px;
            background-color: rgb(255, 109, 109);
            color: black;
        }

        #titleImg {
            float: left;
            width: 85px;
            height: 50px;
            padding-left: 10px;
            padding-top: 8px;
        }

        #step1 .ui-widget-header {
            background-color: white;
        }

        .ui-state-default {
            background-color: gray;
        }

        .ui-state-default, .ui-widget-content .ui-state-default {
            color: black;
        }

        .ui-state-default, .ui-widget-content .ui-state-default {
            background-color: gray;
        }

        /* 테이블 */
        #tbl1 {
            /* border: 1px solid cornflowerblue; */
            border-collapse: collapse;
            width: 680px;
            color: #424242;
        }
        #tbl1 td, #tbl1 th {
            border: 1px solid #7E9CB6;
        }

        #tbl1 th {
            text-align: center;
            font-size: 16px;
            padding: 5px 0px;
            background-color: #7E9CB6;
            color: white;
        }
        #tbl1 td:first-child {
            width: 240px;
        }

        #tbl1 td:last-child {
            width: 400px;
        }

        /* 달력 */
        #celender {
            width: 220px;
            margin-left: 10px;
        }

        .ui-widget-content {
            background: white url();
        }

        .ui-datepicker-inline {
            width: 225px;
            height: 300px;
            margin-top: 20px;
        }
        .ui-datepicker-calendar {
            height: 260px;
        }

         .ui-state-active {
            color: black;
         }

        #celender td, #celender th {
            border: none;
            background-color: white;
            color: black;
        }

        #celender td:first-child{
            width: 30px;
        }
        #celender td:last-child{
            width: 30px;
        }

        /* 회차선택 */
        #tbl1 td {
            font-size: 14px;
        }

        #tbl1 dt {
            font-weight: bold;
        }

        #tbl1 dl {
            margin-left: 20px;
        }

        #choicDate {
            margin-top: 40px;
        }

        #choicDate dt {
            padding-top: 4px;
        }

         /* 선택날짜 */
        #choicDate dt, #choicDate dd {
            float: left;
        }

        #choicDate dd{
            background-color: #eee;
            width: 200px;
            height: 24px;
            padding-left: 20px;
            padding-top: 5px;
            margin-left: 20px;
        }

        #choicDate .alternate {
            border: none;
            background-color: #eee;
            color: #FF6D6D;
        }

        .choicNum {
            float: left;
        }

        .choicNum:nth-child(2) {
            width: 150px;
        }
        .choicNum:nth-child(3){
            width: 210px;
        }

        .choicNum dd{
            margin-left: 2px;
            border: 1px solid gray;
            height: 170px;
            font-size: 12px;
        }

        #tabs .choicNum ul {
            padding-left: 7px;

        }

        #tabs .choicNum ul li {
            background-color: #eee;
            font-size: 12px;
            list-style: none;
            padding: 5px;
        }


        #choicNum ul li {
            width: 120px;
            height: 16px;
            text-align: center;
            margin-bottom: 5px;
        }

        #tabs #choicegrde li {
            width: 180px;
            height: 30px;
        }

        /* 좌석선택 버튼1 */
        #tbl1 input[type=button] {
            float: right;
            margin-right: 20px;
            margin-top: 10px;
            margin-bottom: 20px;
            width: 90px;
            height: 35px;
            border: none;
            background-color: #FF6D6D;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        #celenderInfo div {
            float: left;
            width: 10px;
            height: 10px;
            background-color: #FF6D6D;
            position: relative;
            left: 30px;
            top: 4px;
            margin-bottom: 30px;
        }

        #celenderInfo div:nth-child(3){
            position: relative;
            left: 130px;
        }

        #celenderInfo div:first-child{
            background-color: gray;
        }

        #celenderInfo span{
            /* display: block; */
            /* background-color: black; */
            margin-left: 25px;
            font-size: 13px;
        }
        
        /* 유의사항 */
        #tbl2 {
            border: 1px solid #7E9CB6;
            border-collapse: collapse;
            font-size: 12px;
            color: rgb(66, 66, 66);
            width: 680px;
            margin-top: 8px;
            margin-bottom: 0px;
            height: 168px;
        }

        #tbl2 td:first-child {
            background-color: gray;
            color: white;
            font-weight: bold;
            width: 21px;
            font-size: 14px;
            padding-left: 6px;
        }
        #tbl2 td:last-child {
            padding-left: 15px;
        }

        #tbl2 ul{
            padding-left: 15px;
            list-style: square;
            margin-top: -75px;
        }

        #tbl2 ul li {
            font-size: 13px;
            width: 100%;
        }

        /* 사이드 */
         #side {
             width: 260px;
             height: 640px;
             background-color: rgb(61, 61, 61);
             position: absolute;
             top: 0px;
             left: 710px;
             padding: 15px;
         }

         #cosertInfo {
             padding-bottom: 10px;
         }

         /* 이미지 */
         #cosertInfo img {
             width: 70px;
             margin-top: 10px;
         }

         /* 사이드 정보 */
         #InforContent {
             float: right;
             width: 180px;
         }

         #InforContent::after{
             display: block;
             content: "";
             clear: both;
         }

         #InforContent h2 {
             font-size: 14px;
             height: 38px;
             overflow: hidden; text-overflow: ellipsis;
             color: white;
         }
         #InforContent div {
             font-size: 12px;
             color: rgb(146, 146, 146);
         }

         #side h2{
             font-size: 14px;
             color: white;
         }

         #side dl {
             font-size: 12px;
             color: white;
         }

         #side dt {
             color: rgb(146, 146, 146);
             float: left
         }

         #side dd {
             float: right;
         }

         #side #choicInfo dd {
             float: left;
             margin-left: 20px;
         }
         #side #choicInfo input {
             border: none;
             background-color: #3D3D3D;
             color: white;
         }


         #sitFinul {
             width: 230px;
             height: 60px;
             /* border: 1px solid white; */
             overflow: scroll;
             scrollbar-width: none;
             -ms-overflow-style: none;
         }
         #sitFinul::-webkit-scrollbar { display: none; }


         #side #choicInfo {
             /* padding-bottom: 50px; */
         }

         #side #payment dt:nth-child(10){
             color: #7E9CB6;
         }
         #side #sale dt:nth-child(13){
             color: #7E9CB6;
         }

         #side #finalPay {
             border: 1px solid black;
             padding: 10px;
             padding-top: 0px;
             margin: 20px 0px;
         }

         #side #finalPay dl dt{
             color: white;
             font-size: 15px;
         }
         #finull {
            font-size: 15px;
         }


         #side > div {
             border-bottom: 1px solid black;
             /* padding-bottom: 10px; */
         }

         #nextBtn {
             width: 100%;
             height: 40px;
             border: none;
             background-color: #7E9CB6;
             color: white;
             float: right;
             position: relative;
             top: -40px;
             cursor: pointer;
         }

         #back {
             width: 48%;
             height: 40px;
             border: none;
             background-color: #eee;
             float: left;
             color: gray;
             cursor: pointer;
         }

         /* 2번째 사이드 */
         
         #side2 {
            width: 260px;
            height: 560px;
            background-color: rgb(61, 61, 61);
            position: absolute;
            top: 0px;
            left: 710px;
            padding: 15px;
            display: none;
            color: white;
         }

         #side2::after{
             display: block;
             content: "";
             clear: both;
         }

         #side2 h2{
             font-size: 14px;
             color: #929292;
             text-align: left;
             background-color: #3D3D3D;
         }

         #miniMap {
             text-align: center;
             margin-top: 15px;
             margin-bottom: 30px;
         }

         #miniMap span{
             display: block;
            font-size: 12px;
            height: 20px;
            /* color: white; */
            background-color: #FF6D6D;
            padding-left: 10px;
            padding-top: 5px;
         }

         #miniMapImg {
             width: 130px;
             margin-top: 10px;
             cursor: pointer;
         }
         #miniMap div {
             background-color: white;
         }

         #tabs #side2 ul {
             border: 1px solid #929292;
             height: 100px;
             font-size: 10px;
             padding-left: 30px;
             padding-top: 10px;
         }
         #tabs #side2 li {
             font-size: 12px;
         }
         #tabs #sitPrice li:first-child {
             list-style: url(./images/ic_purple.gif);
         }
         #tabs #sitPrice li:last-child {
             list-style: url(./images/ic_blue.gif);
         }

         #tabs #choiceSit ul {
             overflow: scroll;
             scrollbar-width: none;
             -ms-overflow-style: none;
         }
         #tabs #choiceSit ul::-webkit-scrollbar { display: none; }

         #tabs #choiceSit li {
             list-style: none;
         }

         #side2 input[type=button] {
             border: none;
             height: 25px;
             font-size: 13px;
             margin-top: 10px;
             background-color: #929292;
             color: white;
         }

         #back2 {
            width: 100px;
            cursor: pointer;
         }
         #reChoice {
            width: 154px;
            cursor: pointer;
         }

         /* #back {
             width: ;
         } */

         #container {
            width: 678px; height: 585px; background-image: url("http://tkfile.yes24.com/upload2/hallimg/9000/9143/9143b_0_0.jpg"); background-repeat: no-repeat; background-position: 0px 3px;
            /* display: none; */
         }

         #divContainer {
            width: 678px; height: 585px; background-image: url("http://tkfile.yes24.com/upload2/hallimg/9000/9143/9143b_1_9128b_1_8758b_1_190328155440.jpg"); background-repeat: no-repeat; background-position: 0px 150px;
            display: none;
         }

         /* 파란좌석 */
         .s6 {
            position: absolute;
            background: url(http://tkfile.yes24.com/images/ticket_new/ic_seat6.gif) no-repeat;
            height: 12px;
            width: 11px;
            z-index: 10;
         }
         /* 보라좌석 */
         .s8 {
            position: absolute;
            background: url(http://tkfile.yes24.com/images/ticket_new/ic_seat8.gif) no-repeat;
            height: 12px;
            width: 11px;
            z-index: 10;
         }

         /* 클릭좌석 */
         .son {
            position: absolute;
            background: url(http://tkfile.yes24.com/images/ticket_new/ic_seat_on.gif) no-repeat;
            height: 12px;
            width: 11px;
            z-index: 10;
         }


         /* 회색좌석 */
         .s13 {
            position: absolute;
            background: url(http://tkfile.yes24.com/images/ticket_new/ic_seat13.gif) no-repeat;
            height: 12px;
            width: 11px;
            z-index: 10;
            /* disabled : true; */
           	
         }

         /* stap3 */
         #step3 {
             text-align: center;
         }

         #step3 h2 {
            width: 97%;
            font-size: 15px;
            background-color: #7E9CB6;
            height: 20px;
            color: white;
            padding: 5px 10px;
            text-align: left;
         }

         #seleChoice  div{
            font-size: 13px;
            font-weight: bold;
            padding-left: 20px;
         }

         #seleChoice label {
             font-weight: normal;
             width: 550px;
             height: 25px;
             background-color: rgb(255, 233, 230);
             display: block;
             float: right;
             margin-right: 30px;
             padding-top: 5px;
             text-align: left;
         }

         #seleChoice div::after {
             display: block;
             content: "";
             clear: both;
         }

         #step3 table {
             border-collapse: collapse;
             width: 650px;
             height: 200px;
             text-align: center;
             font-size: 13px;
             color: gray;
             margin-left: 15px;
             margin-top: 10px;
         }

         #step3 table th {
             background-color: #eee;
             height: 15px;
         }

         #step3 table td{
             border-bottom: 1px solid gray;
             height: 15px;
         }
         
         #cuponPlus {
             border: none;
             background-color: #7E9CB6;
             width: 80px;
             font-size: 13px;
             color: white;
             margin-bottom: 5px;
             margin-right: 10px;
             float: right;
         }

         #cuponPlus::after {
             display: block;
             content: "";
             clear: both;
         }

         #getChoice {
             padding: 0px 20px;
         }

         #tabs #getChoice div{
            /* font-size: 12px; */
            font-weight: bold;
            padding-left: 20px;
            margin-bottom: 10px;
         }

         #tabs #getChoice label {
             font-weight: normal;
             width: 500px;
             height: 25px;
             background-color: rgb(255, 233, 230);
             display: block;
             float: right;
             margin-right: 30px;
             padding-top: 5px;
             text-align: left;
         }

         #tabs #getChoice div::after {
             display: block;
             content: "";
             clear: both;
         }

         .ui-widget {
            font-size: 14px;
         }


         #myInfo {
             margin-top: 50px;
             padding: 0px 20px;
         }
         #myInfo dl {
             border-top: 1px solid gray;
             margin-top: 3px;
             padding-top: 15px;
         }

         #myInfo dt, #myInfo dd {
             float: left;
             margin-top: 10px;
         }

         #myInfo dt {
             width: 80px;
         }

         #myInfo input {
             width: 130px;
             height: 20px;
             background-color: white;
             border: 1px solid #eee;
         }

         #myInfo dd:nth-child(5) input{
             width: 80px;
         }


         /* 주의사항 */
         #getRed {
             border: 1px solid #eee;
             background-color: #eee;
             padding: 10px;
             height: 150px;
             margin-top: 120px;
         }
         #getRed ul{
             padding-left:20px;
             list-style: decimal;
         }

         #getRed ul li {
            font-size: 12px;
             width: 100%;
         }

         #step4 h2 {
            width: 97%;
            font-size: 15px;
            background-color: #7E9CB6;
            height: 20px;
            color: white;
            padding: 5px 10px;
            text-align: left;
            margin-bottom: 30px;
         }

         #step4 span{
             font-weight: bold;
             font-size: 15px;
         }

         #dialog1 {
            text-align: center;
         }

         .ui-widget-overlay{
             background: gray;
         }


         .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
             color: black;
         }

         .pay {
            font-size: 12px;
            /* border: 1px solid black; */
            width: 680px;
        }
        #payment1 > h4 {
            /* 백그라운드 */
            background-color: #7E9CB6;
            width: 97%;
            height: 20px;
            color:white;
            padding: 5px 10px;
        }
        .pay > span {
            font-weight: bold;
            color: rgba(4, 4, 73, 0.596);
        }
        .pay > input[type="text"] {
            border: 1px solid gray;
        }
        #ptbl {
            border-top: 1px solid gray;
            border-bottom: 1px solid gray;
            border-left: 0px;
            border-right: 0px;

            border-collapse: collapse;
            width: 680px;
        }
        #ptbl th {
            /* border: 1px solid gray; */
            background-color: #ccc;
            height: 20px;
        }
        #ptbl td:nth-child(3){
            border-bottom: 1px solid gray;
            border-left: 1px solid gray;
        }
        #ptbl tr {
            border-bottom: 1px solid gray;
        }
        #ptbl th:nth-child(1), #ptbl td:nth-child(1) {
            width: 200px;
            text-align: center;
        }
        #ptbl th:nth-child(2), #ptbl td:nth-child(2) {
            width: 230px;
            text-align: center;
        }
        #ptbl th:last-child {
            width: 200px;
        }
        #ptbl td > span {
            color: red;
        }

        #payshut {
            font-weight: bold;
            background-color: rgb(235, 230, 230);
            width: 280px;
            font-size: 12px;
            padding: 0px 5px;
            margin: 10px 0px;
            color: #555;
            border: 1px solid #ccc;
            border-radius: 2px;
        }
        #payshut > span { color: red; }
        .pspan { font-weight: bold; }
        #eggpt { margin-left: 50px;}
        #freesp { margin-left: 40px; }
        #cbegg { margin-left: 10px; }
        #pbtn { 
            color: tomato; background-color: rgb(240, 237, 237); 
            outline: none; 
            border: 1px solid #ccc; 
            border-radius: 3px;
            cursor: pointer;
        }
        #egg {
            margin-bottom: 10px;
        }
        #freeticket {
            border-bottom: 2px dotted #ccc;
            margin-bottom: 10px;
            padding-bottom: 10px;
        }

        #choicepay {
            border-bottom: 2px dotted #ccc;
            margin-bottom: 10px;
            padding-bottom: 10px;
        }
        #rb1 {
            margin-left: 20px;
        }
        
        #paycheck {
            position: relative;
            top: 155px;
            text-align: right;
            color: #777;
        }
        
        .pmodal {
            border: 1px solid black;
            width: 450px;
            height: 300px;
        }
        .pmodal div:nth-child(1) {
            width: 400px;
            background-color: rgb(181, 197, 226);
            margin: 5px auto;
            padding: 5px 10px;
        }
        #mtbl {
            width: 420px;
            font-size: 12px;
            margin: 5px auto;
            border-collapse: collapse;
        }
        #mtbl th {
            background-color: rgb(233, 228, 228);
            color: #555;
            font-weight: normal;
        }
        #mtbl td {
            text-align: center;
            padding: 5px;
        }
        #mtbl td:last-child {
            border-bottom: 1px solid #ccc;
        }

        .ui-dialog-titlebar {
            background-color: cornflowerblue;
        }
        .ui-dialog-title { color: white; font-size: 12px;}
        .ui-button{
            width: 50px;
            height: 30px;
        }
        .ui-widget .ui-widget { font-size: 12px; }


    </style>

</head>
<body>
	
	    <div id="mainBox">

        <div id="tabs">
            <!-- 로고 -->
            <img src="./images/title.png" id="titleImg">
            <!-- 탭메뉴 -->
            <ul id="tabMenu">
              <li><a href="#step1"><span>step1</span>관람일/회차</a></li>
              <li><a href="#step2"><span>step2</span>좌석선택</a></li>
              <li><a href="#step3"><span>step3</span>할인/쿠폰</a></li>
              <li><a href="#step4"><span>step4</span>수령방법</a></li>
              <li><a href="#step5"><span>step5</span>결제방법</a></li>
            </ul>
            <div style="clear:both;"></div>
            <!-- 사이드 -->
            <div id="side">
                <div id="cosertInfo">
                    <img src="./images/${dto.poster}" id = "chcheckBtn">
                    <!-- 여기서 해당 공연에 대한 사진등 정보를 바꿔줄 것이다. -->
                    <div id="InforContent">
                        <h2>${dto.title}</h2>
                        <div>${dto.startDate} ~ ${dto.endDate}</div>
                        <div>${splaceName}</div>
                    </div>
                </div>
                
            <script>
            	
            $("#chcheckBtn").click(function(){
            	alert(seatResult[0].usedSeq);
            });
            
            </script>
                <div id="choicInfo">
                    <h2>선택내역</h2>
                    <dl>
                        <dt>날짜</dt>
                            <dd><input type="text" class="alternate" size="30" id = "inputDate"></dd>
                        <div style="clear: both;"></div>
                        <dt>시간</dt>
                        <dd id="ticketTime"></dd>
                        <div style="clear: both;"></div>
                        <dt>매수</dt>
                        <dd id="ticketNum"></dd>
                        <div style="clear: both;"></div>
                        <dt>좌석</dt>
                        <!-- <dd>1</dd> -->
                        <div id="sitFinul"></div>
                        <div style="clear: both;"></div>
                    </dl>
                </div>
                <div id="payment1">
                    <h2>결제내역</h2>
                    <dl>
                        <dt>티켓금액(￦)</dt>
                        <dd id="tickectPice"></dd>
                        <div style="clear: both;"></div>
                        <dt>예매수수료(￦)</dt>
                        <dd id="susu"></dd>
                        <div style="clear: both;"></div>
                        <dt>배송료(￦)</dt>
                        <dd></dd>
                        <div style="clear: both;"></div>
                        <dt>총 금액(+)</dt>
                        <dd id="totalPrice"></dd>
                        <div style="clear: both;"></div>
                    </dl>
                </div>
                <div id="sale">
                    <dl>
                        <dt>할인금액(￦)</dt>
                            <dd id = "discountPrice">0</dd>
                        <div style="clear: both;"></div>
                        <dt>할인쿠폰</dt>
                        <dd>0</dd> 
                        <div style="clear: both;"></div>
                        <dt>Egg머니</dt>
                        <dd>0</dd>
                       <div style="clear: both;"></div>
                        <dt>Egg상품권</dt>
                        <dd>0</dd>
                        <div style="clear: both;"></div>
                        <dt>총 할인금액(-)</dt>
                        <dd id = "discountTotalPrice">0</dd>
                        <div style="clear: both;"></div>
                    </dl>
                </div>
                <div id="finalPay">
                    <dl>
                        <dt>최종 결제금액(￦)</dt>
                        <dd id="finull"></dd>
                    </dl>
                    <div style="clear: both;"></div>
                 </div>
                 <input type="button" value="이전" id="back">
                 <input type="button" value="다음단계" id="nextBtn">
                 
            </div>
            


            <div id="side2">
                <div id="miniMap">
                    <h2>▾ 공연장 미니맵</h2>
                    <span>↱구역 이동은 미니맵을 이용해주세요</span>
                    <div><img src="./images/minimap1.png" id="miniMapImg"></div>
                </div>
                <div id="sitPrice">
                    <h2>▾ 좌석등급/가격</h2>
                    <ul>
                        <li>지정석 77,000원</li>
                        <li>스텐딩석 77,000원</li>
                    </ul>
                </div>
                <div id="choiceSit">
                    <h2>▾ 선택한 좌석</h2>
                    <ul>
                        <!-- <li>지정석 77,000원</li>
                        <li>스텐딩석 77,000원</li> -->
                    </ul>
                </div>
                <input type="button" value="이전화면" id="back2">
                <input type="button" value="↺ 좌석 다시선택" id="reChoice">
            </div>

            <!-- 관람일 -->
            <div id="step1">
                <table id="tbl1">
                    <thead>
                        <th>관람일 선택</th>
                        <th>회차 선택</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div id="celender"></div>
                                <div id="celenderInfo">
                                    <div></div>
                                    <span>예매가능날짜</span>
                                    <div></div>
                                    <span>선택하신 날짜</span>
                                </div>
                            </td>
                            <td>
                                <dl id="choicDate">
                                    <dt>선택날짜</dt>
                                    <!-- <dd>2020. 8. 29</dd> -->
                                    <dd><input type="text" class="alternate"></dd>
                                    <div style="clear: both;"></div>
                                </dl>
                                <dl id="choicNum" class="choicNum">
                                    <dt>회차선택</dt>
                                    <dd>
                                        <!-- <div>[1]회 19시 00분</div> -->
                                        <ul id="inputTime">
                                            <!-- <li id="inputTime">
                                            </li> -->
                                        </ul>
                                    </dd>
                                </dl>
                                <dl id="choicegrde" class="choicNum">
                                    <dt>좌석등급/잔여석</dt>
                                    <dd>
                                        <ul>
                                            <li>
                                                본 공연은 잔여좌석 서비스를 제공하지 않습니다.
                                            </li>
                                        </ul>
                                    </dd>
                                </dl>
                                <div style="clear: both;"></div>
                                <input type="button" value="좌석선택" id="sitBtn">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table id="tbl2">
                
                    <tr>
                        <td>유의사항</td>
                        <td>
                            <ul>
                                <li>안내되어 있는 잔여석은 결제 진행 중인 좌석을 포함하고 있어 예매 가능 좌석과 다를 수 있습니다.</li>
                                <li>할인은 자동선택 되지 않으니, 적용 받고자 하는 할인이 있는 경우 직접 선택해주시기 바랍니다.</li>
                                <li>장애인, 국가유공자, 학생 할인 등 증빙서류가 필요한 경우 현장수령만 가능하며, 현장에서 증빙서류 미지참 시 차액 지불하셔야 합니다.</li>
                                <li>관람 당일 공연 예매 시에는 변경/취소/환불이 불가합니다. - 경우에 따라 ATM 기기에서 가상계좌 입금이 안 될 수 있으니 가급적 인터넷/폰뱅킹 등을 이용해주시기 바랍니다.</li>
                                <li>예매 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</li>
                                <li>예매 취소 시점에 따라 취소수수료가 부과될 수 있습니다. 예매 후 취소마감시간과 함께 취소수수료를 꼭 확인해주시기 바랍니다.</li>
                            </ul>
                        </td>
                    </tr>
                </table>

            </div>
            <div id="step2">
                <div id="container" class="raffer"></div>
                <div id="divContainer" class="raffer"></div>
            </div>
            <div id="step3">
                <div id="seleChoice">                
                    <h2>할인선택</h2>
                    <div>
                        등급선택
                        <label for="standing"><input type="radio" value="스텐딩석" name="standing" checked>스텐딩석</label>
                    </div>
                    <table>
                        <thead>
                            <th>할인명</th>
                            <th>할인금액</th>
                            <th>매수</th>
                            <th>설명</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">할인항목이 없습니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="cuponChoice">                
                    <h2>쿠폰선택</h2>
                    <!-- <input type="button" value="쿠폰등록" id="cuponPlus"> -->
                    <table>
                        <thead>
                            <th>쿠폰명</th>
                            <th>만료일</th>
                            <th>할인금액</th>
                            <th>사용</th>
                        </thead>
                        <tbody>
                        	<!-- 여기에 쿠폰을 불러오면 된다. -->
							   <c:if test = "${empty hasCouponList}">
                            		<tr>
                            			<td colspan="4">보유하신 쿠폰이 없습니다.</td>
                            		</tr>
                            	</c:if>
                            	<c:if test = "${not empty hasCouponList}">
                            		
                            		<c:forEach items="${hasCouponList}" var="dto">
                            		<tr id = "cou" + "${dto.seq}">
                            			<td>${dto.title}</td>
                            			<td>${dto.endDate}</td>
                            			<td>${dto.discount}</td>
                            			<td><button  id = "${dto.seq}" type= "button" class="btncoupon" value="${dto.discount}">사용</button></td>
                            		</tr>
                            		</c:forEach>
                            	</c:if>
                            	 
                        </tbody>
                    </table>
                </div>
            </div>
            
            <script>
            	
            	var couponUserSeq;//쿠회번호
            	//여기서 정산 처리를 해줄것이다.
            	//쿠폰사용 선택했을 경우
            	$(".btncoupon").click(function(){
            		
            		couponUserSeq = $(this).attr("id");	
            		//alert(couponUserSeq);
            		
            		$("#finull").text($("#totalPrice").text());	
            		$("#discountPrice").text($(this).val());
            		$("#discountTotalPrice").text($(this).val());
            		$("#finull").text(parseInt($("#finull").text()) - parseInt($(this).val()));
            	});
            	
            </script>
            
            
            
            <div id="step4">
                <h2>수령방법</h2>
                <div id="getChoice">
                    <span>수령방법선택</span>
                    <label for="tGet"><input type="radio" value="현장수령" name="tGet" checked>현장수령[배송불가 할인 포함]</label>
                </div>
                <div id="myInfo">
                    <span>주문자 확인</span>
                    <div>
                        <dl>
                            <dt>이름</dt>
                            <dd><input type="text" value="${username}" disabled></dd>
                            <div style="clear: both;"></div>
                            <dt>긴급연락처</dt>
                            <dd>
                                <input type="text" value="${userTelNum[0]}"> - 
                                <input type="text" value="${userTelNum[1]}"> - 
                                <input type="text" value="${userTelNum[2]}">
                            </dd>
                            <div style="clear: both;"></div>
                            <dt>e-mail</dt>
                            <dd>
                                <input type="text" value="${userEmail[0]}"> @ 
                                <input type="text" value="${userEmail[1]}">
                            </dd>
                            <div style="clear: both;"></div>
                        </dl>

                        <div id="getRed">
                        <span>주의사항</span> * 부정확한 정보 입력으로 인한 문제 발생 시 At-Ticteck은 책임을 지지 않습니다.
                        <ul>
                            <li>배송 선택 시 티켓 수령자의 배송지 정보를 정확히 입력해주시기 바랍니다.</li>
                            <li>티켓은 유가증권으로 본인에게 직접 전달해야하며, 분실된 티켓은 재발권 되지 않습니다.</li>
                            <li>일괄배송의 경우 정해진 날짜에 티켓 배송이 시작되며, 주소 수정은 일괄배송일 2일 전까지 가능합니다.</li>
                            <li>예매 티켓 배송은 예매완료일, 혹은 일괄배송일로부터 4~5일(영업일 기준) 이내 수령 가능합니다.</li>
                            <li>긴급연락처는 공연 취소와 같은 유사 시 안내 받으실 연락처이므로 정확히 입력해주시기 바랍니다.</li>
                            <li>이메일 정보 미 입력 시 예매 관련 안내 메일을 받을 수 없으니 이메일 받기를 원하시는 경우 마이페이지에서
                                회원정보를 수정해주시기 바랍니다.</li>
                        </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div id="step5">
              
                <!-- 모달팝업1 -->
                <div id="addticket" class="pmodal">
                    <div>
                        <span style="font-weight: bold; font-size: 13px; margin-right: 20px;">예매권번호 등록</span>
                        <input type="text" style="height:14px; width: 160px;">
                        <input type="button" id="mbtnAdd" value="등록" style="font-size: 12px; color: white; background-color: cornflowerblue; outline: none; border: 1px solid #999; border-radius: 2px;">
                    </div>
                    <table id="mtbl">
                        <tbody>
                            <tr>
                                <th>예매권명</th>
                                <th>금액</th>
                                <th>사용기간</th>
                                <th>사용</th>
                            </tr>
                            <tr>
                                <td colspan="4">사용 가능한 예매권 목록이 없습니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				
				<style>
					#eggUseBtn {

						    color: tomato; 
						    background-color: rgb(240, 237, 237); 
				            outline: none; 
				            border: 1px solid #ccc; 
				            border-radius: 3px;
					}
					
					#eggUseBtn:hover {
						cursor : pointer; 
					}
				
				</style>

                <div id="payment1">
                    <h4>결제방법</h4>

                    <div id="egg" class="pay">
                        <label for "eggpt">에그머니 </label><input type="text" id="eggpt" value="0" Style="width: 100px;">원<input type="checkbox" id="cbegg"><label for="cbegg">전액사용 (총 <span class="pspan" id = "myeggmoney">${userEggMoney}</span>원)</label>
                    	<button id = "eggUseBtn">에그머니 적용</button>
                    
                    </div>
                    
                    <script>
                    
                    	//$("#finull").text(parseInt($("#finull").text()) - parseInt($(this).val()));
                    	var eggCheck = 0;
                    	//에그 머니 적용하면 더 빼져야한다.
                    	//에그머니 적용하는경우
                    	//1. 내가 가지고 있는 에그머니보다 더 사용할 수 없게 만들어줘야한다.
                    	//2. 값을 잘 빼야하고
                    	//3. 숫자만 입력받아야 한다.
                    	//아 왜 안되는걸까 고민을 해봐라 젭라...;ㅣㅣ
                    	var pricetxt = document.getElementById("eggpt");
                    	var pf = 0;
                    	$("#eggUseBtn").click(function(){
                    		pf = 0;
                    		//3. 숫자만 입력받아야 한다.
			        		for (var i = 0; i < pricetxt.value.length; i++) {
			        			
			        			var price = pricetxt.value.charAt(i);
			        			
			        			if (price < "0" || price > "9") {
			        				alert("할인금액은 숫자로만 입력이 가능합니다.")
			        				pricetxt.select();
			        				pf++;
			        				return;
			        			}
			        		} 
                    		
                    		//순수 숫자로만 적었을 경우에 적용.
                    		if (pf == 0) {
        		        		//1.내가 가지고 있는 에그머니보다 더 사용할 수 없게 만들어줘야한다.
                        		if ($("#eggpt").val() > ${userEggMoney}) {
                        			alert("보유하신 에그머니보다 많은 포인트를 사용할 수 없습니다.");
                        		} else {
                            		if (eggCheck % 2 == 0) {
                            			//에그머니 적용하는 경우
                                		$("#discountTotalPrice").text(parseInt($("#discountTotalPrice").text()) + parseInt($("#eggpt").val()));//총 할인액
                                		$("#finull").text(parseInt($("#finull").text()) - parseInt($("#eggpt").val()));//결국 총 가격
                                		eggCheck++;
                                		$("#eggUseBtn").text("에그머니 적용 취소");
                            		} else {
                            			//에그머니 다시 한번 누르는 경우
                            			$("#discountTotalPrice").text(parseInt($("#discountTotalPrice").text()) - parseInt($("#eggpt").val()));//총 할인액
                            			$("#finull").text(parseInt($("#finull").text()) + parseInt($("#eggpt").val()));//결국 총 가격
                            			eggCheck++;
                            			$("#eggUseBtn").text("에그머니 적용");
                            		}
                        		}                    			
                    		}
                    		
	
 
                    	});
                    	
                    	$("#cbegg").click(function(){
                    		if ($(this).is(":checked")) {
                    			$("#eggpt").val("${userEggMoney}");	
                    		} else {
                    			$("#eggpt").val("0")
                    		}
                    	});
                    
                    </script>
                    
                    <div id="freeticket" class="pay">
                        <label>공연예매권 <span id="freesp">사용가능 예매권 [총 <span class="pspan">0</span>장]</label> <input type="button" value="예매권 번호 등록/사용하기" id="pbtn"></span>
                    </div>
                    <div id="choicepay" class="pay">
                        <label for "prd">결제 방법 선택</label>
                        <input type="radio" id="rb1" class="rb" name="rb">
                        <label for="rb1">신용카드</label>
                        <input type="radio" id="rb2" class="rb" name="rb">
                        <label for="rb2">무통장 입금</label>

                        <select id="banksel" disabled value="입금 은행 선택">
                            <option>국민은행</option>
                            <option>신한은행</option>
                            <option>기업은행</option>
                            <option>하나은행</option>
                            <option>농협은행</option>
                            <option>신한은행</option>
                        </select>
                    </div>

                    <div id="payshut">
                        취소 가능 마감 시간 : <span>2020년 09월 11일 17:00까지</span>
                    </div>
                    <div id="payinfo" class="pay">
                        <table id="ptbl">
                            <tr>
                                <th>내용</th>
                                <th>취소수수료</th>
                                <th>비고</th>
                            </tr>
                            <tr>
                                <td>예매 후 7일 이내</td>
                                <td>없음</td>
                                <td rowspan="5">
                                    <p>- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지만 환불됩니다.</p>
                                    <p>- 예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.</p>
                                    <p>- 관람 당일 취소 가능 상품의 경우 관람 당일 취소 시 티켓금액의 90%가 취소수수수료로 부과됩니다.</p>
                                    </td>
                            </tr>
                            <tr>
                                <td>예매 후 8일 ~ 관람일 10일 전까지</td>
                                <td>뮤지컬, 콘서트, 클래식 등: <span>장당 4,000원</span> / 연극, 전시 등: <span>장당 2,000원</span><br>(단,티켓 금액의 10% 이내)</td>
                            </tr>
                            <tr>
                                <td>관람일 9일 전 ~ 관람일 7일 전까지</td>
                                <td>티켓 금액의 <span>10%</span></td>
                            </tr>
                            <tr>
                                <td>관람일 6일 전 ~ 관람일 3일 전까지</td>
                                <td>티켓 금액의 <span>20%</span></td>
                            </tr>
                            <tr>
                                <td>관람일 2일 전 ~ 관람일 1일 전까지</td>
                                <td>티켓 금액의 <span>30%</span></td>
                            </tr>
                        </table>
                    </div>

                    <div id="paycheck" class="pay">
                        <input type="checkbox" id="pcb1"><label for="pcb1">취소수수료 및 취소기한을 확인하였으며, 동의합니다.</label>
                        <input type="checkbox" id="pcb2"><label for="pcb2">제 3자 정보제공 내용에 동의합니다. </label>
                        <span id="pdetail">[상세보기]</span>
                    </div>
                    
                    

                </div>
            </div>
          </div>
          <div id="dialog1">
            <h1>결제가 완료되었습니다</h1>
            <span>예매확인페이지로 이동하시겠습니까?</span>
            <!-- <button>버튼</button> -->
        </div>
    </div>
	
	<style>
		.timeRound:hover {
			cursor : pointer;
		}
	
	</style>
	
    <script>

        var tabNum = [1,2,3,4];
        var clickNum = false;
        var ticketNum = false;
        
        var userSeatInfoList = new Array();
        var userNum;
        var resullt;
        // console.log(tabNum);

        $("#tabs").tabs({
            active: 0,
            disabled: tabNum
        });
		
       	
        
        var n = 0;//탭번호

        var tabNumMinus = [];
		
        //여기서도 좌석선택이 가능함
        $("#sitBtn").click(function(){
            if(clickNum == false){
                alert("날짜를 선택해 주세요.");
				event.preventDefault();
            } else {
            	
            	$.ajax({
            		type : "GET",
            		url : "/AtTicketProject/usershowavailseat.do",
            		data : "showseq=${showSeq}&showroundSeq="+showroundSeq + "&conDate="+conDate,
            		async: true,
            		dataType: "json",
            		success : function(result) {
            			
            			
            			seatResult = result;//전역변수에 객체를 모두 넘긴다.
            			
    
			      		
						$(result).each(function(index, item) {

							var floor;
							if (item.usedFloor == 1) {
								floor = "t";
							} else {
								floor = "r";
							}
						
							var code = floor  + item.usedSeatRow + item.usedArea + item.usedSeatCol;
							
							console.log(code);

							$("#" + code).removeClass("s6");
							$("#" + code).addClass("s13");								
							$("#" + code).prop("disabled",true);
	
                    			
							
						});
							
            		},
            		error : function(a,b,c) {
            			console.log(a,b,c);
            		}
            	});//여기까지가 ajax
            	
            	
                tabNumMinus = tabNum.shift(),
                tabNum.push(n),
                n++;
                $("#tabs").tabs({
                    disabled: tabNum,
                    active: n
                });
				
                if(n == 1) {
                    $("#side2").css("display","block")
                }
                if(n != 1) {
                    $("#side1").css("display","block")
                    $("#side2").css("display","none")
                    $("#nextBtn").css({
                        "width": "48%",
                        "top" : "0px"
                    });
                    $("#back").css("display","block")
                }
            }
        });

        $("#dialog1").hide();
		
		var seatResult;
        // 다음단계 -> 클릭이벤트는 여기서 발생한다.
        $("#nextBtn").click(function(){
			
        	//alert($("#inputDate").attr("text"));
        	
            if(clickNum == false){
                alert("날짜를 선택해 주세요.");
				event.preventDefault();
                // n == 0;
                // tabNumMinus = [1,2,3,4];
            } else if(n != 0 && ticketNum  == false){
                alert("좌석을 선택해 주세요");
                event.preventDefault();
            } else {
            	//alert($(".alternate").attr("text"));
            	//진짜 신청 페이지에서 문제없이 다음페이지로 가는 경우!.
            	//여기서 ajax 처리를 해준다.
            	//여기서 해줄 작업은 -> 사용가능한 좌석을 불러올 것이다...!
            	
            	$.ajax({
                		type : "GET",
                		url : "/AtTicketProject/usershowavailseat.do",
                		data : "showseq=${showSeq}&showroundSeq="+showroundSeq + "&conDate="+conDate,
                		async: true,
                		dataType: "json",
                		success : function(result) {
                			
                			
                			seatResult = result;//전역변수에 객체를 모두 넘긴다.
                			
        
				      		
							$(result).each(function(index, item) {
	
								var floor;
								if (item.usedFloor == 1) {
									floor = "t";
								} else {
									floor = "r";
								}
							
								var code = floor  + item.usedSeatRow + item.usedArea + item.usedSeatCol;
								
								console.log(code);

								$("#" + code).removeClass("s6");
								$("#" + code).addClass("s13");								
								$("#" + code).prop("disabled",true);
		
	                    			
								
							});
								
                		},
                		error : function(a,b,c) {
                			console.log(a,b,c);
                		}
                	});//여기까지가 ajax
            	

            	
                tabNumMinus = tabNum.shift(),
                tabNum.push(n),
                n++;
                $("#tabs").tabs({
                    disabled: tabNum,
                    active: n
                });
				//다음버튼
                if(n == 1) {
                    $("#side2").css("display","block")
                }
                if(n != 1) {
                    $("#side1").css("display","block")
                    $("#side2").css("display","none")
                    $("#nextBtn").css({
                        "width": "48%",
                        "top" : "0px"
                    });
                    $("#back").css("display","block")
                }
				
				
                function nextBlock() {
            		$("#tabs").tabs({
                        disabled: [0,1,2,3],
                        active: 4
                    });
                    tabNum = [0,1,2,3];
                    n = 4;
                    $("#side1").css("display","block")
                    $("#side2").css("display","none")
                }
                
                
                var finalPass = 0;
                //결제까지 완료시 창닫기 and 예매완료 페이지 이동
                if(n == 5) {
                	//여기서 결제완료를 해야 하는데 그러려면 여러정보가 필요하다. -> ajax 로 처리를 해주자 : 결제 & 예약 처리 
                	finalPass = 0;//한번 초기화를 해준다.
                	//alert("결제하즈아!");
                	
                	//약관 동의1을 안누른 경우
                	if ($("#pcb1").is(":checked") == false) {
                		alert("취소기한 확인을 동의해주세요.");
                		finalPass++;
                		nextBlock();//블락 처리로 넘어가지 못하게 하자.
                		return;
                	}
                	
                	//약관 동의2를 안누른 경우
                	if ($("#pcb2").is(":checked") == false) {
                		alert("제3자 정보제공 내용에 동의해주세요.");
                		finalPass++;
                		nextBlock();//블락 처리로 넘어가지 못하게 하자.
                		return;
                	}
                	
                	//최종 결제 금액이 0 이 되지 않았는데 결제방법을 선택하지 않은 경우.
                	//rb1,rb2 가 존재함.
                	if ($("#finull").text() == "0") {
                		//결제방식을 선택하지 않아도 된다 -> 넘어가줘도 된다는 말. -> 그럴경우는 거의 없을것이다.
                		
                	} else {
                		//금액이 0 이 되지 않았으므로 결제를 무조건 선택해야한다.
                		
                		if ($("#rb1").is(":checked") == false && $("#rb2").is(":checked") == false) {
                			alert("결제방식을 선택해주세요");
                			finalPass++;
                			nextBlock();//블락 처리로 넘어가지 못하게 하자.
                			return;
                		} 
                		
      
                	}
                	
                	//모든 조건을 만족했을 경우
                	if (finalPass == 0) {
						
                		var inputDate = $("#inputDate").val();
                		var ticketNum = $("#ticketNum").text();

                		var seatAvail = "";//내가 예매할 좌석
                		$(".nodab").each(function (index, item) {
                			seatAvail += $(item).text() + ",";
                		});
                		//var parameter = "eggmoney=" + $("#eggpt").val() + "&showroundSeq=" + showroundSeq + "&couponUserSeq=" + couponUserSeq +"&seatAvail=" + seatAvail;
                		var parameter = "eggmoney=" + $("#eggpt").val() + "&showroundSeq=" + showroundSeq + "&couponUserSeq=" + couponUserSeq +"&seatAvail=" + seatAvail 
                						+ "&inputDate=" + inputDate + "&ticketNum=" + ticketNum;
                		
                    	$.ajax({
                    		type : "POST",
                    		url : "/AtTicketProject/usershowfinal.do",
                    		data : parameter,
                    		async: true,
                    		dataType: "text",
                    		success : function(result) {
                    			
    							
                    		},
                    		error : function(a,b,c) {
                    			console.log(a,b,c);
                    		}
                    		
                    	});//여기까지가 ajax
                    	
                    	                     $("#dialog1").dialog({
                        // title: "인삿말",
                        width: 500,
                        height: 250,
                        draggable: false,
                        resizable: false,
                        modal: true,
                        buttons: {
                            // "text": function(){ alert();}
                            "예" : function() {
                                opener.location.href  = '/AtTicketProject/usermypage.do';
                                window.close();
                            },
                            "아니오" : function(){
                                window.close();
                            }
                        }
                    });

                    $('#dialog1').on('dialogclose', function(event) {
                        $("#tabs").tabs({
                            disabled: [0,1,2,3],
                            active: 4
                        });
                        tabNum = [3,0,1,2];
                        n = 4;
                        $("#side1").css("display","block")
                        $("#side2").css("display","none")
                    }); 	
                		
                	}
                	
                	
                	
                	
                	

                }//n == 5
            }            
        });
        
        //이전화면
        $("#back2").click(function(){
            if(n==1){
                $("#tabs").tabs({
                    disabled: [1,2,3,4],
                    active: 0
                });
            }
            tabNum = [1,2,3,4];
            n = 0;
            $("#side1").css("display","block")
            $("#side2").css("display","none")
        })
        
        //이전화면
        $("#back").click(function(){
            if(n==2){
                $("#tabs").tabs({
                    disabled: [0,2,3,4],
                    active: 1
                });
                tabNum = [2,3,4,0];
                n = 1;
                $("#side1").css("display","block")
                $("#side2").css("display","none")
            }
            if(n==3){
                $("#tabs").tabs({
                    disabled: [0,1,3,4],
                    active: 2
                });
                tabNum = [3,4,0,1];
                n = 2;
                $("#side1").css("display","block")
                $("#side2").css("display","none")
            }
            if(n==4){
                $("#tabs").tabs({
                    disabled: [0,1,2,4],
                    active: 3
                });
                tabNum = [4,0,1,2];
                n = 3;
                $("#side1").css("display","block")
                $("#side2").css("display","none")
            }

            if(n == 1) {
                $("#side2").css("display","block")
                $("#nextBtn").css({
                    "width": "100%",
                    "top" : "0px"
                });
                $("#back").css("display","none")
            }
            if(n != 1) {
                $("#side1").css("display","block")
                $("#side2").css("display","none")
                $("#back").css("display","block")
            }


        })
       	
        var conDate;//몇일공연인지 -> 애도 ajax 로 넘겨줘야 함.
		//달력처리
        // $(function() {
            $( "#celender").datepicker({
                dateFormat: "yy-mm-dd",
	            //minDate : "2020-09-01",
	            //maxDate : "2020-12-12",
                minDate: "${minDateInfo}",
                maxDate: "${dto.endDate}",
                altField: ".alternate",
                altFormat: "yy.mm.dd(D)",
                dayNamesShort: ["일","월","화","수","목","금","토"],
				
                
                // defaultDate: new Date('2020-08-30'),

                // setDate: "2020-08-30",

                onSelect: function(dateText) {  
                	
                	conDate = dateText;
                	//alert(conDate);
                	$("#inputTime").empty();
                	
                	$.ajax({
                		type : "GET",
                		url : "/AtTicketProject/usersemishowreservation.do",
                		data : "showseq=${showSeq}",
                		async: true,
                		dataType: "json",
                		success : function(result) {
                			
							//var list = result;
							
							
							var showRound = 1;
							$(result).each(function(index, item) {
								$("#inputTime").append("<li class = 'timeRound' id ='"+ item.rseq +"'> [" + showRound + "]회 " + item.rstartTime + " ~ " + item.rendTime + "</li>");
								
								showRound++;
								
							});
							//ajax 정보가 유실되므로 ajax 내에서 함수를 부른다.
							testClick();
                		},
                		error : function(a,b,c) {
                			console.log(a,b,c);
                		}
                		
                	});//여기까지가 ajax
                	
                	
                	
/*                     if(dateText == "2020-08-29") {
                        // $("#inputTime").html("[1]회 19시 00분");
                           
                        $("#inputTime" ).empty();
                        $("#inputTime").append("<li>[1]회 19시 00분</li>");
                        $("#inputTime").append("<li>[2]회 20시 00분</li>");
                    }else {
                        $( "#inputTime" ).empty();
                        $("#inputTime").append("<li>[1]회 18시 00분</li>");
                    } */

                    $("#inputTime li").click(function(){
                        $("#inputTime li").css({
                            "background-color":"#eee",
                            "color": "#424242"
                            })
                        // $(this).css("background-color","#FF6D6D");
                        $(this).css({
                            "background-color": "#FF6D6D",
                            "color": "white"
                        });
                        console.log($(this).text());
                        $("#choicInfo dd:nth-child(5)").text($(this).text());
                        clickNum = true;
                    });
                
                }
                  
            });
        // } );
        
        //회차 seq 를  전역변수로 받아준다.
        var showroundSeq = 0;//회자seq.
        
        function testClick() {
        	
        	$(".timeRound").click(function(){
        		
        		
        		$(".timeRound").css("background-color","#FFF");//모든 회차 배경을 하얀색으로 돌리고 밑에서 색을 다시 돌린다.
        		
        		showroundSeq = $(this).attr("id");//전역변수에 회차 seq 넣어줌.
				//alert($(this).attr("id"));//애가 회차 seq 임.
				$(this).css("background-color","#FECA52");
				
	             //$("#clock").css("background-color","#FECA52");
	             //$("#clock").css("border","#FECA52");F
	             //$("#clock").css("color","white");
	             $("#data").css("border","1px solid #eeeeee");
	             $("#sit").css("border","1px solid #FECA52");
	             $("#sittitle").css("border-bottom","2px solid black");
	             $("#sittitle").css("color","black");
	             $("#sitbox").css("border","1px solid black");
	             
	             if($("#sitbox").empty()){
	                 $("#sitbox").append("본 공연은 잔여좌석 서비스를 제공하지 않습니다.")
	             }
	             clickNum = true;
				
			}); 
        }
        
        
        

        //미니맵 옮기기     
        $("#miniMapImg").click(function(){
            // alert($("#miniMapImg").offset().top+","+$("#miniMapImg").offset().left);

            // 1층
            if(event.pageY < 190){
                $("#container").css("display","block")
                $("#divContainer").css("display","none")
                $("#miniMapImg").attr("src","./images/minimap1.png");
            //2층
            }else{
                // alert("아님");
                $("#divContainer").css("display","block")
                $("#container").css("display","none")
                $("#miniMapImg").attr("src","./images/minimap2.png");

            }
            // alert(event.pageY)
        })
        
 // div 만들기 1층
        //행
        var r = 5;
        //열
        var m = 13;
        //왼
        var l = 53;
        //위
        var t = 135;
        // 구역
        var g = "A";
        // 번호
        var gn = 1;
		
        for(r=5; r<45; r++){

            for(m=13; m<68; m++){
				
            	
                $("#container").append('<div class="s6" id="t'+ (r-4) +g + (m-12) +'" style="left:'+l+'px; top:'+t+'px;" name="tk" value="'+ r+'000'+ (m-12) +'" title= "1층 '+g+'구역 '+(r-4)+'행 '+(m-12)+'열" grade="지정석"></div>');
				
                
                //열이동
                if(m == 67){
                    l =53;
                } else{	
                    
                    l = l+11;
                }

                //구역 정하기
                if(m<38){
                    g = "A";
                    gn = m-12;
                }
                if(m>=38){
                    g = "B";
                    gn = m-1;
                }             

                //나머지 지우기
                if(m >=39 && m<43){
                    $("#t"+(r-4)+"B"+(m-12)).css("display","none");
                }
                
                $("#t"+(r-4)+"A"+ 26).css("display","none");
                
                 
            }
                t = t+12;
        }
        
        $("#t1B27").css("display","none");
        


         // div 만들기 2층
        //행
        var R = 5;
        //열
        var M = 13;
        //왼
        var L = 23;
        //위
        var T = 308;
        // 구역
        var G = ""; 
        // 번호
        var GN = 1;

        for(R=5; R<12; R++){

            for(M=13; M<73; M++){

                $("#divContainer").append('<div class="s8" id="r'+ R+'000'+ M +'" style="left:'+L+'px; top:'+T+'px;" name="tt" value="'+ R+'000'+ M +'" title= "2층 '+G+'구역 '+(R-4)+'열 '+GN+'번" grade="지정석"></div>');

                // 열 이동
                if(M == 72){
                    L = 23;
                } else{
                    L = L+11;
                }

                // 구역 정하기
                if(M<26){
                    G = "X";
                    GN = M-12;
                }
                if(M>=28 && M<57){
                    G = "Y";
                    GN = M-27;
                }
                if(M>=57){
                    G = "Z";
                    GN = M-57;
                }

                // 번호

                // 나머지 지우기
                if(M >=27 && M<=28){
                    $("#r"+R+"000"+M+"").css("display","none");
                }
                if(M>=57 && M <=58){
                    $("#r"+R+"000"+M+"").css("display","none");
                }

                if(M>=42 && M <=45){
                    $("#r11000"+M+"").css("display","none");
                }
            }
                T = T+12;
        }
        
        
/*         var code = "t" + seatResult[0].userRow + seatResult[0].usedSeatCol;
        $("#" + code).attr("class",s13);
  		console.log(code); */
        
        //문제가 있다.
/*        	for (var i =0; i <= 21; i++) {
			//t1100026
			//t8A35
			//A 구역일 경우에  -> 행 - 4 ,열 - 12
			//B 구역일 경우에  -> 
			
			
			var floor;
			if (seatResult[i].usedFloor == 1) {
				floor = "t";
			} else {
				floor = "r";
			}
			
			var code = floor + seatResult[i].userRow + seatResult[i].usedSeatCol;
			
      		$("#" + code).attr("class",s13);
      		
    	}  
 */

        //체크표시 2층
        var checkList = [];
        var sitFinul = [];

        $(document).ready(function (){
            // 클릭하면 체크이미지로
            $('div[name=tt]').click(function (){
                s8ClickedEvent($(this));
            });

            //좌석 다시 선택 버튼
            $("#reChoice").click(function(){
                // 좌석 이미지 다 원래대로
                $(".son").attr({
                    'class':'s6'
                });
                //선택한 좌석 li 다 지우기
                $("#choiceSit ul").empty();
                $("#sitFinul").empty();
                $("#ticketNum").text("");
                ticketNum = false;
                $("#tickectPice").text("");
                $("#finull").text("");
                //배열 지우기
                checkList2.length = 0;
                sitFinul2.length = 0;
            });
        });
        

        function s8ClickedEvent(obj) {
            var checked = $(obj).attr('checked');
            
            if(!checked) {
                $(obj).attr('checked', true);


                if($(obj).attr("class") == "s8"){
                // list 추가
                    checkList.push("<li>"+ $(obj).attr("title") +"</li>");
                    sitFinul.push("<dd>"+ $(obj).attr("title") +"</dd>");

                    //li초기화
                    $("#choiceSit ul").empty();
                    $("#sitFinul").empty();
                    $("#ticketNum").text("");
                    // ticketNum = false;
                    $("#tickectPice").text("");
                    $("#totalPrice").text("");
                    $("#finull").text("");
                    //list값 ul에 li로 추가
                    $("#choiceSit ul").append(checkList);
                    $("#sitFinul").append(sitFinul);
                    $("#ticketNum").text($("#sitFinul").children().length);
                    ticketNum = true;
                    $("#tickectPice").text($("#ticketNum").text() * ${tickectPrice});
                    $("#totalPrice").text($("#ticketNum").text() * ${tickectPrice} +2000);
                    $("#finull").text($("#ticketNum").text() * ${tickectPrice} +2000);

                    // 체크이미지로 변환
                    $(obj).attr({
                        'class':'son'
                    });
                };
            
            }else{
                $(obj).attr('checked', false);

                $(obj).attr({
                    'class':'s8'
                });

                var wIndex = checkList.indexOf("<li>"+ $(obj).attr("title") +"</li>");
                var xIndex = sitFinul.indexOf("<dd>"+ $(obj).attr("title") +"</dd>");

                console.log("지울값 인덱스: "+ wIndex);
                console.log("지울값 텍스트: "+"<li>"+ $(obj).attr("title") +"</li>");
                console.log("리스트 전체: "+ checkList);

                //클릭한 이미지 name값 list에서 지우기
                if(wIndex >= 0){
                    checkList.splice(wIndex ,1);
                    sitFinul.splice(xIndex ,1);
                }

                console.log("지우고 난 뒤 list"+ checkList);
                console.log("===============================================================");

                //li초기화
                $("#choiceSit ul").empty();
                $("#sitFinul").empty();
                $("#ticketNum").text("");
                $("#tickectPice").text("");
                $("#totalPrice").text("");
                $("#finull").text("");
                //list값 ul에 li로 추가
                $("#choiceSit ul").append(checkList);
                $("#sitFinul").append(sitFinul);
                $("#ticketNum").text($("#sitFinul").children().length);
                ticketNum = false;
                $("#tickectPice").text($("#ticketNum").text() * ${tickectPrice});
                $("#totalPrice").text($("#ticketNum").text() * ${tickectPrice} +2000);
                $("#finull").text($("#ticketNum").text() * ${tickectPrice} +2000);

            }
            
            // 체크이미지로 변하면서 title을 선택한 좌석ul에 li의 값으로추가
            
            
            
        }
                
        //체크표시 1층
        var checkList2 = [];
        var sitFinul2 = [];

        $(document).ready(function (){
            // 클릭하면 체크이미지로
            
            
            $('div[name=tk]').click(function (){
                if ($(this).attr("class") != "s13") {
                	s6ClickedEvent($(this));	
                }
            });

            //좌석 다시 선택 버튼
            $("#reChoice").click(function(){
                // 좌석 이미지 다 원래대로
                $(".son").attr({
                    'class':'s6'
                });
                //선택한 좌석 li 다 지우기
                $("#choiceSit ul").empty();
                $("#sitFinul").empty();
                $("#ticketNum").text("");
                ticketNum = false;
                $("#tickectPice").text("");
                $("#totalPrice").text("");
                $("#finull").text("");
                //배열 지우기
                checkList2.length = 0;
                sitFinul2.length = 0;
            });
        });
        

        function s6ClickedEvent(obj) {
            var checked = $(obj).attr('checked');
            
            if(!checked) {
                $(obj).attr('checked', true);


                if($(obj).attr("class") == "s6"){
                // list 추가
                    checkList2.push("<li>"+ $(obj).attr("title") +"</li>");
                    sitFinul2.push("<dd class = 'nodab'>"+ $(obj).attr("title") +"</dd>");

                    //li초기화
                    $("#choiceSit ul").empty();
                    $("#sitFinul").empty();
                    $("#ticketNum").text("");
                    // ticketNum = false;
                    $("#totalPrice").text("");
                    $("#finull").text("");
                    //list값 ul에 li로 추가
                    $("#choiceSit ul").append(checkList2);
                    $("#sitFinul").append(sitFinul2);
                    $("#ticketNum").text($("#sitFinul").children().length);
                    ticketNum = true;
                    $("#tickectPice").text($("#ticketNum").text() * ${tickectPrice});
                    $("#susu").text(2000);
                    $("#totalPrice").text($("#ticketNum").text() * ${tickectPrice} +2000);
                    $("#finull").text($("#ticketNum").text() * ${tickectPrice} +2000);
                    
                    // 체크이미지로 변환
                    $(obj).attr({
                        'class':'son'
                    });
                };
            
            }else{
                $(obj).attr('checked', false);

                $(obj).attr({
                    'class':'s6'
                });

                var wIndex = checkList2.indexOf("<li>"+ $(obj).attr("title") +"</li>");
                var xIndex = sitFinul2.indexOf("<dd>"+ $(obj).attr("title") +"</dd>");

                console.log("지울값 인덱스: "+ wIndex);
                console.log("지울값 텍스트: "+"<li>"+ $(obj).attr("title") +"</li>");
                console.log("리스트 전체: "+ checkList2);

                //클릭한 이미지 name값 list에서 지우기
                if(wIndex >= 0){
                    checkList2.splice(wIndex ,1);
                    sitFinul2.splice(xIndex ,1);
                }

                console.log("지우고 난 뒤 list"+ checkList2);
                console.log("===============================================================");

                //li초기화
                $("#choiceSit ul").empty();
                $("#sitFinul").empty();
                $("#ticketNum").text("")
                $("#tickectPice").text("")
                $("#totalPrice").text("")
                $("#finull").text("")
                //list값 ul에 li로 추가
                $("#choiceSit ul").append(checkList2);
                $("#sitFinul").append(sitFinul2);
                $("#ticketNum").text($("#sitFinul").children().length);
                ticketNum = false;
                // ticketNum = true;
                $("#tickectPice").text($("#ticketNum").text() * ${tickectPrice});
                $("#totalPrice").text($("#ticketNum").text() * ${tickectPrice} +2000);
                $("#finull").text($("#ticketNum").text() * ${tickectPrice} +2000);

            }
            
            // 체크이미지로 변하면서 title을 선택한 좌석ul에 li의 값으로추가
            
            $("#addticket").hide();
            $("#pbtn").click(function(){
                $("#addticket").dialog({
                    title: "공연예매권 등록/사용",
                    width: 440,
                    height: 400,
                    modal : true,
                    draggable: false,
                    resizable: false,
                    buttons: {
                        "확인": function() {
                            alert("예매권을 등록했습니다.");
                        },
                        "취소" : function() {
                            $("#addticket").dialog("close");
                        }
                    }                        
                });
            });

            // console.log($("#rb2").is(":checked"));
            $("#rb2").click(function(){
                $("#banksel").attr("disabled",false);
            })
            
            $("#rb1").click(function(){
                $("#banksel").attr("disabled",true);
            })
                
            }
        
        	
      
    </script>

</body>
</html>