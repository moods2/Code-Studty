<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
 <!DOCTYPE html>
<html lang="en">

<head>

    <style>
        @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); }

        * { outline: none; }

        body{
            font-family: 'NanumBarunGothic';
        }
        html{
            width: 500px;
            height: 200px;
        }

        #title{
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            width: 430px;
            border-bottom: 1px dashed black;
        }

        h1{
            font-weight: bold;
            font-family: Arial;
            /* font-size: 3em;  */
            color: #555;
        }

        #content {
            /* border: 1px solid red; */
            width: 400px;
            height: 200px;
          
        }

        #add {
            width: 400px;
            /* height: 100px; */
            position: relative;
            left: 40px
            /* margin: 20px auto; */
            
        }
        #content > #add > div {
            margin: 10px;

        }
        #content > #add > div > label {
            margin: 5px;
        }

        .subtitle {
            font-size: 14px;
            font-weight: bold;
            margin-left: 20px;
        }
        #btns {
            position: relative;
            left: 82px;
            top: 0px;
        }
        #btns > input {
            margin: 5px;
        }
    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>adminShowAdd_hall</title>
</head>

<body>

    <div id = "title">
        <h3>계좌 추가</h3>
    </div>

    <div id="content">
        <fieldset id="add" class="form-control" style="border: 0px;">
            <!-- <legend class="form-control">공연 정보 추가하기</legend> -->
            
            <form method="POST" action="/AtTicketProject/adminbankaddok.do">
            <div>
                <label for="txtbank">은행 이름 : </label>
                <input type="text" id="txtbank" name="name">
            </div>
            <div>
                <label for="txtaccount">계좌 번호 : </label>
                <input type="text" id="txtaccount" name="account">
            </div>
            
            
            <div id="btns">
                <input type="submit" id="btnok" value="확인" class="btn btn-default">
                <input type="button" id="btnclose" value="닫기" class="btn btn-default">
            </div>
            
            </form>
        </fieldset>
    </div>




</body>
<script>


    $("#btnclose").click(function() {
        window.close();
    });

    

</script>

</html>