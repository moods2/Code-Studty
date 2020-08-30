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
    <style>

        body {
            background-color: #F8F8F8;
        }
        #top {
            /* border: 1px solid black; */
            width: 900px;
            height: 100px;
            margin: 50px auto;
            margin-top: 20px;
        }
        #topleft {
            display: inline-block;
            /* border: 1px solid white; */
            width: 100px;
            height: 65px;
            background-image: url("./images//title.png");
            background-repeat: no-repeat;
            background-position: center center;
            cursor: pointer;
        }
        #topleft + h1 {
            font-size: 25px;
            font-weight: bold;
            display: inline-block;
            position: relative;
            top: -10px;
            left: 10px;
            color: #333;
        }
        #middle {
            border: 1px solid #C8C8C8;
            border-radius: 10px;
            background-color: white;
            width: 900px;
            height: 450px;
            margin: 0 auto;
            margin-top: -50px;
            margin-bottom: 100px;
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 50px;
        }
        #menu {
            border-bottom: 1px solid #EBEBEB;
        }
        #menu > ul {
            list-style: none;
            padding: 0;
            text-align: center;
            margin-bottom: 0;
        }
        #menu > ul > li {
            display: inline-block;
            font-size: 17px;
            font-weight: bold;
            padding: 15px 0px 10px 0px;
            cursor: pointer;
        }
        #menu > ul > li:first-child {
            margin-right: 40px;
            color: #196AB3;
            border-bottom: 3px solid #196AB3;
        }
        #menu + div > div:first-child { margin-top: 50px; margin-bottom: 20px; }
        #menu + div > div h1 {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        #menu + div > div p {
            text-align: center;
            font-size: 13px;
        }
        #recheck {
            border: 1px solid #EBEBEB;
            background-color: #F8F8F8;
            width: 500px;
            text-align: center;
            margin: 0 auto;
            padding: 20px 0px;
        }
        .txt, #enter {
            margin: 0px auto;
            padding: 10px;
            width: 420px;
            display: block;
            margin-bottom: 10px;
            outline: none;
            border: 1px solid #D8D8D8;
            border-radius: 3px;
            font-weight: bold;
        }
        #enter { margin-bottom: 0; }
        #recheck + div {
            width: 500px;
            margin: 20px auto;
            text-align: center;
        }
        #findpassword { outline: none; }

        #footer {
            width: 900px;
            margin: 0 auto;
        }
        #copyright {
            text-align: center;
            color: #666;
            margin-top: -70px;
            letter-spacing: -.1px;
        }
        #copyright > span {
            font-weight: bold;
        }
        #menu > ul > li:hover {
            color: #196AB3;
        }
        #mypage {
            float: right;
            position: relative;
            top: 30px;
            outline: none;
        }

    </style>
</head>
<body>
    
    <div id="top">
        <!-- 상단메뉴 좌측(메인화면으로 돌아가기) -->
        <a href="/AtTicketProject/userindex.do" id="topleft"></a>
        <!-- 상단메뉴 좌측(로그인 문구) -->
        <h1>나의 정보</h1>
        <!-- 상단메뉴 우측(마이페이지로 돌아가기) -->
        <input type="button" value="마이페이지" class="btn btn-default" id="mypage">
    </div>
    <div id="middle">
        <div id="menu">
            <ul>
                <li>회원정보</li>
                <li id="withdraw">회원탈퇴</li>
            </ul>
        </div>
        <div>
            <div>
                <h1>비밀번호 재확인</h1>
                <p>개인정보보호를 위해 회원님의 비밀번호를 다시 한번 확인합니다.</p>
            </div>
            <div id="recheck">
            
            <form method="POST" action="/AtTicketProject/mypagememberinfoend.do">
                <div>
                    <input type="text" class="txt" value="${userid}" readonly>
                    <input type="password" class="txt" id="password" name="password" autofocus="">
                    <input type="submit" class="btn btn-primary" id="enter" value="확인">
                </div>
            </form>
            
            </div>
            <div>
                <button class="btn btn-default btn-xs" id="findpassword">비밀번호 찾기</button>
            </div>
        </div>
    </div>
    <div id="footer">
        <div id="copyright">
            Copyright &copy; <span>AT-Ticket Corp.</span> All rights reserved.
        </div>
    </div>
    

    <script>

        //마이페이지로 이동
        $("#mypage").click(function() {
            location.href = "/AtTicketProject/usermypage.do";
        });

        //회원탈퇴 페이지로 이동
        $("#withdraw").click(function() {
            location.href = "/AtTicketProject/memberinfodelete.do";
        });

        //비밀번호 입력 후 확인 클릭시
        /* $("#enter").click(function() {

            if ($("#password").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#password").focus();
                return false;
            } elsf if ($("#password").val() != ${userpw}) {
            	alert("비밀번호를 확인해주세요.");
            	$("#password").focus();
                return false;
            }
            
            location.href = "/AtTicketProject/memberinfofix.do";

        }); */

    </script>


</body>
</html>