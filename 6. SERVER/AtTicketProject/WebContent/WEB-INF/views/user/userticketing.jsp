<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        
        <%@include file="/WEB-INF/views/inc/asset.jsp" %>
        
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet"/>
        <link rel="shortcut icon" href="./images/favicon.ico" />
		<link rel="stylesheet" href="css/usermain.css" />

        <!-- Kakao Map -->
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e03849d7b36324a660633928754affe&libraries=services"></script>
    <style>
    
    #submenu {
    	/* display: block; */
    	top: 250px;
    }

    body { margin: 0 auto; }
        h1 { font-family: "Arial Black"; }
        #main { width: 100%; }
        #top {
            /* border: 1px solid black; */
            min-width: 1600px;
            height: 50px;
            /* margin: auto; */
            margin: 130px auto;
            margin-bottom: -185px;
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
            color: #333;
            text-align: center;
            font-size: 18px;
            padding: 40px 0;
            position: absolute;
            margin-top: -120px;
            font-weight: bolder;
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
            border-bottom: 1px solid #333;
            background-color: transparent;
            outline: none;
            color: 333;

        }

        /* 태그 */
        #tagsearch {
            border: 1px solid #111;
            width: 170px;
            height: 205px;
            position: relative;
            float: right;
            background-color: white;
            margin-right: 60px;
	        margin-top: 2px;
            /* text-align: center; */
            display: none;
	        /* top: 24px; */
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
            background-color: #FECA52;
        }
        #movetop a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 1.5em;
        }




/* ================================================================== */

        #middleMain {
            width: 1600px;
            border-bottom: 1px solid #333;
            background-color: white;
            /* margin-left: -100px; */
            z-index: 100;
        }

        #middleTop {
            width: 1600px;
            height: 120px;
            /* display: inline-block; */
            padding-top: 20px;
            /* text-align: center; */
            margin: auto;
        }

        #middleTop div:first-child{
            width: 80px;
            height: 80px;
            /* 이미지 넣기 */
            background-image: url(./images/consertPoster.jpg);
            background-size: 80px;
            border-radius: 40px;
            float: left;
            margin-left: 10px;
            margin-right: 20px;
        }

        #middleTop div:first-child::after{
            content: ' ';
            display: block;
            clear: both;
        }

        #mTName{
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #middleTop select {
            width: 240px;
            height: 30px;
            outline: none;
            border: 1px solid #bbb;
            border-radius: 5px;
            margin-right: 10px;
        }

        #mTTicketing {
            width: 250px;
            height: 40px;
            background-color: #FF7372;
            color: white;
            font-size: 20px;
            font-weight: bold;
            padding-top: 5px;
            margin-left: 60px;
            /* position: relative;
            left: 580px; */
            outline: none;
            border: none;
        }







        /* 예매페이지======================================================================================================================================================== */
        #mainsection{
            width: 1200px;
            margin: auto;
        }
        #maintop{
            /* position: absolute; 
            top: 100px; */
            margin: 130px auto;
            
        }

        #mainTitle {
            width: 1200px;
            border-bottom: 1px solid #333;
            /* width: 1200px; */
            padding: 20px 0px;
            /* padding-bottom: 20px; */
            /* color: #333; */
            
        }
        #mainTitleTop > div {
            /* border: 1px solid black; */
            float: left;
        }
        #mainTitleTop > div:nth-child(1) > a{
            text-decoration: none;
            color: #333;
        }
        #mainTitleTop > div:nth-child(2){
            border: 1px solid #FF7372;
            color: #FF7372;
            margin-left: 10px;
        }
        #mainTitleTop > div:nth-child(3){
            border: 1px solid #FECA52;
            background-color: #FECA52;
            color: white;
            margin-left: 10px;
        }
        #mainTitleTop::after{
            content: ' ';
            display: block;
            clear: both;
        }
        #mainTitleName{
            width: 1200px;
        }

        #mainTitleBottom > div{
            float: left;
        }

        #mainTitleBottom > #place{
            border-left: 1px solid gray;
            margin-left: 15px;
            padding-left: 15px;
        }

        #mainTitleBottom::after{
            content: ' ';
            display: block;
            clear: both;
        }

        .content{
            /* border: 1px solid black; */
            float: left;
        }

        #postrtbox {
            width: 430px; 
            height: 655px;
            border-bottom: 1px solid #ccc;
        }

        #poster{
            width: 430px; 
            height: 602px; 
            /* background-color: rgb(184, 201, 233); */
            /* background-image: url(./images/consertPoster.jpg); */
            background-image : url(./images/${dto.poster});
            background-size: 430px;
        }

        #contents{
            width: 700px; 
            height: 602px;
            margin-left: 70px;
            /* position: relative; */
        }
        #basic{
            border-bottom: 1px solid #333;
        }
        #basic  dt, #basic  dd {
            float: left;
            margin-bottom: 15px;
        }
        #basic  dt {
            width: 80px;
            font-weight: bold;
        }
        #cupon {
            cursor: pointer;
        }

        #dialog1 table{
            /* border: 1px solid black; */
            border-collapse: collapse;
            width: 400px;
            height: 85px;
        }
        #dialog1 thead {
            background-color: rgb(253, 224, 170);
        }

        #dialog1 td{
            border-top: 1px solid #333;
            border-bottom: 1px solid #333;
        }
        #dialog1 td:first-child{
            width: 270px;
        }
        #dialog1 td:nth-child(2){
            width: 100px;
            text-align: center;
        }

        #dialog1 table div {
            border: 1px solid #FF7372;
            width: 50px;
            height: 25px;
            text-align: center;
            color: #FF7372;
        }

        #price{
            width: 580px; 
            height: 60px; 
            background-color: #eee;
        }

        #basic::after {
            content: ' ';
            display: block;
            clear: both;
        }

        #price li {
            list-style: none;
            /* margin-top: -10px; */
            font-size: 15px;
        }
        #price li:first-child{
            /* margin-top: -9px; */
            padding-top: 8px;
            margin-bottom: 2px;
        }
        #price > ul span {
            color: #FF7372;
        }

        #basic2 {
            border-bottom: 1px solid #333;
            padding-bottom: 15px;
            margin-bottom: 40px;
        }

        #basic2 > dt{
            padding-top: 15px;
            font-weight: bold;
        }
        #basic2  dd{
            position: relative;
            /* left: -38px; */
        }
        #like {
            position: relative;
            top: 8px;
        }
        #like img {
            width: 40px; height: 40px;
            position: relative;
            /* top: 4px; */
        }
        #like img:hover {
        	cursor:pointer;
        }
        #like span:nth-child(2){
            color: #FECA52;
        }
        #benner {
            width: 700px;
            height: 180px;
            /* background-color: rgb(241, 231, 213); */
            background-image: url(./images/banner.png);
            background-size: 750px;
        }

        #contentsBox {
            height: 655px;
        }

        #contentsBox::after{
            content: ' ';
            display: block;
            clear: both;
        }

        #choicebox{
            /* border: 1px solid orange; */
            width: 1200px;
            height: 400px;
            margin-top: 70px;
        }

        #data, #sit{
            float: left;
        }

        #data {
            border: 1px solid #FECA52;
            width: 660px;
            height: 400px;
            padding: 50px;
        }

        #datatitle{
            border-bottom: 2px solid #333;
            padding-bottom: 12px;
        }

        #datatitle div{
            float: left;
        }

        #datatitle::after {
            content: ' ';
            display: block;
            clear: both;
        }


        #sit {
            border: 1px solid #ddd;
            border-left: 0px;
            width: 540px;
            height: 400px;
            padding: 50px;
        }

        #datasub {
            border: 2px solid #FECA52; border-radius: 15px;
            padding: 0px 11px;
            margin-top: 5px;
            margin-left: 10px;
            font-size: 12px;
        }
        #datasub > span{
            color: #FECA52;
        }

        /* 달력 */
        #celender {
            border-right: 1px solid #333;
            width: 300px;
        }

        .ui-widget-content {
            background: white url();
        }

        .ui-datepicker-inline {
            width: 260px;
            height: 260px;
            margin-top: 20px;
        }

         .ui-state-active {
            color: black;
         }

        #celender td, #celender th {
            border: none;
            background-color: white;
            color: black;
        }

        .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover{
            border-left: 0px;
            background: #FECA52;
            color: black;
        }

        #celender .ui-state-hover {
            background: #FECA52;
        }




        /* 시간 */
        #clock {
            width: 210px;
            height: 30px;
            position: relative;
            top: -255px;
            left: 330px;
            text-align: center;
            padding-top: 5px;
        }


        #inputTime li{
            border: 1px solid #333;
            width: 210px;
            height: 30px;
            text-align: center;
            margin-bottom: 5px;
            list-style: none;
            margin-left: -47px;
            padding-top: 3px;
        }

        #sittitle{
            border-bottom: 2px solid #eee;
            padding-bottom: 12px;
            color: #eee;
        }

        #sittitle div{
            float: left;
        }

        #sittitle::after {
            content: ' ';
            display: block;
            clear: both;
        }

        #sitbox {
            border: 1px solid #eee;
            width: 440px;
            height: 210px;
            margin-top: 30px;
            text-align: center;
            color: #FECA52;
            padding-top: 20px;
        }

        #ticketing {
            width: 180px;
            height: 40px;
            background-color: #FF7372;
            color: white;
            font-size: 20px;
            font-weight: bold;
            padding-top: 5px;
            margin: 60px 0px;
            position: relative;
            left: 580px;
            top: 10px;
            outline: none;
            border: none;
        }

        #tabs {
            width: 1200px;
            /* padding-bottom: 0px; */
            text-align: center;
            /* margin-top: 50px; */
        }

        .tabMenu {
            width: 171.4px;
            height: 70px;
            float: left;
            text-align: center;
            padding-top: 25px;
            color: #333;
            position: relative;
            top: 2px;
            font-weight: bold;
            font-size: 17px;
            margin-bottom: 8px;
        }
        .tabMenu:first-child{
            border-top: 8px solid #FECA52;
            color: #FECA52;
        }
        .tabMenu:nth-child(2){
            border-top: 8px solid #eee;
            
        }

        .tabss {
            border-top: 2px solid #FECA52;
            border-bottom: 2px solid #FECA52;
            /* border-top: 0px; */
            margin-top: 0px;
            padding-top: 50px;
            padding-bottom: 100px;
        }

        .tabss h2 {
            margin: 20px 0px;
            margin-top: 80px;
        }

        #company {
            border-top: 1px solid #333;
            border-bottom: 1px solid #ddd;
            border-collapse: collapse;
            width: 960px;
            height: 100px;
            margin: 150px auto;
        }
        #company td:first-child{
            border-right: 1px solid #bbb;
            background-color: #ddd;
            width: 180px;
            font-weight: bold;
        }
        #company td:last-child{
            text-align: left;
            padding-left: 30px;
        }

        #productInfo {
            border-top: 1px solid #333;
            border-bottom: 1px solid #ddd;
            border-collapse: collapse;
            width: 960px;
            height: 650px;
            margin: auto;
        }
        #productInfo td {
            border-bottom: 1px solid #bbb;
        }
        .tdGray {
            border-right: 1px solid #bbb;
            background-color: #ddd;
            background-color: #ddd;
            width: 180px;
            font-weight: bold;
        }
        #lasttd {
            text-align: left;
            padding: 0px 20px;
        }

        #cancel{
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            border-collapse: collapse;
            width: 600px;
            height: 190px;
            margin: 20px auto;
            text-align: center;
        }
        #cancel tr:first-child {
            background-color: rgb(253, 224, 170);
        }

        #ticketingCancle{
            /* float: left; */
        }

        .tCLeft {
            width: 250px;
            height: 400px;
            display: block;
            float: left;
            text-align: center;
        }
        .tCRight {
            display: block;
            width: 1100px;
            height: 400px;
            padding-top: 30px;
            position: relative;
            text-align: left;
        }

        #ticketingCancle::after{
            content: ' ';
            display: block;
            clear: both;
        }

        .tCTbl {
            border-collapse: collapse;
            width: 850px;
        }
        .tCTbl thead{
            background-color: rgb(253, 224, 170);
        }
        .tCTbl td {
            border-top: 1px solid #bbb;
            border-bottom: 1px solid #bbb;
            height: 40px;
            text-align: center;
        }
        .tCTbl td:first-child {
            width: 370px;
        }  

        #tabs {
            /* margin-bottom: 100px; */
            padding-bottom: 100px;
        }

        #container{
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            text-align: center;
            padding-top: 60px;
            margin-bottom: 100px;
        }

        #container h1 {
            margin: 30px;
        }

        #container small {
            margin-right: 20px;
        }

        #container span {
            font-size: 50px;
        }

        .rank1:nth-child(2){
            background-image: url("./images/consertRank1.jpg");
            width: 100px;
            height: 50px;
            background-color: black;
        }


        /* 예매페이지======================================================================================================================================================== */
        /* 맵 */
        .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap {position:relative;width:100%;height:350px;}
        #category {position:absolute;top:-100px;left:300px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 1;}
        #category li {float:left;list-style: none;width:100px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
        #category li.on {background: #eee;}
        #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
        #category li:last-child{margin-right:0;border-right:0;}
        #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
        #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
        #category li .bank {background-position: -10px 0;}
        #category li .mart {background-position: -10px -36px;}
        #category li .pharmacy {background-position: -10px -72px;}
        #category li .oil {background-position: -10px -108px;}
        #category li .cafe {background-position: -10px -144px;}
        #category li .store {background-position: -10px -180px;}
        #category li.on .category_bg {background-position-x:-46px;}
        .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
        .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
        .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
        .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
        .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
        .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
        .placeinfo .tel {color:#0f7833;}
        .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

        .reserv {
            cursor: pointer;
        }

        #rankingImg {
            /* background-image: url("http://tkfile.yes24.com/imgNew/sub/rn-tit-15456.png"); */
            background-image: url("${rankingImgUrl}");
            width: 207px;
            height: 175px;
            margin-bottom: 100px;
        }

        /* #ranking div:nth-child(3){
            width: 170px;
            height: 238px;
            background-image: url("./images/consertRank1.jpg");
            background-size: 170px;
        } */

        #ranking {
            /* padding-bottom: -100px; */
            /* margin-bottom: -100px; */
            height: 300px;
            border-bottom: 1px solid black;
        }

        .rank1 img {
            width: 170px;
            height: 238px;
        }

        .rank1 {
            float: left;
            position: relative;
            top: -270px;
            left: 250px;
            margin-right: 25px;
        }
        #ranking input {
            position: relative;
            right: 975px;
            top: -65px;
            outline: none;
            width: 100px;
            height: 30px;
            border: 1px solid #EC7D2C;;
            background-color: white;
            border-radius: 3px;
            color: #EC7D2C;
        }

        .num {
            width: 30px;
            height: 30px;
            border-radius: 25px;
            background-color: #EC7D2C;
            text-align: center;
            float: left;
            position: relative;
            top: -500px;
            left: 255px;
            margin-right: 165px;
        }

        .num span {
            padding-top: 5px;
            /* margin-top: 10px; */
            display: block;
            color: white;
        }


    </style>

</head>
<body>

    <div id="main">

        <!-- 2번째 상단부 -->
        <div id="middleMain">
            <div id="middleTop">
                <div></div>
                <div id="mTName">크리스토퍼 내한공연（CHRISTOPHER)</div>
                <select id="mTDate">
                    <option value="option1">날짜선택</option>
                    <option>2020-08-29(토)</option>
                    <option>2020-08-30(일)</option>
                </select>
                <select id="mTTime" disabled>
                    <option value="option1">시간선택</option>
                    <option>19:00</option>
                </select>
                <select id="mTAble" disabled>
                    <option value="option1">예매가능좌석</option>
                    <option>잔여석 정보 제공 안 함</option>
                </select>
                
        
  
                <input type="button" value="예매하기" id="mTTicketing">
   

            </div>
            
        </div>
        <!-------------------------------- 화면 상단부 -------------------------------->
        <%@include file="/WEB-INF/views/inc/usertopbar.jsp" %>
        
        <!-- <div id="top">
            <div id="topmenu">
                상단메뉴 좌측(메인화면으로 돌아가기)
                <a href="main.html" id="topleft"></a>
                상단메뉴 센터(콘서트, 뮤지컬, 연극, 클래식, 전시)
                <div id="topcenter">
                    <span data-lo="user_concert.html" class="menubar"
                        >콘서트</span
                    >
                    <span data-lo="user_musical.html" class="menubar"
                        >뮤지컬</span
                    >
                    <span data-lo="user_theater.html" class="menubar"
                        >연극</span
                    >
                    <span data-lo="user_classic.html" class="menubar"
                        >클래식</span
                    >
                    <span data-lo="user_Exhibition.html" class="menubar"
                        >전시</span
                    >
                </div>
                상단메뉴 우측(랭킹, 이벤트, 검색창, 마이페이지)
                <div id="topright">
                    <span data-lo="user_ranking.html" class="menubar"
                        >랭킹</span
                    >
                    <span data-lo="user_event.html" class="menubar"
                        >이벤트</span
                    >
                    <input
                        type="text"
                        value=""
                        id="search"
                        autocomplete="off"
                    />
                    <label
                        for="search"
                        class="glyphicon glyphicon-search"
                        style="font-size: 14px; cursor: pointer;"
                    ></label>
                    <div
                        class="glyphicon glyphicon-user"
                        id="mypage"
                        style="
                            font-size: 14px;
                            cursor: pointer;
                            margin: 0 10px;
                        "
                    ></div>
                </div>
                            검색 팝업
                            <div id="tagsearch">
                                <div id="tag">
                                    <span>태그 검색어 </span>
                                    <label
                                        id="tagremove"
                                        class="glyphicon glyphicon-remove"
                                    ></label>
                                </div>
                                <a href="#">#연극</a>
                                <a href="#">#뮤지컬</a>
                                <a href="#">#캣츠</a>
                                <a href="#">#00</a>
                                <a href="#">#서울 전시</a>
                                <a href="#">#서울 전시</a>
                                <a href="#">#서울 전시</a>
                                <span>2020.07.23 기준</span>
                            </div>
                        </div>
                    </div> -->
					
    <!-- 내용============================================================================================================================================= -->
    <%@include file="/WEB-INF/views/inc/usersidebar.jsp" %>
    <div id="mainsection">
        <div id="maintop">
            <!-- 타이틀 -->
            <div id="mainTitle">
                    <div id="mainTitleTop">
                        <div><a href="./main.html" target="_self">${dto.genre}</a></div>
                        <div>단독판매</div>
                    </div>
                    <div id="mainTitleName"><h1>${dto.title}</h1></div>
                    <div id="mainTitleBottom">
                        <div id="titledate">${dto.startDate} ~ ${dto.endDate}</div><!-- 여기서 정보를 받아와야 한다. -->
                        <div id="place">
                            <a href="./main.html"></a>${splaceName}
                        </div>
                    </div>
                </div>
            </div>

            <!-- 기본정보 -->
            <div id="contentsBox">
                <div class="content" id="postrtbox">
                <div class="content" id="poster"></div>
                
                <c:if test = "${not empty userid}">
                <div id="like">
                	<c:if test = "${likePush == 1}">
                    	<img src="./images/heart.png">
                    </c:if>
                    
                    <c:if test = "${likePush == 0}">
                    	<img src="./images/heart2.png">
                    </c:if>
                    <span id = "showLikeCount">${likeCount}</span> <span id = "likesWrite">Likes</span>
                </div>
                
                </c:if>
                
                </div>
                
                <style>
                	#showLikeCount {
                		font-size : 1.3em;	
                	}
                	
                	#likesWrite {
                		font-size : 1.3em;
                	}
                
                </style>
                
                <script>
	                //관심목록 -> 추가 하거나
	                $("#like img").click(function(){
	                	
	                	$.ajax({
	                		type : "GET",
	                		url : "/AtTicketProject/userheart.do",
	                		data : "showseq=" + ${dto.seq} + "&likeCount=" + $("#showLikeCount").text(),
	                		async: true,
	                		dataType: "json",
	                		success : function(result) {
								//서블릿에서 해결하고 다시 와야함.
								//alert("왜 안되는걸까?");
								//alert(result);
								//alert(result.img);
								$("#showLikeCount").text(result.likeCount);
								
								$("#like img").attr("src",result.img);
								
								
	                			
	                		},
	                		error : function(a,b,c) {
	                			console.log(a,b,c);
	                		}
	                	});
	                	
		
	                /* if($("#like img").attr("src") == "./images/heart2.png"){
	                    alert("이미 관심목록에 등록되어있습니다.");
	                } */
					
	                /* $("#like img").attr("src","./images/heart2.png"); */
	
	                });
	                
                </script>
                
                
                <div class="content" id="contents" >
                    <dl id="basic">
                        <dt>등급</dt>
                            <dd>${dto.age}세 이상 관람 가능</dd>
                        <div style="clear:both;"></div>
                        <dt>관람시간</dt>
                            <dd>총 ${showDuration} 분</dd>
                        <div style="clear:both;"></div>
                        <!-- <dt>출연</dt>
                            <dd> 크리스토퍼</dd> -->
                        <div style="clear:both;"></div>
                        <dt>가격</dt>
                            <dd id="price">
                                <ul>
                                    <li>지정석 type-A : <span>${ticketPc}</span>원</li>
                                    <li>지정석 type-B : <span>${ticketPc}</span>원 </li>
                                </ul>
                            </dd>
                        <div style="clear:both;"></div>
                        
                        <!-- 쿠폰 혜택 부분 -->
                        <c:if test="${not empty userid}">
                        <dt>혜택</dt>
                            <dd id="cupon">사용가능 쿠폰 (<span>${couponListLen}</span>)</dd>
                        </c:if>
                            <div id="dialog1">
                                <table>
                                    <thead>
                                        <td>쿠폰명</td>
                                        <td>할인</td>
                                        <td>다운</td>
                                    </thead>
                                    <c:forEach items = "${couponList}" var ="cdto">
                                    <tr>
                                        <td>${cdto.title}</td>
                                        <td>${cdto.discount} 원</td>
                                        <td><div class = "downCoupon" id = "${cdto.seq}">다운<span></span></div></td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                    </dl>
                    <style>
						.downCoupon:hover {
							cursor : pointer;
							background-color : red;
							color : white
						}
                    </style>
                    
                    <script>
                    	//쿠폰다운을 눌렀을때 처리해줄것이다.
                    	$(".downCoupon").click(function(){
                    		//alert($(this).attr("id"));
                    		var couponSeq = $(this).attr("id");
    	                	
                    		$.ajax({
    	                		type : "GET",
    	                		url : "/AtTicketProject/userdowncoupon.do",
    	                		data : "showseq=" + ${dto.seq} + "&couponseq=" + couponSeq,
    	                		async: true,
    	                		dataType: "json",
    	                		success : function(result) {
    								//서블릿에서 해결하고 다시 와야함.
    								if (result.pass == "success") {
    									alert("쿠폰이 발급되었습니다.");
    								} else {
    									alert("해당쿠폰을 이미 발급받으셨습니다.");
    								}

    	                		},
    	                		error : function(a,b,c) {
    	                			console.log(a,b,c);
    	                		}
    	                	});
                    	})
                    	
                    	
                    </script>
                    
                    <!-- 공연정보 -->
                    <dl id="basic2">
<!--                         <dt>공연시간 안내</dt>
                            <dd>2020년 8월 29일 (토) 오후 7시</dd>
                            <dd>2020년 8월 30일 (일) 오후 6시</dd> -->
                        <div style="clear:both;"></div>
                        <dt>배송정보</dt>
                            <dd>본 상품은 일괄배송 상품으로 공연시작 5일전부터 순차 배송됩니다.</dd>
                    </dl>
                    <div id="benner"></div>
                </div>
            </div>

            <!-- 날짜/시간 && 예매가능좌석-->
            <!-- 날짜/시간 -->
            <div id="choicebox">
                <div id="data">
                    <div id="datatitle">
                        <div style="font-size: 20px; font-weight: bold;">날짜/시간 선택</div>
                        <div id="datasub" >
                            관람<span>4시간전 까지</span>예매가능
                        </div>
                    </div>
                    <div id="datacontent">
                        <!-- 캘린더 -->
                        <div id="celender"> </div>
                        <!-- 시간 선택 -->
                        <div id="clock">
                  
                            <ul id="inputTime">
<!--                                 <li class = "testjammy" id ="round1">123123123</li>
                                <li class = "testjammy" id ="round2">123123123</li>
                                <li class = "testjammy" id ="round3">123123123</li>
                                <li class = "testjammy" id ="round4">123123123</li>
                                <li class = "testjammy" id ="round5">123123123</li> -->
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="sit">
                    <div id="sittitle">
                    <div style="font-size: 20px; font-weight: bold;">예매가능좌석</div>
                    </div>
                    <div id="sitbox">
                    </div>
                </div>
            </div>
            
            <c:if test = "${not empty userseq}">
            	<input type="button" value="예매하기" id="ticketing">
			</c:if>
			
			<c:if test = "${empty userseq}">
            	<input type="button" value="예매하기" id="ticketing" style = "visibility : hidden;">
			</c:if>
            <div id="tabs" style="text-align: center;">
                <!-- <ul>
                    <li><a href="#tab1">상세정보</a></li>
                    <li><a href="#tab2">예매/취소 안내</a></li>
                </ul> -->
                <div id="tabMenu">
                    <div class="tabMenu" data-tab="tab1">상세정보</div>
                    <div class="tabMenu" data-tab="tab2">예매/취소 안내</div>
                    <div style="clear:both;"></div>
                </div>
                <div id = "tab1" class="tabss">
                    <h2>유의사항</h2>
                    <p>※ 본 공연은 가상계좌 입금 마감 시간이 예매 당일 23시 29분이오니, 무통장 입금 선택 예매 시 착오 없으시기 바랍니다.<br>
                        ※ 본 공연은 네이버 쿠폰이 적용되지 않습니다.<br>
                        ※ 본 공연은 YES24공연에서 진행하는 할인쿠폰이벤트 대상에서 제외됩니다.</p>
                    <p>※ 매수제한 : 공연별 1인 4매<br>
                        ※ 일괄배송 : 8월 5일(수)</p>
                    <h2>할인정보</h2>
                    <p>※ 장애인(본인) 50%할인: 고객센터 전화예매시 1544-6399<br>
                        티켓은 현장에서 예매자 본인이 직접 증빙자료 확인 후 수령가능 (미지참 시 차액지불)</p>
                    <h2>공연정보</h2>
                    <img src="./images/${dto.content}">                    

                    <table id="company">
                        <tr>
                            <td>기획사 정보</td>
                            <td>${agencyHost}</td>
                        </tr>
                    </table>

                    <h2>상품정보제공 고시</h2>
                    <table id="productInfo">
                        <tr>
                            <td class="tdGray">주최/기획</td>
                            <td>${agencyManage}</td>
                            <td class="tdGray">소비자상담	</td>
                            <td>${agencyTel}</td>
                        </tr>
                        <tr>
                            <td class="tdGray">장르</td>
                            <td>${dto.genre}</td>
                            <td class="tdGray">관람등급</td>
                            <td>${dto.age}세 이상 관람 가능</td>
                        </tr>
                        <tr>
                            <td class="tdGray">공연시간</td>
                            <td>총 ${showDuration} 분</td>
                            <td class="tdGray">공연장소</td>
                            <td>${splaceName}<br>(${splace})</td>
                        </tr>
                        <tr>
                            <td class="tdGray">취소/환불방법</td>
                            <td colspan="3" id="lasttd">취소 일자에 따라 아래와 같이 취소수수료가 부과됩니다. 예매일보다 관람일 기준이 우선 적용되오니 유의해주시기 바랍니다.<br>
                                단, 예매 후 7일 이내라도 취소시점이 공연일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.<br>
                                (단, 상품에 따라 취소 정책이 달라질 수 있고, 각 공연이 공지하는 취소 정책이 우선 적용되므로, 예매 시 참고하시기 바랍니다.)
                                <table id="cancel" class="cancel">
                                    <tr>
                                        <td>취소일</td>
                                        <td>취소수수료</td>
                                    </tr>
                                    <tr>
                                        <td>예매 후 7일 이내</td>
                                        <td>없음</td>
                                    </tr>
                                    <tr>
                                        <td>예매 후 8일 ~ 관람일 10일 전까지</td>
                                        <td>장당 4,000원(단, 티켓 금액의 10% 이내)</td>
                                    </tr>
                                    <tr>
                                        <td>관람일 9일 전 ~ 관람일 7일 전까지</td>
                                        <td>티켓 금액의 10%</td>
                                    </tr>
                                    <tr>
                                        <td>관람일 6일 전 ~ 관람일 3일 전까지</td>
                                        <td>티켓 금액의 20%</td>
                                    </tr>
                                    <tr>
                                        <td>관람일 2일 전 ~ 취소마감일시까지</td>
                                        <td>티켓 금액의 30%</td>
                                    </tr>
                                </table>
                                예매수수료는 예매 당일 밤 12시 이전 취소 시에만 환불되며, 그 이후 기간에는 환불되지 않습니다.<br>
                                취소는 MY공연>예매확인/취소 에서 직접 취소 또는 고객센터(1544-6399)를 통해 취소 가능합니다.<br>
                                티켓이 배송된 후에는 PC/모바일 취소가 불가, 취소마감시간 이전에 예스24 고객센터로 티켓이 반송되어야 취소 가능합니다.<br>
                                (취소수수료는 티켓 도착일 기준으로 부과되며, 배송비는 환불되지 않습니다.)<br>
                                각 상품별로 취소 정책이 다르게 적용될 수 있으니, 각 상품 안내 사항을 확인해주시기 바랍니다.
                            </td>
                        </tr>
                    </table>
                </div>
                <div id = "tab2" class="tabss">
                    <div id="ticketingCancle">
                        <div class="tCLeft"><h2>예매</h2></div>
                        <div class="tCRight"> 
                            <p>       
                                예매는 PC, 모바일, 고객센터 를 통해 신용카드, 가상계좌(무통장 입금), YES머니, YES상품권, 예치금 등으로 예매하실 수 있습니다.<br>
                                (단, 상품마다 사용 가능한 결제 수단이 다르게 적용될 수 있으니 상품 상세페이지 안내 사항을 확인해주세요.)<br>
                                무통장입금 결제 선택 시 입금 마감시간은 예매일 익일 밤 11시 29분까지입니다. 입금 마감시간 내 미입금 된 경우 예매가 자동 취소됩니다.<br>
                                (단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시 확인해주시기 바랍니다.)
                                예매수수료는 다음과 같습니다.
                            </p>
                            <table class="tCTbl">
                                <thead>
                                    <td>장르</td>
                                    <td>PC / 모바일</td>
                                    <td>전화예매</td>
                                </thead>
                                <tr>
                                    <td>콘서트, 뮤지컬, 클래식, 국악, 무용</td>
                                    <td>장당 1,000원</td>
                                    <td rowspan="3">장당 2,000원</td>
                                </tr>
                                <tr>
                                    <td>연극, 전시</td>
                                    <td>장당 500원</td>
                                </tr>
                                <tr>
                                    <td>체험, 행사</td>
                                    <td>장당 300원</td>
                                </tr>
                            </table>
                        </div>
                        <div class="tCLeft"><h2>티켓수령방법</h2></div>
                        <div class="tCRight"> 
                            <p>
                                <spna style="font-weight: bold;">현장수령</spna><br>
                                티켓은 예매자 본인 수령이 기본 원칙입니다.<br>
                                공연 당일 예매확인서와 예매자의 신분증 을 지참하신 후 공연장 매표소에서 티켓을 수령하시면 됩니다.<br>

                                <spna style="font-weight: bold;">배송</spna><br>
                                배송을 선택하신 경우 예매완료(결제익일) 기준 5~7일 이내에 예매 시 입력하신 주소로 배송됩니다.(영업일 기준)<br>
                                일괄배송의 경우 각 상품의 지정된 배송일자 기준으로 배송이 시작됩니다. 배송 시작일은 상세정보 및 예매공지사항에서 확인할 수 있습니다.<br>
                                지역 및 배송 서비스 사정에 따라 배송사가 변경될 수 있으며, 배송일이 추가적으로 소요될 수 있습니다.(CJ대한통운, 우체국 외 1개 업체)<br>
                                * 티켓 수령과 관련된 정책은 상품별로 상이하니 자세한 내용은 각 상품 상세정보에서 확인 부탁드립니다.
                            </p>
                        </div>
                        <div class="tCLeft"><h2>취소마감시간</h2></div>
                        <div class="tCRight"> 
                            <table class="tCTbl">
                                <thead>
                                    <td>공연 관람일</td>
                                    <td>취소 마감일</td>
                                </thead>
                                <tr>
                                    <td>화요일 ~ 토요일</td>
                                    <td>관람일 전일 평일 오후 5시</td>
                                </tr>
                                <tr>
                                    <td>일요일 ~ 월요일</td>
                                    <td>토요일 오전 11시</td>
                                </tr>
                                <tr>
                                    <td>공휴일 및 공휴일 익일</td>
                                    <td>공휴일 전일이 평일인 경우 - 오후 5시<br>
                                        공휴일 전일이 토요일, 일요일인 경우 - 토요일 오전 11시<br>
                                        공휴일에는 예매 취소 불가</td>
                                </tr>
                                <p>관람일 당일 예매하신 건은 취소, 변경, 환불 불가합니다.<br>
                                    배송이 시작된 티켓의 경우 티켓이 예스24 공연 고객센터로 취소마감시간 이전까지 반송되어야 취소 가능합니다.(취소수수료는 도착일 기준으로 부과됩니다.)<br>
                                    결제수단을 복수로 선택한 경우 인터넷으로 부분취소가 불가하오니, 고객센터로 문의해주시기 바랍니다.</p>
                            </table>
                        </div>
                        <!-- <div class="tCLeft"><h2>취소수수료</h2></div> -->
                        <div class="tCRight"> 

                        </div>
                        <!-- <div class="tCLeft"><h2>환불</h2></div> -->
                        <div class="tCRight"> 

                        </div>
                    </div>
                 
                </div>
            </div>
            
            <!-- 맵 -->
            <div id="container">

                <span class="glyphicon glyphicon-map-marker"></span>
                <h1>${splaceName}</h1>
                <small>${splace}</small>
                <small>${agencyTel}</small>
                <!-- <small>http://yes24livehall.com</small> -->

                <div style="height: 600px;">
                    <div style="width: 1200px; height: 200px;  margin: 150px auto;">
                        <div class="map_wrap">
                <div id="map" style="width:1000px;height:500px;position:relative;  overflow:hidden; margin: 0px auto;"></div>
                <ul  id="category">
                    <li class="sellist" id="SW8" data-order="0"> 
                        <img style="width: 30px;" src="./images/metro.png" alt=""><br>
                        지하철
                        
                    </li>       
                    <li class="sellist" id="FD6" data-order="1"> 
                        <img style="width: 30px;" src="./images/food.png" alt=""><br>
                        음식점
                    </li>  
                    <li class="sellist" id="PM9" data-order="2"> 
                        <img style="width: 30px;" src="./images/yakguk.png" alt=""><br>
                        약국
                    </li>  
                    <li class="sellist" id="AD5" data-order="3"> 
                        <img style="width: 30px;" src="./images/hotel.jpg" alt=""><br>
                        숙박
                    </li>  
                    <li class="sellist" id="CE7" data-order="4"> 
                        <span class="category_bg cafe"></span>
                        카페
                    </li>  
                    <li class="sellist" id="CS2" data-order="5"> 
                        <span class="category_bg store"></span>
                        편의점
                    </li>      
                </ul>
            </div>
                    </div>
                    </div>

            </div>

            <div id="ranking">
                <div id="rankingImg"></div>
                <input type="button" value="더보기" onclick = "location.href = '/AtTicketProject/userranking.do?sort=${dto.genre}';">
                <c:forEach items = "${bigFiveImgList}" var ="imgdto">
                <div class="rank1" id = "${imgdto.seq}"><img src="./images/${imgdto.imgName}"></div>
                </c:forEach>
                <div style="clear:both;"></div>
                <div class="num"><span>1위</span></div>
                <div class="num"><span>2위</span></div>
                <div class="num"><span>3위</span></div>
                <div class="num"><span>4위</span></div>
                <div class="num"><span>5위</span></div>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
            
            <style>
				
				.rank1:hover {
				cursor : pointer;
				}
				
            </style>
            
            <script>
            	$(".rank1").click(function(){
            		//alert($(this).attr("id"));
            		location.href = "/AtTicketProject/usertickekting.do?seq=" + $(this).attr("id");
            	})
            	
            
            </script>
            
            
            
            <!-- 챗봇 : 단비봇 --------------------------------------------------------------------------------------------------------------------------------->
            <%@include file="/WEB-INF/views/inc/userchat.jsp" %>

 <!--         <img src="./images/face35.png" id="chatbot">
             <div id="frogue-container" class="position-right-bottom"
                data-chatbot="e4957de9-dad9-448d-a709-e43eeb644f63"
                data-user="사용자ID"
                data-init-key="value">
            </div>
  
            <script>
                (function(d, s, id){
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) {return;}
                    js = d.createElement(s); js.id = id;
                    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'frogue-embed'));
            </script>  -->


            
            <!-- 제일 위로 돌아가기 버튼 -->
            <div id="movetop"><a href="#top">↑</a></div>
        </div>
        
		<!-------------------------------- 화면 하단부 -------------------------------->
        <%@include file="/WEB-INF/views/inc/userbottombar.jsp" %>
<!--         <div id="bottom">
            <div>
                회사 마크
                <img src="./images/title2.png"/>
            </div>
            <div class="txt">
                <p class="black">At-Ticket (주)</p>
                <p>서울시 강남구 역삼동 한독빌딩 8층 대표: 한시연 | 개인정보보호책임자: 한시연</p>
                <p>it1234@atticket.com 사업자등록번호 229-81-37000</p>
                <p class="black">Copyright &copy; At-Tickey Corp. All Rights Reserved.</p>
            </div>
            <div id="service">
                <p><span>☎</span> 고객센터 전화상담</p>
                <p>1544-6399</p>
                <p>평일 09:00 ~ 18:00</p>
                <p>토요일 09:00 ~ 17:00</p>
                <p>일요일 공휴일 휴무</p>
            </div>
        </div>
        
    </div> -->

            <!-- <div id="place"></div> -->
            
     	<!-- <form method = "POST" action = "/AtTicketProject/userticketpage.do" id = "roundShowInfo" style = " visibility : hidden;">
 			<input type="submit" id = "throwSubmit">
 		</form> -->        
            

	<!-- 애는 추후에 다시 처리할것이다. -->
	<style>
		.timeRound:hover {
			cursor : pointer;
		}
	</style>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1785ef08d0443cdeee98d927c39145d8libraries=services"></script>
    <script src="js/slick.min.js"></script>
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

        //검색창 커서 있을때 팝업 띄우기
            $("#search").focusin(function () {
            $("#tagsearch").css("display", "block");
            $("#search").css("border-bottom", "2px solid black");
        });
        //검색창 팝업 닫기
        $("#search").focusout(function () {
            $("#tagsearch").css("display", "none");
        });
        $("#tagremove").click(function () {
            $("#tagsearch").css("display", "none");
        });


        var flag = false;
 
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

        //쿠폰
        $("#dialog1").hide();

        $("#cupon").click(function(){

            $("#dialog1").dialog({
                title:"본 공연에 발급된 쿠폰입니다",
                width:450,
                height:170,
                draggable:false,
                resizable:false
                // position:[900,100]
            });

        });


        // 캘린더
        // $("#celender").datepicker({
        // dateFormat:"yy-mm-dd",
        // minDate : "2020-08-29",
        // maxDate : "2020-08-30"
        // });
		
        /* 날짜 */
        $("#celender").datepicker({
	            dateFormat: "yy-mm-dd",
	            //minDate : "2020-09-01",
	            //maxDate : "2020-12-12",
	            minDate: "${minDateInfo}",/* 오늘날짜로 해야한다. */
	            maxDate: "${dto.endDate}",
	            altField: ".alternate",
	            altFormat: "yy.mm.dd(D)",
	            dayNamesShort: ["일","월","화","수","목","금","토"],

                // defaultDate: new Date('2020-08-30'),

                // setDate: "2020-08-30",
				
                
                //여기가  달력을 클릭할때 생기는 이벤트.
                onSelect: function(dateText) { 
                	
                	//alert("asd");
                	//alert(dateText);//2020-03-08 이런식으로 보임
                	$("#inputTime").empty();
                	/* $("#inputTime").append("<li>[1]회 19시 00분</li>"); */
                	 $("#data").css("border","1px solid #FECA52");
    	             $("#sit").css("border","1px solid #eeeeee");
                	 $("#sittitle").css("border-bottom","2px solid #EEEEEE");
    	             $("#sittitle").css("color","#EEEEEE");
    	             $("#sitbox").css("border","1px solid #EEEEEE");
    	             $("#sitbox").empty();
                	
                	
                	$.ajax({
                		type : "GET",
                		url : "/AtTicketProject/usersemishowreservation.do",
                		data : "showseq=" + ${dto.seq},
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
                	
					
                	
/*                 	$(document).on('click', '.testjammy', function(){
                		alert("된다된다된다 안심이된다");
                	} */

//$(document).on('click', '. everdevel', function(){
/*                     $("#inputTime li").click(function(){
                        $("#inputTime li").css({
                            "background-color":"white",
                            "color": "#424242"
                            })
                        // $(this).css("background-color","#FF6D6D");
                        $(this).css({
                            "background-color": "#FECA52",
                            "color": "white"
                        });
                        console.log($(this).text());
                        $("#choicInfo dd:nth-child(5)").text($(this).text());
                        clickNum = true;
                    });  */
                
                },
            });
                	
            
                	
            function testClick() {
            	
            	$(".timeRound").click(function(){
            		
            		
            		$(".timeRound").css("background-color","#FFF");//모든 회차 배경을 하얀색으로 돌리고 밑에서 색을 다시 돌린다.
            	
    				//alert($(this).attr("id"));
    				$(this).css("background-color","#FECA52");
    				
    	             //$("#clock").css("background-color","#FECA52");
    	             //$("#clock").css("border","#FECA52");
    	             //$("#clock").css("color","white");
    	             $("#data").css("border","1px solid #eeeeee");
    	             $("#sit").css("border","1px solid #FECA52");
    	             $("#sittitle").css("border-bottom","2px solid black");
    	             $("#sittitle").css("color","black");
    	             $("#sitbox").css("border","1px solid black");
    	             
    	             if($("#sitbox").empty()){
    	                 $("#sitbox").append("본 공연은 잔여좌석 서비스를 제공하지 않습니다.")
    	             }
    				
    			}); 
            }
			

        //탭
        // $("#tabs").tabs({
        //     active: 0 // 기본적으로 선택할, 탭들은 독립이야 
        // });


        //시간 선택 후 예매가능좌석 선택 가능
        

        
/*          $("#inputTime").click(function(){
				
             $("#clock").css("background-color","#FECA52");
            $("#clock").css("border","#FECA52");
            $("#clock").css("color","white");
            $("#data").css("border","1px solid #eeeeee");
            $("#sit").css("border","1px solid #FECA52");
            $("#sittitle").css("border-bottom","2px solid black");
            $("#sittitle").css("color","black");
            $("#sitbox").css("border","1px solid black"); 
            if($("#sitbox").empty()){
                $("#sitbox").append("본 공연은 잔여좌석 서비스를 제공하지 않습니다.")
            }
        });  */

        // 맵=========================================================

        // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
        var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
        contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
        markers = [], // 마커를 담을 배열입니다
        currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
            
    
    
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 
        
        
        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places(map); 
        
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
        
        
        
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${splace}', function(result, status) {
        
            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
        
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
        
                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${splaceName}</div>'
                });
                infowindow.open(map, marker);
        
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });    
        // 지도에 idle 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'idle', searchPlaces);
        
        // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
        contentNode.className = 'placeinfo_wrap';
        
        // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
        // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
        addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
        addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
        
        // 커스텀 오버레이 컨텐츠를 설정합니다
        placeOverlay.setContent(contentNode);  
        
        // 각 카테고리에 클릭 이벤트를 등록합니다
        addCategoryClickEvent();
        
        // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
        function addEventHandle(target, type, callback) {
            if (target.addEventListener) {
                target.addEventListener(type, callback);
            } else {
                target.attachEvent('on' + type, callback);
            }
        }
        
        // 카테고리 검색을 요청하는 함수입니다
        function searchPlaces() {
            if (!currCategory) {
                return;
            }
            
            // 커스텀 오버레이를 숨깁니다 
            placeOverlay.setMap(null);
        
            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
        }
        
        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
        
                // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
                displayPlaces(data);
            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
            } else if (status === kakao.maps.services.Status.ERROR) {
                // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
                
            }
        }
        
        // 지도에 마커를 표출하는 함수입니다
        function displayPlaces(places) {
        
            // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
            // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
            var order = document.getElementById(currCategory).getAttribute('data-order');
        
            
        
            for ( var i=0; i<places.length; i++ ) {
        
                    // 마커를 생성하고 지도에 표시합니다
                    var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
        
                    // 마커와 검색결과 항목을 클릭 했을 때
                    // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                    (function(marker, place) {
                        kakao.maps.event.addListener(marker, 'click', function() {
                            displayPlaceInfo(place);
                        });
                    })(marker, places[i]);
            }
        }
        
        // 마커를 생성하고 지도 위에 마��를 표시하는 함수입니다
        function addMarker(position, order) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                    marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage 
                });
        
            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다
        
            return marker;
        }
        
        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }   
            markers = [];
        }
        
        // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
        function displayPlaceInfo (place) {
            var content = '<div class="placeinfo">' +
                            '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
        
            if (place.road_address_name) {
                content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                            '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
            }  else {
                content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
            }                
        
            content += '    <span class="tel">' + place.phone + '</span>' + 
                        '</div>' + 
                        '<div class="after"></div>';
        
            contentNode.innerHTML = content;
            placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
            placeOverlay.setMap(map);  
        }
        
        
        // 각 카테고리에 클릭 이벤트를 등록합니다
        function addCategoryClickEvent() {
            var category = document.getElementById('category'),
                children = category.children;
        
            for (var i=0; i<children.length; i++) {
                children[i].onclick = onClickCategory;
            }
        }
        
        // 카테고리를 클릭했을 때 호출되는 함수입니다
        function onClickCategory() {
            var id = this.id,
                className = this.className;
        
            placeOverlay.setMap(null);
        
            if (className === 'on') {
                currCategory = '';
                changeCategoryClass();
                removeMarker();
            } else {
                currCategory = id;
                changeCategoryClass(this);
                searchPlaces();
            }
        }
        
        // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
        function changeCategoryClass(el) {
            var category = document.getElementById('category'),
                children = category.children,
                i;
        
            for ( i=0; i<children.length; i++ ) {
                children[i].className = '';
            }
        
            if (el) {
                el.className = 'on';
            } 
        } 

        // ==============================================================
        $("#middleMain").hide();

        var flag = false;

        $(document).scroll(function() {
            // if(!flag) {
                if ($(document).scrollTop() > $("#ticketing").position().top) {
                    $("#middleMain").css({
                        display: "block",
                        width: "100%",
                        position: "fixed",
                        top: "0px",
                        // bottom: "",
                        zIndex: "2"
                    });  
                    $("#submenu").css("display", "block");
                }
                if ($(document).scrollTop() < $("#ticketing").position().top) {
                    $("#middleMain").hide();
                    $("#submenu").css("display", "none");
                }
            // }
        });

        $("#mTDate").change(function() {
            var state = $("#mTDate option:selected").val();
            if (state != 'option1'){
                $("#mTTime").attr('disabled', false);
            }
        });
        $("#mTTime").change(function() {
            var state = $("#mTTime option:selected").val();
            if (state != 'option1'){
                $("#mTAble").attr('disabled', false);
            }
        });

        // 탭메뉴
        $(".tabss").css("display","none");
        $("#tab1").css("display","block");

            $(".tabMenu").click(function(){
                // alert(this);
                $(".tabMenu").css({
                    "border-top" : "8px solid #ddd",
                    "color": "black"
                })
                $(this).css({
                    "border-top" : "8px solid #FECA52",
                    "color": "#FECA52"
                })

                $(".tabss").css("display","none");
                $('#'+$(this).attr("data-tab")).css("display","block");

        });

        // 예매하기 링크1 -> 예매 페이지를 열어준다.
        $("#ticketing").click(function(){
            //window.open("/AtTicketProject/userticketpage.do", "PopupWin", "width=1000,height=672");
            popupCenter("/AtTicketProject/userticketpage.do?showSeq=${dto.seq}",1000,672);
            //$("#throwSubmit").attr("type","submit")throwSubmit
        	//onSubmit();
        	//$("#throwSubmit").trigger("click");
        });
        
        // 예매하기 링크2
        $("#mTTicketing").click(function(){
            window.open("/AtTicketProject/userticketpage.do", "PopupWin", "width=1000,height=672");
        });
        
        // 랭킹 링
        // $("#ranking input")click(function(){
        //	$(location).attr('href','/AtTicketProject/userranking.do');
        // }); 
		
        
        
        //팝업 중앙정렬 알고리즘 
	    function popupCenter(href, w, h) {
	    	
	    	var popupX = (window.screen.width / 2) - (w / 2);
	    	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	    	var popupY= (window.screen.height /2) - (h / 2);
	    	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	    	window.open(href, "pop_name", 'status=no, height=680, width=1000, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
        
        }
        
        
/* 	    function onSubmit(){
	    	 var myForm = document.popForm;
	    	 var url = "/AtTicketProject/userticketpage.do";
	    	 window.open(url ,"popForm",
	    	       "toolbar=no, width=540, height=467, directories=no, status=no,scrollorbars=no, resizable=no");
	    	 myForm.action =url;
	    	 myForm.method="post";
	    	 myForm.target="popForm";
	    	 myForm.testVal = 'test';
	    	 myForm.submit();
	    	} */

	    	
            //로그인 java 로 이동
            $("#login").click(function() {
                location.href = "/AtTicketProject/userlogin.do";
            });
            
            //로그아웃 java 로 이동
            $("#logout").click(function() {
                location.href = "/AtTicketProject/userlogout.do";
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

	

        </div>
    </div>



</body>
</html>
